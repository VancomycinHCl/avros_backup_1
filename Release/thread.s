	.file	"thread.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.comm	thread_stack_0,512,1
	.comm	thread_stack_1,512,1
	.comm	thread_stack_2,512,1
	.section	.text.setup_threads,"ax",@progbits
.global	setup_threads
	.type	setup_threads, @function
setup_threads:
.LFB6:
	.file 1 ".././thread.c"
	.loc 1 12 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI1:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI2:
	.cfi_def_cfa_register 28
	sbiw r28,8
.LCFI3:
	.cfi_def_cfa_offset 13
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 10 */
.L__stack_usage = 10
	std Y+4,r25
	std Y+3,r24
	std Y+6,r23
	std Y+5,r22
	std Y+8,r21
	std Y+7,r20
	.loc 1 17 0
	ldd r24,Y+5
	ldd r25,Y+6
	subi r24,1
	sbci r25,-2
	std Y+2,r25
	std Y+1,r24
	.loc 1 18 0
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 19 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,1
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 20 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,3
	std Y+2,r25
	std Y+1,r24
	.loc 1 21 0
	ldd r24,Y+7
	ldd r25,Y+8
	mov r18,r24
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	st Z,r18
	.loc 1 22 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,1
	ldd r18,Y+7
	ldd r19,Y+8
	mov r18,r19
	clr r19
	movw r30,r24
	st Z,r18
	.loc 1 23 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,3
	std Y+2,r25
	std Y+1,r24
	.loc 1 26 0
	ldd r24,Y+1
	ldd r25,Y+2
	sbiw r24,33
	ldi r20,lo8(33)
	ldi r21,0
	ldi r22,0
	ldi r23,0
	call memset
	.loc 1 28 0
	ldd r24,Y+1
	ldd r25,Y+2
	movw r18,r24
	subi r18,33
	sbc r19,__zero_reg__
	ldd r24,Y+3
	ldd r25,Y+4
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 29 0
	nop
/* epilogue start */
	adiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE6:
	.size	setup_threads, .-setup_threads
	.comm	threadList,8,1
.global	currentThread
	.section	.bss.currentThread,"aw",@nobits
	.type	currentThread, @object
	.size	currentThread, 2
currentThread:
	.zero	2
	.section	.text.switch_thread_new,"ax",@progbits
.global	switch_thread_new
	.type	switch_thread_new, @function
switch_thread_new:
.LFB7:
	.loc 1 35 0
	.cfi_startproc
	push r28
.LCFI4:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI5:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI6:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	.loc 1 36 0
	nop
/* epilogue start */
	.loc 1 37 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE7:
	.size	switch_thread_new, .-switch_thread_new
	.section	.text.get_thread_by_pid,"ax",@progbits
.global	get_thread_by_pid
	.type	get_thread_by_pid, @function
get_thread_by_pid:
.LFB8:
	.loc 1 40 0
	.cfi_startproc
	push r28
.LCFI7:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI8:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	push __zero_reg__
	push __zero_reg__
.LCFI9:
	.cfi_def_cfa_offset 7
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI10:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	std Y+2,r25
	std Y+1,r24
	.loc 1 41 0
	ldd r24,Y+1
	ldd r25,Y+2
	lsl r24
	rol r25
	lsl r24
	rol r25
	subi r24,lo8(-(threadList))
	sbci r25,hi8(-(threadList))
/* epilogue start */
	.loc 1 42 0
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE8:
	.size	get_thread_by_pid, .-get_thread_by_pid
	.section	.text.delay_thread_ms,"ax",@progbits
.global	delay_thread_ms
	.type	delay_thread_ms, @function
delay_thread_ms:
.LFB9:
	.loc 1 45 0
	.cfi_startproc
	push r28
.LCFI11:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI12:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	rcall .
	push __zero_reg__
.LCFI13:
	.cfi_def_cfa_offset 9
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI14:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+4,r25
	std Y+3,r24
	.loc 1 46 0
/* #APP */
 ;  46 ".././thread.c" 1
	cli
 ;  0 "" 2
	.loc 1 47 0
/* #NOAPP */
	lds r24,currentThread
	lds r25,currentThread+1
	call get_thread_by_pid
	std Y+2,r25
	std Y+1,r24
	.loc 1 48 0
	ldd r24,Y+1
	ldd r25,Y+2
	ldi r18,lo8(3)
	movw r30,r24
	std Z+5,r18
	.loc 1 50 0
	ldd r18,Y+3
	ldd r19,Y+4
	ldd r24,Y+1
	ldd r25,Y+2
	movw r30,r24
	std Z+7,r19
	std Z+6,r18
	.loc 1 51 0
	ldi r24,lo8(-124)
	ldi r25,0
	.loc 1 51 0
	ldi r18,lo8(-71)
	ldi r19,lo8(9)
	movw r30,r24
	std Z+1,r19
	st Z,r18
	.loc 1 53 0
/* #APP */
 ;  53 ".././thread.c" 1
	sei
 ;  0 "" 2
	.loc 1 54 0
/* #NOAPP */
	nop
/* epilogue start */
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE9:
	.size	delay_thread_ms, .-delay_thread_ms
.global	__mulsf3
.global	__ltsf2
.global	__gtsf2
.global	__divsf3
.global	__fixunssfsi
	.section	.text.delay_thread_us,"ax",@progbits
.global	delay_thread_us
	.type	delay_thread_us, @function
delay_thread_us:
.LFB10:
	.loc 1 57 0
	.cfi_startproc
	push r28
.LCFI15:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI16:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI17:
	.cfi_def_cfa_register 28
	sbiw r28,36
.LCFI18:
	.cfi_def_cfa_offset 41
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 36 */
/* stack size = 38 */
.L__stack_usage = 38
	std Y+33,r22
	std Y+34,r23
	std Y+35,r24
	std Y+36,r25
	.loc 1 58 0
/* #APP */
 ;  58 ".././thread.c" 1
	cli
 ;  0 "" 2
/* #NOAPP */
	ldd r24,Y+33
	ldd r25,Y+34
	ldd r26,Y+35
	ldd r27,Y+36
	std Y+1,r24
	std Y+2,r25
	std Y+3,r26
	std Y+4,r27
.LBB30:
.LBB31:
	.file 2 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h"
	.loc 2 281 0
	ldi r18,lo8(-85)
	ldi r19,lo8(-86)
	ldi r20,lo8(-86)
	ldi r21,lo8(64)
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+5,r24
	std Y+6,r25
	std Y+7,r26
	std Y+8,r27
	.loc 2 282 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(64)
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+9,r24
	std Y+10,r25
	std Y+11,r26
	std Y+12,r27
	.loc 2 283 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	call __ltsf2
	tst r24
	brge .L29
	.loc 2 284 0
	ldi r24,lo8(1)
	std Y+13,r24
	rjmp .L10
.L29:
	.loc 2 285 0
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+9
	ldd r23,Y+10
	ldd r24,Y+11
	ldd r25,Y+12
	call __gtsf2
	cp __zero_reg__,r24
	brlt .+2
	rjmp .L30
	.loc 2 287 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(68)
	ldd r22,Y+1
	ldd r23,Y+2
	ldd r24,Y+3
	ldd r25,Y+4
	call __divsf3
	movw r26,r24
	movw r24,r22
	std Y+14,r24
	std Y+15,r25
	std Y+16,r26
	std Y+17,r27
.LBB32:
.LBB33:
	.loc 2 191 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(69)
	ldd r22,Y+14
	ldd r23,Y+15
	ldd r24,Y+16
	ldd r25,Y+17
	call __mulsf3
	movw r26,r24
	movw r24,r22
	std Y+18,r24
	std Y+19,r25
	std Y+20,r26
	std Y+21,r27
	.loc 2 192 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+18
	ldd r23,Y+19
	ldd r24,Y+20
	ldd r25,Y+21
	call __ltsf2
	tst r24
	brge .L31
	.loc 2 193 0
	ldi r24,lo8(1)
	ldi r25,0
	std Y+23,r25
	std Y+22,r24
	rjmp .L15
.L31:
	.loc 2 194 0
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+18
	ldd r23,Y+19
	ldd r24,Y+20
	ldd r25,Y+21
	call __gtsf2
	cp __zero_reg__,r24
	brge .L32
	.loc 2 197 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(32)
	ldi r21,lo8(65)
	ldd r22,Y+14
	ldd r23,Y+15
	ldd r24,Y+16
	ldd r25,Y+17
	call __mulsf3
	movw r26,r24
	movw r24,r22
	movw r22,r24
	movw r24,r26
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+23,r25
	std Y+22,r24
	rjmp .L18
.L19:
	ldi r24,lo8(-112)
	ldi r25,lo8(1)
	std Y+25,r25
	std Y+24,r24
.LBB34:
.LBB35:
	.file 3 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay_basic.h"
	.loc 3 105 0
	ldd r24,Y+24
	ldd r25,Y+25
/* #APP */
 ;  105 "d:\program files\atstudio\7.0\toolchain\avr8\avr8-gnu-toolchain\avr\include\util\delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+25,r25
	std Y+24,r24
.LBE35:
.LBE34:
	.loc 2 202 0
	ldd r24,Y+22
	ldd r25,Y+23
	sbiw r24,1
	std Y+23,r25
	std Y+22,r24
.L18:
	.loc 2 198 0
	ldd r24,Y+22
	ldd r25,Y+23
	or r24,r25
	brne .L19
	rjmp .L10
.L32:
	.loc 2 207 0
	ldd r22,Y+18
	ldd r23,Y+19
	ldd r24,Y+20
	ldd r25,Y+21
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+23,r25
	std Y+22,r24
.L15:
	ldd r24,Y+22
	ldd r25,Y+23
	std Y+27,r25
	std Y+26,r24
.LBB36:
.LBB37:
	.loc 3 105 0
	ldd r24,Y+26
	ldd r25,Y+27
/* #APP */
 ;  105 "d:\program files\atstudio\7.0\toolchain\avr8\avr8-gnu-toolchain\avr\include\util\delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+27,r25
	std Y+26,r24
	rjmp .L10
.L30:
.LBE37:
.LBE36:
.LBE33:
.LBE32:
	.loc 2 289 0
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(127)
	ldi r21,lo8(67)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	call __gtsf2
	cp __zero_reg__,r24
	brge .L33
.LBB38:
	.loc 2 291 0
	ldd r22,Y+9
	ldd r23,Y+10
	ldd r24,Y+11
	ldd r25,Y+12
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+29,r25
	std Y+28,r24
	ldd r24,Y+28
	ldd r25,Y+29
	std Y+31,r25
	std Y+30,r24
.LBB39:
.LBB40:
	.loc 3 105 0
	ldd r24,Y+30
	ldd r25,Y+31
/* #APP */
 ;  105 "d:\program files\atstudio\7.0\toolchain\avr8\avr8-gnu-toolchain\avr\include\util\delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+31,r25
	std Y+30,r24
.LBE40:
.LBE39:
.LBE38:
.LBE31:
.LBE30:
	.loc 1 60 0
	rjmp .L7
.L33:
.LBB44:
.LBB43:
	.loc 2 296 0
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	call __fixunssfsi
	movw r26,r24
	movw r24,r22
	std Y+13,r24
.L10:
	ldd r24,Y+13
	std Y+32,r24
.LBB41:
.LBB42:
	.loc 3 83 0
	ldd r24,Y+32
/* #APP */
 ;  83 "d:\program files\atstudio\7.0\toolchain\avr8\avr8-gnu-toolchain\avr\include\util\delay_basic.h" 1
	1: dec r24
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+32,r24
.LBE42:
.LBE41:
.LBE43:
.LBE44:
	.loc 1 60 0
	nop
.L7:
/* epilogue start */
	.loc 1 62 0
	adiw r28,36
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE10:
	.size	delay_thread_us, .-delay_thread_us
	.text
.Letext0:
	.file 4 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 5 ".././thread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x45c
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF50
	.byte	0xc
	.long	.LASF51
	.long	.LASF52
	.long	.Ldebug_ranges0+0x18
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x4
	.byte	0x7e
	.long	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x4
	.byte	0x80
	.long	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.byte	0x12
	.long	0x9c
	.uleb128 0x6
	.long	.LASF9
	.byte	0x5
	.byte	0x13
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x5
	.byte	0x14
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0x30
	.uleb128 0x8
	.string	"TCB"
	.byte	0x5
	.byte	0x15
	.long	0x77
	.uleb128 0x9
	.byte	0x1
	.long	0x3b
	.byte	0x5
	.byte	0x17
	.long	0xd8
	.uleb128 0xa
	.long	.LASF11
	.byte	0
	.uleb128 0xa
	.long	.LASF12
	.byte	0x1
	.uleb128 0xa
	.long	.LASF13
	.byte	0x2
	.uleb128 0xa
	.long	.LASF14
	.byte	0x3
	.uleb128 0xa
	.long	.LASF15
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF16
	.byte	0x5
	.byte	0x1d
	.long	0xad
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.byte	0x1f
	.long	0x132
	.uleb128 0x6
	.long	.LASF17
	.byte	0x5
	.byte	0x20
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF18
	.byte	0x5
	.byte	0x21
	.long	0x9c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF19
	.byte	0x5
	.byte	0x22
	.long	0x30
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF20
	.byte	0x5
	.byte	0x23
	.long	0xd8
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x6
	.long	.LASF21
	.byte	0x5
	.byte	0x25
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0
	.uleb128 0x3
	.long	.LASF22
	.byte	0x5
	.byte	0x26
	.long	0xe3
	.uleb128 0xb
	.long	.LASF23
	.byte	0x3
	.byte	0x67
	.byte	0x1
	.byte	0x3
	.long	0x156
	.uleb128 0xc
	.long	.LASF25
	.byte	0x3
	.byte	0x67
	.long	0x49
	.byte	0
	.uleb128 0xb
	.long	.LASF24
	.byte	0x2
	.byte	0xa6
	.byte	0x1
	.byte	0x3
	.long	0x185
	.uleb128 0xc
	.long	.LASF26
	.byte	0x2
	.byte	0xa6
	.long	0x185
	.uleb128 0xd
	.long	.LASF27
	.byte	0x2
	.byte	0xa8
	.long	0x185
	.uleb128 0xd
	.long	.LASF28
	.byte	0x2
	.byte	0xbe
	.long	0x49
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF29
	.uleb128 0xb
	.long	.LASF30
	.byte	0x3
	.byte	0x51
	.byte	0x1
	.byte	0x3
	.long	0x1a5
	.uleb128 0xc
	.long	.LASF25
	.byte	0x3
	.byte	0x51
	.long	0x30
	.byte	0
	.uleb128 0xb
	.long	.LASF31
	.byte	0x2
	.byte	0xff
	.byte	0x1
	.byte	0x3
	.long	0x1f0
	.uleb128 0xc
	.long	.LASF32
	.byte	0x2
	.byte	0xff
	.long	0x185
	.uleb128 0xe
	.long	.LASF27
	.byte	0x2
	.word	0x101
	.long	0x185
	.uleb128 0xe
	.long	.LASF28
	.byte	0x2
	.word	0x117
	.long	0x30
	.uleb128 0xe
	.long	.LASF33
	.byte	0x2
	.word	0x118
	.long	0x185
	.uleb128 0xf
	.uleb128 0xe
	.long	.LASF28
	.byte	0x2
	.word	0x123
	.long	0x49
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST0
	.byte	0x1
	.long	0x243
	.uleb128 0x11
	.long	.LASF34
	.byte	0x1
	.byte	0xb
	.long	0x243
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0x11
	.long	.LASF35
	.byte	0x1
	.byte	0xb
	.long	0x9c
	.byte	0x2
	.byte	0x8c
	.sleb128 5
	.uleb128 0x11
	.long	.LASF36
	.byte	0x1
	.byte	0xb
	.long	0x249
	.byte	0x2
	.byte	0x8c
	.sleb128 7
	.uleb128 0x12
	.long	.LASF40
	.byte	0x1
	.byte	0x11
	.long	0x9c
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0xa2
	.uleb128 0x13
	.byte	0x2
	.uleb128 0x14
	.byte	0x1
	.long	.LASF53
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST1
	.byte	0x1
	.uleb128 0x15
	.byte	0x1
	.long	.LASF54
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0x28e
	.long	.LFB8
	.long	.LFE8
	.long	.LLST2
	.byte	0x1
	.long	0x28e
	.uleb128 0x16
	.string	"pid"
	.byte	0x1
	.byte	0x27
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x7
	.byte	0x2
	.long	0x132
	.uleb128 0x10
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST3
	.byte	0x1
	.long	0x2cb
	.uleb128 0x11
	.long	.LASF39
	.byte	0x1
	.byte	0x2c
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 3
	.uleb128 0x12
	.long	.LASF41
	.byte	0x1
	.byte	0x2f
	.long	0x28e
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.long	.LASF42
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST4
	.byte	0x1
	.long	0x3dd
	.uleb128 0x11
	.long	.LASF43
	.byte	0x1
	.byte	0x38
	.long	0x185
	.byte	0x2
	.byte	0x8c
	.sleb128 33
	.uleb128 0x17
	.long	0x1a5
	.long	.LBB30
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x3b
	.uleb128 0x18
	.long	0x1b2
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x19
	.long	.Ldebug_ranges0+0
	.uleb128 0x1a
	.long	0x1bd
	.byte	0x2
	.byte	0x8c
	.sleb128 5
	.uleb128 0x1a
	.long	0x1c9
	.byte	0x2
	.byte	0x8c
	.sleb128 13
	.uleb128 0x1a
	.long	0x1d5
	.byte	0x2
	.byte	0x8c
	.sleb128 9
	.uleb128 0x1b
	.long	0x156
	.long	.LBB32
	.long	.LBE32
	.byte	0x2
	.word	0x11f
	.long	0x392
	.uleb128 0x18
	.long	0x163
	.byte	0x2
	.byte	0x8c
	.sleb128 14
	.uleb128 0x1c
	.long	.LBB33
	.long	.LBE33
	.uleb128 0x1a
	.long	0x16e
	.byte	0x2
	.byte	0x8c
	.sleb128 18
	.uleb128 0x1a
	.long	0x179
	.byte	0x2
	.byte	0x8c
	.sleb128 22
	.uleb128 0x1d
	.long	0x13d
	.long	.LBB34
	.long	.LBE34
	.byte	0x2
	.byte	0xc9
	.long	0x378
	.uleb128 0x18
	.long	0x14a
	.byte	0x2
	.byte	0x8c
	.sleb128 24
	.byte	0
	.uleb128 0x1e
	.long	0x13d
	.long	.LBB36
	.long	.LBE36
	.byte	0x2
	.byte	0xd0
	.uleb128 0x18
	.long	0x14a
	.byte	0x2
	.byte	0x8c
	.sleb128 26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LBB38
	.long	.LBE38
	.long	0x3c1
	.uleb128 0x1a
	.long	0x1e2
	.byte	0x2
	.byte	0x8c
	.sleb128 28
	.uleb128 0x20
	.long	0x13d
	.long	.LBB39
	.long	.LBE39
	.byte	0x2
	.word	0x124
	.uleb128 0x18
	.long	0x14a
	.byte	0x2
	.byte	0x8c
	.sleb128 30
	.byte	0
	.byte	0
	.uleb128 0x20
	.long	0x18c
	.long	.LBB41
	.long	.LBE41
	.byte	0x2
	.word	0x129
	.uleb128 0x18
	.long	0x199
	.byte	0x2
	.byte	0x8c
	.sleb128 32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF45
	.byte	0x1
	.byte	0x20
	.long	0x42
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	currentThread
	.uleb128 0x22
	.long	0xa2
	.long	0x3ff
	.uleb128 0x23
	.long	0x3ff
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF44
	.uleb128 0x21
	.long	.LASF46
	.byte	0x1
	.byte	0x1f
	.long	0x3ef
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	threadList
	.uleb128 0x22
	.long	0x30
	.long	0x429
	.uleb128 0x24
	.long	0x3ff
	.word	0x1ff
	.byte	0
	.uleb128 0x21
	.long	.LASF47
	.byte	0x5
	.byte	0x3d
	.long	0x418
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_0
	.uleb128 0x21
	.long	.LASF48
	.byte	0x5
	.byte	0x3e
	.long	0x418
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_1
	.uleb128 0x21
	.long	.LASF49
	.byte	0x5
	.byte	0x3f
	.long	0x418
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	thread_stack_2
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB6
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI1
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI2
	.long	.LCFI3
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	.LCFI3
	.long	.LFE6
	.word	0x2
	.byte	0x8c
	.sleb128 13
	.long	0
	.long	0
.LLST1:
	.long	.LFB7
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI6
	.long	.LFE7
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
.LLST2:
	.long	.LFB8
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI10
	.long	.LFE8
	.word	0x2
	.byte	0x8c
	.sleb128 7
	.long	0
	.long	0
.LLST3:
	.long	.LFB9
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI12
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI14
	.long	.LFE9
	.word	0x2
	.byte	0x8c
	.sleb128 9
	.long	0
	.long	0
.LLST4:
	.long	.LFB10
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI17
	.long	.LCFI18
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	.LCFI18
	.long	.LFE10
	.word	0x2
	.byte	0x8c
	.sleb128 41
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	.LFB10
	.long	.LFE10-.LFB10
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB30
	.long	.LBE30
	.long	.LBB44
	.long	.LBE44
	.long	0
	.long	0
	.long	.LFB6
	.long	.LFE6
	.long	.LFB7
	.long	.LFE7
	.long	.LFB8
	.long	.LFE8
	.long	.LFB9
	.long	.LFE9
	.long	.LFB10
	.long	.LFE10
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF31:
	.string	"_delay_us"
.LASF17:
	.string	"tcb_stackPointer"
.LASF13:
	.string	"TCB_STATUS_BLOCK"
.LASF41:
	.string	"current_thread_ptr"
.LASF35:
	.string	"stack_bottom_ptr"
.LASF39:
	.string	"delay_interval_ms"
.LASF46:
	.string	"threadList"
.LASF27:
	.string	"__tmp"
.LASF53:
	.string	"switch_thread_new"
.LASF45:
	.string	"currentThread"
.LASF32:
	.string	"__us"
.LASF18:
	.string	"tcb_stack_bottom_Pointer"
.LASF33:
	.string	"__tmp2"
.LASF36:
	.string	"thread_function"
.LASF1:
	.string	"unsigned char"
.LASF43:
	.string	"delay_interval_us"
.LASF38:
	.string	"delay_thread_ms"
.LASF30:
	.string	"_delay_loop_1"
.LASF23:
	.string	"_delay_loop_2"
.LASF6:
	.string	"long unsigned int"
.LASF24:
	.string	"_delay_ms"
.LASF10:
	.string	"stack_bottom_Pointer"
.LASF15:
	.string	"TCB_STATUS_END"
.LASF47:
	.string	"thread_stack_0"
.LASF49:
	.string	"thread_stack_2"
.LASF29:
	.string	"double"
.LASF22:
	.string	"TCB_new"
.LASF40:
	.string	"stack_top_ptr"
.LASF37:
	.string	"setup_threads"
.LASF42:
	.string	"delay_thread_us"
.LASF4:
	.string	"unsigned int"
.LASF51:
	.string	".././thread.c"
.LASF52:
	.string	"C:\\\\Users\\\\Adin\\\\Documents\\\\Atmel Studio\\\\7.0\\\\2024_avros_ver0\\\\2024_avros_ver0\\\\Release"
.LASF8:
	.string	"long long unsigned int"
.LASF2:
	.string	"uint8_t"
.LASF9:
	.string	"stackPointer"
.LASF20:
	.string	"tcb_status"
.LASF48:
	.string	"thread_stack_1"
.LASF12:
	.string	"TCB_STATUS_REDAY"
.LASF44:
	.string	"sizetype"
.LASF11:
	.string	"TCB_STATUS_RUN"
.LASF34:
	.string	"tcb_ptr"
.LASF7:
	.string	"long long int"
.LASF21:
	.string	"tcb_delay_cyc_cnt"
.LASF16:
	.string	"TCB_STATUS"
.LASF54:
	.string	"get_thread_by_pid"
.LASF25:
	.string	"__count"
.LASF50:
	.string	"GNU C99 5.4.0 -mn-flash=4 -mno-skip-bug -mrelax -mmcu=avr6 -g2 -O0 -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF3:
	.string	"uint16_t"
.LASF19:
	.string	"tcb_pid"
.LASF5:
	.string	"long int"
.LASF28:
	.string	"__ticks"
.LASF0:
	.string	"signed char"
.LASF14:
	.string	"TCB_STATUS_SUSPENED"
.LASF26:
	.string	"__ms"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.2_1778) 5.4.0"
.global __do_clear_bss
