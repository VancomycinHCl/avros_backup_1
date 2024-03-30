/**
* @file       	memory.h
* @brief		包含了带内存回收的堆空间管理
* @details	    0. 本堆空间分配器参考了FreeRTOS的设计思路 
*				1. 与FreeRTOS相比堆空间独立于栈空间存在于bss段 
*				2. 对空间分配支持内存碎片回收
* @author		Xuanzhi Liu
* @date			2024/01/26 12:00:49
* @version	    v1.0
*/

#ifndef MEMORY_H
#define MEMORY_H

#include <stdint.h>
#include <stddef.h>
#include <string.h>
#include <assert.h>

/*
*   THIS IS THE HEAP MEMORY ALLOCATION MAP
*   
*   history_available_min_memory_size
*   available_memory_size
*   start_memory_block          	<- outside heap memory pool
*   -------------------------	    <- heap_memory[GLOBAL_HEAP_SIZE]
*   |block_memory_head  	|       <- inside heap memory pool
*   |heap_unused_memory   	|
*   |block_memory_head  	|
*   |heap_used_memory   	|
*   |       ......      	|
*   |end_memory_block   	|
*   -------------------------		<- end address of heap_memory[GLOBAL_HEAP_SIZE]
*   
*/


/**
 * @brief 
 * 
 */

typedef struct BLOCK_MEMORY_HEAD block_memory_head;

typedef struct BLOCK_MEMORY_HEAD
{
	block_memory_head* next_memory_block_ptr; 
	unsigned int  	   size_memory_block;  // 16'h8000 -> size_memory_block[15] = 1 if allocated else 0
}block_memory_head;


#define GLOBAL_HEAP_SIZE 1024*4

#ifndef BITS_PER_BYTE
#define BITS_PER_BYTE 8
#endif // end BITS_PER_BYTE

#ifndef HEAP_INIT_DATA
#define HEAP_INIT_DATA 0xCD
#endif // HEAP_INIT_DATA

#ifndef MIN
#define MIN(A,B) A<B? A:B
#endif

#define BYTES_ALIGNMENT_FOR_MCU 1

#if 	BYTES_ALIGNMENT_FOR_MCU == 1
#define BYTES_ALIGNMENT_MASK_FOR_MCU 0x0000
#elif 	BYTES_ALIGNMENT_FOR_MCU == 4
#define BYTES_ALIGNMENT_MASK_FOR_MCU 0x0003
#elif 	BYTES_ALIGNMENT_FOR_MCU == 8
#define BYTES_ALIGNMENT_MASK_FOR_MCU 0x0007
#endif

#if 	BYTES_ALIGNMENT_FOR_MCU == 1
#define SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT sizeof(block_memory_head)
#endif

#define BLOCK_MEMORY_ALLOCATED_MASK ( 1 << (sizeof(unsigned int) * BITS_PER_BYTE - 1) )
#define IS_BLOCK_MEMORY_ALLOCATED(block_memory_head_ptr)  (((block_memory_head_ptr->size_memory_block) & \
															BLOCK_MEMORY_ALLOCATED_MASK) != 0)
#define IS_BLOCK_MEMORY_SIZE_VALID(block_memory_size) ( (block_memory_size & BLOCK_MEMORY_ALLOCATED_MASK) == 0)

#define BLOCK_MEMORY_ALLOCATE(block_memory_head_ptr) ( ( (block_memory_head_ptr->size_memory_block) |= \
															BLOCK_MEMORY_ALLOCATED_MASK) )
#define BLOCK_MEMORY_FREE(block_memory_head_ptr) ( ( (block_memory_head_ptr->size_memory_block) &= \
															~BLOCK_MEMORY_ALLOCATED_MASK) )

#define BLOCK_MEMORY_GET_AVAILABLE_SIZE(block_memory_head_ptr)   ( (block_memory_head_ptr->size_memory_block) & \
																  (~(BLOCK_MEMORY_ALLOCATED_MASK)) )

#define BLOCK_MEMORY_SET_AVAILABLE_SIZE(block_memory_head_ptr,block_length)    \
(block_memory_head_ptr->size_memory_block = (block_memory_head_ptr->size_memory_block & BLOCK_MEMORY_ALLOCATED_MASK) | (block_length))



#define GET_TOTAL_BLOCK_AND_HEAD_SIZE(block_length) (block_length+SIZEOF_BLOCK_MEMORY_HEAD_WITH_ALIGNMENT)


/**																	
	* @brief		初始化堆空间，设置初始内存块与末尾内存块，计算padding字节
	* @details	    初始化堆空间，设置初始内存块与末尾内存块，计算padding字节
	* @par Changed log
	* 		Build at 2024/01/26
*/
void  init_memory_heap(void);


/**																	
	* @brief		分配堆空间
	* @details	    在堆空间内寻找第一个可用内存块，并尝试进行前向合并与后向合并
	* @note 		切记，不要倒着写这块内存，即a[-1]的形式，这样会毁掉这段内存块的
	* @param[in]	block_length 所需内存字节数
	* @return 		返回被分配的空间的可用地址指针
	* @retval		void* !NULL		分配成功
	* @retval		void*  NULL		分配失败 
	* @par Changed log
	* 		Build at 2024/01/26
*/
void* malloc_memory(size_t block_length);

/**																	
	* @brief		回收堆空间
	* @details	    将该首地址标记的内存块回收，并且前向后向检查是否可以合并内存块
	* @param[in]	ptr 堆空间内存块首地址
	* @return 		None
	* @par Changed log
	* 		Build at 2024/01/26
*/
void  free_memory(void* ptr);

// block_memory_head* split_memory_block(block_memory_head* current_memory_block_ptr,size_t block_length);
// void merge_memory_block(block_memory_head* current_memory_block_ptr);

#endif