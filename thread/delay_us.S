/*
 * delay_us.S
 * 
 * Created: 20/01/2024 22.30.02
 * Author: Adin
 * Description: This function realises a delay function with a minimum time interval of precise 1us when the CPU freq is 16MHz . 
 * References: uint16_t delay_interval_us, at reg24 and 25
 * Note: Reference delay_interval_us should greater than 0, otherwise this function would delay 65535us because of the underflow of uint16_t.
 *       Reference delay_interval_us in a range of 1-999 is recommended, because delay longer than this time interval would block thread timing
 */ 

.section .text

.global delay_us
.global delay_us_atom
delay_us:
   
    sbiw  r24, 1        ; 2		r24:r25减1（使用正确的寄存器对和逗号）
	breq  end_loop      ; 1 or 2   如果都为0，则跳到end_loop

delay_loop_0:
    nop                 ; 延时循环
    nop
    nop
    nop
    nop
    nop
    nop
    nop
	nop
	nop
    breq  end_loop      ; 如果计数到0，则结束循环
    clr   r26
    sbiw  r24, 1        ; 再次减1
    brne  delay_loop_0  ; 如果不为0，继续循环

end_loop:
    // sei                 ; 1 重新启用中断
    ret                 ; 4 返回


delay_us_atom:
    cli;
    sbiw  r24, 1        ; 2		r24:r25减1（使用正确的寄存器对和逗号）
	breq  end_loop      ; 1 or 2   如果都为0，则跳到end_loop

delay_loop_atom:
    nop                 ; 延时循环
    nop
    nop
    nop
    nop
    nop
    nop
    nop
	nop
	nop
    breq  end_loop_atom      ; 如果计数到0，则结束循环
    clr   r26
    sbiw  r24, 1        ; 再次减1
    brne  delay_loop_atom  ; 如果不为0，继续循环

end_loop_atom:
    sei                 ; 1 重新启用中断
    ret                 ; 4 返回