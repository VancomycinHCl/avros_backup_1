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

/**
 * @brief 
 * 
 */
struct BLOCK_MEMORY_HEAD{
	BLOCK_MEMORY_HEAD* next_memory_block_ptr; /**/
	unsigned int  size_memory_block;
}block_memory_head;


#define GLOBAL_HEAP_SIZE 1024*4

/**
 * @brief 堆空间的声明
 * 
 */
static uint8_t heap_memory[GLOBAL_HEAP_SIZE];

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
	* @note 		切记，不要倒着写这块内存，即a[-1]的形式，这样会毁掉这段内存空间的
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



#endif