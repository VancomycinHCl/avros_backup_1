/**
* @file        memory.c
* @brief		堆空间管理器的实现
* @details	    This is the detail description.
* @author		Xuanzhi Liu
* @date		2024/01/26 12:41:27
* @version	    v1.0
*/

#include "memory.h"

/**
 * @brief 堆空间的声明，在bss段且只有该源文件有直接操作内存的接口
 * 
 */
static uint8_t heap_memory[GLOBAL_HEAP_SIZE];
static uint32_t available_memory_size = GLOBAL_HEAP_SIZE;
static uint32_t history_available_min_memory_size = GLOBAL_HEAP_SIZE;

static block_memory_head    start_memory_block;     // This is a start block of the heap memory
static block_memory_head*   end_memory_block_ptr;   // This is a pointer pointed to the end block in heap pool

/*
*   HEAP MEMORY ALLOCATION MAP
*   
*   history_available_min_memory_size
*   available_memory_size
*   start_memory_block          <- outside heap memory pool
*    
*   ---------------------       <- heap_memory[GLOBAL_HEAP_SIZE]
*   |block_memory_head  |       <- inside heap memory pool
*   |heap_used_memory   |
*   |block_memory_head  |
*   |heap_used_memory   |
*   |       ......      |
*   |end_memory_block   |
*   ---------------------       <- end address of heap_memory[GLOBAL_HEAP_SIZE]
*   
*/

/*
*
*   -------------------------------------------------
*   |  block_memory_head* next_memory_block_ptr     |
*   |  [Hi:Hi-1]Is_used [Hi-1:0]size_memory_block   |
*   -------------------------------------------------
*/

static inline void merge_memory_block(block_memory_head* current_memory_block_ptr)
{
	// block_memory_head* next_block_after_merge_ptr = NULL;
	size_t current_memory_block_size = 0;
	current_memory_block_size = BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr) + \
	BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr->next_memory_block_ptr) + \
	SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
	BLOCK_MEMORY_SET_AVAILABLE_SIZE(current_memory_block_ptr,current_memory_block_size);
	current_memory_block_ptr->next_memory_block_ptr = current_memory_block_ptr->next_memory_block_ptr->next_memory_block_ptr;
	return;
}

// 负责把当前空存储块分割为前面的已用block，和后面的未用block
static inline block_memory_head* split_memory_block(block_memory_head* current_memory_block_ptr,size_t block_length)
{
	block_memory_head* new_memory_block_ptr = NULL;
	if (BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr) < block_length)
		return NULL;
	if (current_memory_block_ptr == &start_memory_block)
		new_memory_block_ptr = (block_memory_head*) ((uint8_t*)heap_memory + block_length);
	else
		new_memory_block_ptr     = (block_memory_head*) ((uint8_t*)current_memory_block_ptr + block_length + SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT);
	BLOCK_MEMORY_FREE(new_memory_block_ptr);
	new_memory_block_ptr->next_memory_block_ptr = current_memory_block_ptr->next_memory_block_ptr;
	new_memory_block_ptr->size_memory_block     = current_memory_block_ptr->size_memory_block - GET_TOTAL_BLOCK_AND_HEAD_SIZE(block_length);
	BLOCK_MEMORY_ALLOCATE(current_memory_block_ptr);
	BLOCK_MEMORY_SET_AVAILABLE_SIZE(current_memory_block_ptr,block_length);
	current_memory_block_ptr->next_memory_block_ptr = new_memory_block_ptr;
	return new_memory_block_ptr;
}

void init_memory_heap(void)
{
    uint8_t* actual_heap_memory = NULL; 
    uint8_t* actual_heap_memory_end = NULL;
    // block_memory_head* first_memory_block_ptr_inheap = NULL;
    block_memory_head* end_memory_block_ptr_local = NULL;

// 1. first(end,total-size) 2. end(null,0)


    #if BYTES_ALIGNMENT_FOR_MCU == 1
    actual_heap_memory = heap_memory;
    available_memory_size -= 0;
    actual_heap_memory_end = actual_heap_memory + available_memory_size - 1;
    #else
    if (0 == heap_memory & BYTES_ALIGNMENT_MASK_FOR_MCU)
        actual_heap_memory = heap_memory;
    else
    {
        ///<! 这里需要插入按照多字节对齐的逻辑，但是我还没看懂
    }
    #endif
    #ifdef DEBUG
    memset(actual_heap_memory, HEAP_INIT_DATA, available_memory_size);
    #endif

    available_memory_size -= 1 * SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
    history_available_min_memory_size = MIN(history_available_min_memory_size,available_memory_size);
    

    end_memory_block_ptr_local = (block_memory_head*) (actual_heap_memory_end + 1 - \
                                  SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT);
    end_memory_block_ptr_local->next_memory_block_ptr = NULL;
    end_memory_block_ptr_local->size_memory_block     = 0;
    end_memory_block_ptr       = end_memory_block_ptr_local;

    start_memory_block.next_memory_block_ptr = end_memory_block_ptr;
    start_memory_block.size_memory_block     = available_memory_size;

    //first_memory_block_ptr_inheap = (block_memory_head*) actual_heap_memory;
    //first_memory_block_ptr_inheap->next_memory_block_ptr = end_memory_block_ptr_local;
    //first_memory_block_ptr_inheap->size_memory_block     = available_memory_size;
}


void* malloc_memory(size_t block_length)
{
    #if BYTES_ALIGNMENT_FOR_MCU == 1
    block_memory_head* current_memory_block_ptr = NULL;
    block_memory_head* last_memory_block_ptr    = NULL;
    // block_memory_head* new_memory_block_ptr     = NULL;
    uint8_t*           return_memory_ptr        = NULL;

    // 这里差禁用线程切换

    // Check whether the heap is initiated 
    // if (start_memory_block.next_memory_block_ptr != end_memory_block_ptr)
    //     init_memory_heap();

    // Check whether the block_length is 0
    if (block_length == 0)					// (IS_BLOCK_MEMORY_SIZE_VALID(block_length) == 0)
    {
        return NULL;
    }
    
    // Check whether the required block length larger than the theoretical maximum available heap size (2^14 Bytes)
    if (block_length + SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT > \
        ( (1<< (sizeof(unsigned int)*8-1-1) ) - SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT))
    {
        return NULL;
    }

    // Check whether the required block length larger than available memory size
    if ( block_length + SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT > available_memory_size)
    {
        return NULL;
    }

    // Start finding out next available memory block
    current_memory_block_ptr = &start_memory_block;
    
    while (current_memory_block_ptr->next_memory_block_ptr != NULL)
    {
        if (!IS_BLOCK_MEMORY_ALLOCATED(current_memory_block_ptr))
        {
            if (BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr) > GET_TOTAL_BLOCK_AND_HEAD_SIZE(block_length))
            {
				// generate the return pointer value
				if (current_memory_block_ptr == &start_memory_block)
					return_memory_ptr = (uint8_t*) heap_memory;
				else
					return_memory_ptr = (uint8_t*) current_memory_block_ptr+SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
                // split the current block into the used memory and the rest of unused memory
                if(!split_memory_block(current_memory_block_ptr,block_length))
                    return NULL;
                // change the available and minimal historical available memory usage.
                available_memory_size -= GET_TOTAL_BLOCK_AND_HEAD_SIZE(block_length);
                history_available_min_memory_size = MIN(history_available_min_memory_size,available_memory_size);
                // 还差解禁线程切换
                return (void*) return_memory_ptr;
            }
            else if (BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr) >= block_length)
            {
                BLOCK_MEMORY_ALLOCATE(current_memory_block_ptr);
                // generate the return pointer value
                return_memory_ptr = (uint8_t*) current_memory_block_ptr+SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
                // change the available and minimal historical available memory usage.
                available_memory_size -= current_memory_block_ptr->size_memory_block;
                history_available_min_memory_size = MIN(history_available_min_memory_size,available_memory_size);
                // 还差解禁线程切换
                return (void*) return_memory_ptr;
            }
        }
        last_memory_block_ptr    = current_memory_block_ptr; 
        current_memory_block_ptr = current_memory_block_ptr->next_memory_block_ptr;
    }
    #endif
    
    // If code run to here, it means no available memory block in the heap. (All the Memory pieces smaller than the required)

    return NULL;
}



void free_memory(void* ptr)
{
    // Check whether the pointer is valid
    if (!ptr)
        return;
    
    // Declration of basic linklist variables
    block_memory_head* current_memory_block_ptr = NULL;
    block_memory_head* last_memory_block_ptr    = NULL;
    block_memory_head* next_memory_block_ptr    = NULL;
    block_memory_head* input_memory_block_ptr   = NULL;
	#if BYTES_ALIGNMENT_FOR_MCU == 1
	if (ptr == heap_memory)
		input_memory_block_ptr = &start_memory_block;
	else
		input_memory_block_ptr = (block_memory_head*)  ((uint8_t*) ptr - SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT);
	#endif
    current_memory_block_ptr = &start_memory_block;
    next_memory_block_ptr    = input_memory_block_ptr->next_memory_block_ptr;

    // Check whether the inputted pointer is the base address of the allocated block 
    while (current_memory_block_ptr->next_memory_block_ptr != NULL)
    {
        if (current_memory_block_ptr == input_memory_block_ptr)
            break;
        last_memory_block_ptr    = current_memory_block_ptr; 
        current_memory_block_ptr = current_memory_block_ptr->next_memory_block_ptr;
    }

    
    // Merge memory pieces before and after the current freed memory block
    if (current_memory_block_ptr == input_memory_block_ptr)
    {
        // 还差禁用线程切换
        BLOCK_MEMORY_FREE(input_memory_block_ptr);
        available_memory_size += BLOCK_MEMORY_GET_AVAILABLE_SIZE(current_memory_block_ptr);
        // 还差全局堆空间统计更新
        if ( !IS_BLOCK_MEMORY_ALLOCATED(next_memory_block_ptr) && next_memory_block_ptr->next_memory_block_ptr != NULL)
        {
            merge_memory_block(current_memory_block_ptr);
            available_memory_size += SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
        }
        if ( !IS_BLOCK_MEMORY_ALLOCATED(last_memory_block_ptr) && last_memory_block_ptr != NULL)
        {
            merge_memory_block(last_memory_block_ptr);
            available_memory_size += SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
        }
    }
    // If the pointer is not the base address of memory pieces, return
    else if(current_memory_block_ptr->next_memory_block_ptr == NULL)
    {
        return;
    }
    // 还差解禁线程切换
    return;
}



