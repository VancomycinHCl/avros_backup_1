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
	// �ȷ�ջ�ף�ջ�ף�Ҳ���ǿ�ջջ������PCָ���λ�ã����̺߳�����ָ��
	// ATMEL�ļܹ��Ǵ�һ��״̬�����ж�ʱ�Ȱ���ͷִ�еĺ���ָ��push��ջ��
	// �жϺ���ִ����Ϻ��ٰ�ջ�׵ĺ���ָ��pop��ջ��
	// ����������Ӳ���Զ�ִ�е�
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
	// Ȼ���ʼ�������Ĵ�����ͨ�üĴ���32bytes��״̬�Ĵ���1byte��PC�Ĵ���2byte����35bytes
	// ֻ��Ҫ��д33���Ĵ�������
	memset(stack_top_ptr-33,0x00,33);
	// Ȼ��ѵ�ǰջ���浽TCB��
	tcb_ptr->tcb_stackPointer  = stack_top_ptr - 33;
	tcb_ptr->tcb_status        = TCB_STATUS_REDAY;
	tcb_ptr->tcb_pid		   = thread_pid;
	tcb_ptr->tcb_delay_cyc_cnt = 0;
}

TCB threadList[MAX_THREADS]; // �߳��б�
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

