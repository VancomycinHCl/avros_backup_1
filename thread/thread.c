/*
 * thread.c
 *
 * Created: 11/01/2024 12.30.23
 *  Author: Adin
 */ 

#include "thread.h"
#include <string.h>

// extern const uint8_t SIZEOF_TCB = sizeof(TCB);

void setup_threads(TCB* tcb_ptr, uint8_t* stack_bottom_ptr,void* thread_function, int thread_pid)
{
	// 先封栈底，栈底（也就是空栈栈顶）是PC指针的位置，即线程函数的指针
	// ATMEL的架构是从一般状态进入中断时先把手头执行的函数指针push进栈顶
	// 中断函数执行完毕后再把栈底的函数指针pop出栈顶
	// 整个过程是硬件自动执行的
	uint8_t* stack_top_ptr = stack_bottom_ptr + STACK_SIZE - 1;
	memset(stack_bottom_ptr,STACK_INIT_DATA,STACK_SIZE);
	*stack_top_ptr     = 0x00;
	*(stack_top_ptr-1) = 0x00;
	*(stack_top_ptr-2) = 0x00;
	stack_top_ptr -= 3;
	*stack_top_ptr     = (uint16_t) thread_function  & 0xFF;
	*(stack_top_ptr-1) = (uint16_t) thread_function >> 0x08;
	*(stack_top_ptr-2) = 0x00;
	stack_top_ptr -= 3;
	// 然后初始化各个寄存器，通用寄存器32bytes，状态寄存器1byte，PC寄存器2byte，共35bytes
	// 只需要覆写33个寄存器即可
	memset(stack_top_ptr-33,0x00,33);
	// 然后把当前栈顶存到TCB里
	tcb_ptr->tcb_stackPointer  = stack_top_ptr - 33;
	tcb_ptr->tcb_status        = TCB_STATUS_REDAY;
	tcb_ptr->tcb_pid		   = thread_pid;
	tcb_ptr->tcb_delay_cyc_cnt = 0;
}

TCB threadList[MAX_THREADS]; // 线程列表
int currentThread=0;

#if THREAD_SCHEDULING_ROUND_ROBIN 
extern void scheduling_thread(void)
{
	// TCB* currentThread_tcb = get_thread_by_pid(currentThread);
	currentThread = currentThread >= 1 ? 0:1; 
}
#endif // end  THREAD_SCHEDULING_ROUND_ROBIN

#if THREAD_SCHEDULING_PRIORITY
extern void scheduling_thread(void)
{
	currentThread = currentThread >= 1 ? 0:1;
}
#endif // end  THREAD_SCHEDULING_PRIORITY



TCB* get_thread_by_pid(int pid)
{
	return &(threadList[pid]);
}

void delay_thread_ms(int delay_interval_ms)
{
	cli();
	TCB* current_thread_ptr				     = get_thread_by_pid(currentThread);
	current_thread_ptr->tcb_status			 = TCB_STATUS_SUSPENED;
	#ifdef THREAD_TIME_INTERVAL_1MS
	current_thread_ptr->tcb_delay_cyc_cnt	 = delay_interval_ms;
	THREAD_YIELD();
	#endif // THREAD_TIME_INTERVAL_1MS
	sei();
}

//void delay_thread_us(double delay_interval_us)
//{
	//cli();
	//_delay_us(delay_interval_us);
	//return;
	//sei();
//}

