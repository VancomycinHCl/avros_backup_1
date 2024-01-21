	.file	"user_func.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__RAMPZ__ = 0x3b
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.thread0_main,"ax",@progbits
.global	thread0_main
	.type	thread0_main, @function
thread0_main:
.LFB0:
	.file 1 "../user_func/user_func.c"
	.loc 1 14 0
	.cfi_startproc
	push r28
.LCFI0:
	.cfi_def_cfa_offset 4
	.cfi_offset 28, -3
	push r29
.LCFI1:
	.cfi_def_cfa_offset 5
	.cfi_offset 29, -4
	push __zero_reg__
	push __zero_reg__
.LCFI2:
	.cfi_def_cfa_offset 7
	in r28,__SP_L__
	in r29,__SP_H__
.LCFI3:
	.cfi_def_cfa_register 28
/* prologue: function */
/* frame size = 2 */
/* stack size = 4 */
.L__stack_usage = 4
	.loc 1 15 0
	ldi r24,lo8(1)
	ldi r25,0
	std Y+2,r25
	std Y+1,r24
.L4:
.LBB2:
	.loc 1 18 0 discriminator 5
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
	.loc 1 19 0 discriminator 5
	ldd r24,Y+1
	ldd r25,Y+2
	call delay_us
	.loc 1 20 0 discriminator 5
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 21 0 discriminator 5
	ldi r18,lo8(-24)
	ldi r19,lo8(3)
	ldd r24,Y+1
	ldd r25,Y+2
	movw r20,r18
	sub r20,r24
	sbc r21,r25
	movw r24,r20
	call delay_us
	.loc 1 22 0 discriminator 5
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,-27
	sbci r25,3
	brge .L2
	.loc 1 22 0 is_stmt 0 discriminator 1
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,2
	rjmp .L3
.L2:
	.loc 1 22 0 discriminator 2
	ldi r24,lo8(1)
	ldi r25,0
.L3:
	.loc 1 22 0 discriminator 4
	std Y+2,r25
	std Y+1,r24
.LBE2:
	.loc 1 23 0 is_stmt 1 discriminator 4
	rjmp .L4
	.cfi_endproc
.LFE0:
	.size	thread0_main, .-thread0_main
	.section	.text.thread1_main,"ax",@progbits
.global	thread1_main
	.type	thread1_main, @function
thread1_main:
.LFB1:
	.loc 1 27 0
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
.L6:
.LBB3:
	.loc 1 30 0 discriminator 1
	ldi r24,lo8(1)
	ldi r25,0
	call delay_thread_ms
	.loc 1 31 0 discriminator 1
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	.loc 1 32 0 discriminator 1
	ldi r24,lo8(1)
	ldi r25,0
	call delay_thread_ms
	.loc 1 33 0 discriminator 1
	ldi r24,lo8(37)
	ldi r25,0
	movw r30,r24
	ld r24,Z
	ldi r24,lo8(37)
	ldi r25,0
	ldi r18,lo8(-1)
	movw r30,r24
	st Z,r18
.LBE3:
	.loc 1 34 0 discriminator 1
	rjmp .L6
	.cfi_endproc
.LFE1:
	.size	thread1_main, .-thread1_main
	.text
.Letext0:
	.file 2 "d:\\program files\\atstudio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xd9
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF9
	.byte	0xc
	.long	.LASF10
	.long	.LASF11
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF12
	.byte	0x2
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF6
	.uleb128 0x5
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xac
	.uleb128 0x6
	.string	"a"
	.byte	0x1
	.byte	0xf
	.long	0x42
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x7
	.long	.LBB2
	.long	.LBE2
	.uleb128 0x8
	.byte	0x1
	.long	.LASF7
	.byte	0x1
	.byte	0x13
	.long	0x42
	.byte	0x1
	.uleb128 0x9
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF14
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.uleb128 0x7
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x8
	.byte	0x1
	.long	.LASF8
	.byte	0x1
	.byte	0x1e
	.long	0x42
	.byte	0x1
	.uleb128 0x9
	.byte	0
	.byte	0
	.byte	0
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
	.uleb128 0x6
	.uleb128 0x34
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
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0
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
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI3
	.long	.LFE0
	.word	0x2
	.byte	0x8c
	.sleb128 7
	.long	0
	.long	0
.LLST1:
	.long	.LFB1
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
	.long	.LFE1
	.word	0x2
	.byte	0x8c
	.sleb128 5
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x24
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	.LFB1
	.long	.LFE1-.LFB1
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB0
	.long	.LFE0
	.long	.LFB1
	.long	.LFE1
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"thread1_main"
.LASF9:
	.string	"GNU C11 5.4.0 -mn-flash=4 -mno-skip-bug -mrelax -mmcu=avr6 -g2 -O0 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"delay_thread_ms"
.LASF4:
	.string	"long unsigned int"
.LASF7:
	.string	"delay_us"
.LASF2:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF12:
	.string	"uint8_t"
.LASF10:
	.string	"../user_func/user_func.c"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"thread0_main"
.LASF11:
	.string	"C:\\\\Users\\\\Adin\\\\Documents\\\\Atmel Studio\\\\7.0\\\\2024_avros_ver0\\\\2024_avros_ver0\\\\Debug"
.LASF3:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.2_1778) 5.4.0"
