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
#include "avr/delay.h"
#include "./thread/thread.h"
#include <stdio.h>
#include <util/atomic.h>
#include "user_func/user_func.h"

// static int i = 0;

// Timer configuration for ATMEL Mega 2560
void timer_init() {
	// Set the Timer Mode to CTC
	TCCR1B |= (1 << WGM12);
	// Set the value that you want to count to
	OCR1A = 31248; // This will allow the timer to count for 1 second with a 16MHz clock 15624 for 1s
	// Set the prescaler to 256 and start the timer
	TCCR1B |= (1 << CS12);
	// Enable the compare interrupt
	TIMSK1 |= (1 << OCIE1A);
	// Initialize global interrupts
	// sei();
}


// Interrupt Service Routine for Timer1 compare match
ISR(TIMER1_COMPA_vect,ISR_NAKED ) 
{
	asm volatile("rjmp switch_threads\n");
}




int main() {
	// Initialize the timer
	timer_init();
	DDRB |= (1 << DDB7); 
	DDRA |= (1 << DDA1);
	PORTB |= 0xFF;
	PORTA |= 0xFF;
	
	setup_threads(&threadList[0],thread_stack_0,&thread0_main,0);
	setup_threads(&threadList[1],thread_stack_1,&thread1_main,1);
	startup_thread();
	// Main loop
	while(1) 
	{
		// printf("asdf");
	}
}