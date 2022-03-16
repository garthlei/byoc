/* Exception vectors section.  */
    .section .vectors, "ax"

/* 0x100: OpenRISC RESET reset vector. */
	.org 0x100

/* Jump to program initialisation code */
    .global _main
    /* l.nop */
    l.movhi r4, hi(_main)
    l.ori r4, r4, lo(_main)
    l.jr    r4
    l.nop

/* Main executable section.  */
    .section .text

    .global _main
_main:
    l.addi    r1,r0,0x1
    l.addi    r2,r1,0x2
    l.addi    r3,r2,0x4
    l.addi    r4,r3,0x8
    l.addi    r5,r4,0x10
    l.addi    r6,r5,0x20
    l.addi    r7,r6,0x40
    l.addi    r8,r7,0x80
    l.addi    r9,r8,0x100
    l.addi    r10,r9,0x200
    l.addi    r11,r10,0x400
    l.addi    r12,r11,0x800
    l.addi    r13,r12,0x1000
    l.addi    r14,r13,0x2000
    l.addi    r15,r14,0x4000
    l.addi    r16,r15,0x8000

    l.sub    r31,r0,r1
    l.sub    r30,r31,r2
    l.sub    r29,r30,r3
    l.sub    r28,r29,r4
    l.sub    r27,r28,r5
    l.sub    r26,r27,r6
    l.sub    r25,r26,r7
    l.sub    r24,r25,r8
    l.sub    r23,r24,r9
    l.sub    r22,r23,r10
    l.sub    r21,r22,r11
    l.sub    r20,r21,r12
    l.sub    r19,r20,r13
    l.sub    r18,r19,r14
    l.sub    r17,r18,r15
    l.sub    r16,r17,r16

    /* Set sim return code to 0 - meaning OK. */
    l.movhi    r3, 0x0
pass:
    l.nop     0x1 /* Exit simulation */
    l.nop
    l.nop

