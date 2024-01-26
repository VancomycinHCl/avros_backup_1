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

