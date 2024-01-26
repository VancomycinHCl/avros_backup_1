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

static block_memory_head start_memory_block;

void  init_memory_heap(void)
{
    uint8_t* actual_heap_memory = NULL;
    uint8_t* actual_heap_memory_end = NULL;
    block_memory_head* first_memory_block_ptr_inheap;
    block_memory_head* end_memory_block_ptr_inheap;

    #if BYTES_ALIGNMENT_FOR_MCU == 1
    actual_heap_memory = heap_memory;
    available_memory_size -= 0;
    actual_heap_memory_end = actual_heap_memory + available_memory_size;
    #else
    if (0 == heap_memory & BYTES_ALIGNMENT_MASK_FOR_MCU)
        actual_heap_memory = heap_memory;
    else
    {
        ///<! 这里需要插入按照多字节对齐的逻辑，但是我还没看懂
    }
    #endif
    memset(actual_heap_memory, HEAP_INIT_DATA, available_memory_size);

    start_memory_block.next_memory_block_ptr = end_memory_block_ptr_inheap;
    start_memory_block.size_memory_block     = end_memory_block_ptr_inheap - \
                                               actual_heap_memory;

    available_memory_size -= 2 * SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
    history_available_min_memory_size = MIN(history_available_min_memory_size,available_memory_size);

    end_memory_block_ptr_inheap = actual_heap_memory_end - \
                                  SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT;
    end_memory_block_ptr_inheap->next_memory_block_ptr = NULL;
    end_memory_block_ptr_inheap->size_memory_block     = 0;

    first_memory_block_ptr_inheap = actual_heap_memory;
    first_memory_block_ptr_inheap->next_memory_block_ptr = end_memory_block_ptr_inheap;
    first_memory_block_ptr_inheap->size_memory_block     = available_memory_size;
}


void* malloc_memory(size_t block_length)
{
    return NULL;
}