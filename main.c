/**
* @file        main.c
* @brief		This is a brief description.
* @details	    This is the detail description.
* @author		Xuanzhi Liu
* @date		2024/01/26 11:59:18
* @version	    v1.0
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include "avr/iom2560.h"
#include <avr/delay.h>
#include "./thread/thread.h"
#include <stdio.h>
#include <util/atomic.h>
#include "user_func/user_func.h"
#include "memory/memory.h"

// Declare for user-defined stacks
uint8_t thread_stack_idle[IDLE_TASK_STACK_SIZE];
uint8_t thread_stack_0[STACK_SIZE];
uint8_t thread_stack_1[STACK_SIZE];
uint8_t thread_stack_2[STACK_SIZE];

// static int i = 0;

// Timer configuration for ATMEL Mega 2560
void timer_init() {
	// Set the Timer Mode to CTC
	TCCR1B |= (1 << WGM12);
	// Set the value that you want to count to
	OCR1A = 2499; //31248; // This will allow the timer to count for 1 second with a 16MHz clock 15624 for 1s
	OCR1B = 2499/2;
	OCR1C = 0xFFFF;
	// Set the prescaler to 256 and start the timer
	TCCR1B |= (1 << CS12);
	// Enable the compare interrupt
	TCCR1A |= (0 << COM1A1);
	TCCR1A |= (1 << COM1A0);
	TIMSK1 |= (1 << OCIE1A);
	// Initialize global interrupts
	// sei();
	TCCR1A |= (0 << COM1B1);
	TCCR1A |= (1 << COM1B0);
	TIMSK1 |= (1 << OCIE1B);
}


// Interrupt Service Routine for Timer1 compare match
ISR(TIMER1_COMPA_vect,ISR_NAKED) 
{
	//TIFR1 &= 0xff;
	asm volatile("rjmp switch_threads\n");
}

ISR(TIMER1_COMPB_vect)
{
	cli();
	thread_delay_cyc_cnt_dec();
	sei();
}




int main() {
	// Initialize the timer
	timer_init();
	DDRB |= (1 << DDB7); 
	DDRB |= (1 << DDB6); 
	DDRB |= (1 << DDB5);
	DDRA |= (1 << DDA1);
	PORTB |= 0xC0;
	PORTA |= 0xFF;
	
	init_memory_heap();
	setup_threads(&threadList[0],thread_stack_idle,&thread_idle,IDLE_TASK_PID,IDLE_TASK_PRIORITY,"Idle task");
	setup_threads(&threadList[0],thread_stack_0,&thread0_main,1,0x01,"Task 1");
	setup_threads(&threadList[1],thread_stack_1,&thread1_main,2,0x01,"Task 2");
	startup_thread();

	
	// Main loop
	while(1) 
	{
		// printf("asdf");
	}
}