/*
 * user_func.h
 *
 * Created: 21/01/2024 21.14.32
 *  Author: Adin
 */ 


#include "user_func.h"



void thread0_main(void)
{
	int a = 1;
	while(1)
	{
		PORTB |= 0xFF;
		delay_us(a);
		PORTB &= 0x00;
		delay_us(1000-a);
		a =  a < 997 ? a + 2 : 1;
	}
}

void thread1_main(void)
{
	while(1)
	{
		delay_thread_ms(1);
		PORTB &= 0x00;
		delay_thread_ms(1);
		PORTB |= 0xFF;
	}
}