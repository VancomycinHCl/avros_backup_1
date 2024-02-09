/*
 * thread.c
 *
 * Created: 11/01/2024 12.30.23
 *  Author: Adin
 */ 

#include "thread.h"
#include <string.h>

// extern const uint8_t SIZEOF_TCB = sizeof(TCB);

void setup_threads(TCB* tcb_ptr, uint8_t* stack_bottom_ptr,void* thread_function, int thread_pid, const uint8_t thread_priority, const char* thread_name_ptr)
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
	tcb_ptr->tcb_name_ptr      = thread_name_ptr;
	tcb_ptr->tcb_priority      = thread_priority;
}

void thread_idle(void) // 系统空闲任务
{
	while (1)
	{}
}

TCB threadList[MAX_THREADS]; // 线程列表
int currentThread=0;

#if THREAD_SCHEDULING_ROUND_ROBIN == 1
extern void scheduling_thread(void)
{
	currentThread++;
	// TCB* currentThread_tcb = get_thread_by_pid(currentThread);
	currentThread = currentThread > 1 ? 0:currentThread; 
	TIFR1 |= (1 << OCF1A);
}
#endif // end  THREAD_SCHEDULING_ROUND_ROBIN

#if THREAD_SCHEDULING_PRIORITY == 1
extern void scheduling_thread(void)
{
	
	TCB* current_thread_ptr = NULL;
	uint8_t thread_highest_priority = 0;						// 最高优先级级别
	uint8_t thread_highest_priority_list[MAX_THREADS] = {0};	// 最高优先级线程列表
	uint8_t thread_highest_priority_cnt = 0;					// 最高优先级线程总数

	
	for (uint8_t thread_itr = 0; thread_itr < MAX_THREADS; thread_itr++)
	{
		current_thread_ptr = get_thread_by_pid(thread_itr);

		// state machine for the threads' status switch
		// 线程状态机的状态转移方程
		switch (current_thread_ptr->tcb_status)
		{
			case TCB_STATUS_SUSPENED:
				if (0 == current_thread_ptr->tcb_delay_cyc_cnt)
					current_thread_ptr->tcb_status = TCB_STATUS_REDAY;
				else{
					current_thread_ptr->tcb_status = TCB_STATUS_SUSPENED;
				}
				break;
			case TCB_STATUS_BLOCK:
				if (0 == current_thread_ptr->tcb_delay_cyc_cnt)
					current_thread_ptr->tcb_status = TCB_STATUS_REDAY;
				else{
					current_thread_ptr->tcb_status = TCB_STATUS_BLOCK;
				}
				break;
			case TCB_STATUS_RUN:
				current_thread_ptr->tcb_status = TCB_STATUS_RUN;
				break;
			case TCB_STATUS_END:
				current_thread_ptr->tcb_status = TCB_STATUS_END;
				break;
			default:
				break;
		}

		// 线程状态机的输出方程
		switch (current_thread_ptr->tcb_status)
		{
			case TCB_STATUS_SUSPENED:
				break;
			case TCB_STATUS_BLOCK:
				break;
			case TCB_STATUS_RUN:
				if (current_thread_ptr->tcb_priority > thread_highest_priority)
				{
					thread_highest_priority = current_thread_ptr->tcb_priority;
					thread_highest_priority_cnt = 1;
					memset(thread_highest_priority_list, 0x00, MAX_THREADS);
					thread_highest_priority_list[thread_highest_priority_cnt-1] = current_thread_ptr->tcb_pid;
				}
				else if(current_thread_ptr->tcb_priority == thread_highest_priority)
				{
					thread_highest_priority = current_thread_ptr->tcb_priority;
					thread_highest_priority_cnt++;
					thread_highest_priority_list[thread_highest_priority_cnt-1] = current_thread_ptr->tcb_pid;
				}		
				break;
			case TCB_STATUS_REDAY:
				if (current_thread_ptr->tcb_priority > thread_highest_priority)
				{
					thread_highest_priority = current_thread_ptr->tcb_priority;
					thread_highest_priority_cnt = 1;
					memset(thread_highest_priority_list, 0x00, MAX_THREADS);
					thread_highest_priority_list[thread_highest_priority_cnt-1] = current_thread_ptr->tcb_pid;
				}
				else if(current_thread_ptr->tcb_priority == thread_highest_priority)
				{
					thread_highest_priority = current_thread_ptr->tcb_priority;
					thread_highest_priority_cnt++;
					thread_highest_priority_list[thread_highest_priority_cnt-1] = current_thread_ptr->tcb_pid;
				}		
				break;
			case TCB_STATUS_END:
				break;
			default:
				break;
		}
	}

	// find the highest priority thread and execute round robbin scheduling
	for (uint8_t thread_itr = 0; thread_itr < MAX_THREADS; thread_itr++)
	{
		current_thread_ptr = get_thread_by_pid(thread_itr);

	}

}
#endif // end  THREAD_SCHEDULING_PRIORITY

void thread_delay_cyc_cnt_dec(void)
{
	TCB* current_thread_ptr = NULL;
	for (uint8_t thread_itr = 0; thread_itr < MAX_THREADS; thread_itr++)
	{
		current_thread_ptr = get_thread_by_pid(thread_itr);
		switch (current_thread_ptr->tcb_status)
		{
			case TCB_STATUS_SUSPENED:
				if (0 == current_thread_ptr->tcb_delay_cyc_cnt)
					current_thread_ptr->tcb_delay_cyc_cnt = 0;
				else
				{
					current_thread_ptr->tcb_delay_cyc_cnt--;
				}
				break;
			case TCB_STATUS_BLOCK:
				if (0 == current_thread_ptr->tcb_delay_cyc_cnt)
					current_thread_ptr->tcb_delay_cyc_cnt = 0;
				else if (PERMNANT_BLOCKED_THREAD_CYC_CNT == current_thread_ptr->tcb_delay_cyc_cnt)
				{
					current_thread_ptr->tcb_delay_cyc_cnt = PERMNANT_BLOCKED_THREAD_CYC_CNT;
				}	
				else
				{
					current_thread_ptr->tcb_delay_cyc_cnt--;
				}
				break;
		default:
			break;
		}
	}
}

TCB* get_thread_by_pid(int pid)
{
	return &(threadList[pid]);
}

void delay_thread_ms(int delay_interval_ms)
{
	TCB* current_thread_ptr				     = get_thread_by_pid(currentThread);
	unsigned char sreg;
	unsigned int i;
	
	current_thread_ptr->tcb_status			 = TCB_STATUS_SUSPENED;
	#ifdef THREAD_TIME_INTERVAL_1MS
	current_thread_ptr->tcb_delay_cyc_cnt	 = delay_interval_ms;
	//sreg = SREG;
	//TCCR1B &= 0;
	//TIMSK1 &= ~(1 << OCIE1A);
	//// TCNT1 = 5;//THREAD_TIMER_TRIG_CNT-1000;
	//OCR1A = THREAD_TIMER_TRIG_CNT;
	//TIFR1 &= 0xFF;
	//TIMSK1 |= (1 << OCIE1A);
	//TCCR1A |= (1 << COM1A0);
	//TCCR1B |= (1 << WGM12);
	//TCCR1B |= (1 << CS12);
	/////* Restore global interrupt flag */
	//SREG = sreg;
	#endif // THREAD_TIME_INTERVAL_1MS
}

//void delay_thread_us(double delay_interval_us)
//{
	//cli();
	//_delay_us(delay_interval_us);
	//return;
	//sei();
//}

