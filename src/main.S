.section .rodata.main.str1.4, "aMS", @progbits, 1
.balign 4
.LC1:
.string "Hello from %s" 

.section .text.startup.main, "ax", @progbits
.global _main
.type _main, @function
.balign 4
_main:
sts.l pr, @-r15
! printf("Hello from %s", argv[0])
! basic Hello, World! script; Code from @Qbos07
mov.l .L1, r0
mov.l .L4, r4
jsr @r0
mov.l @r5, r5
mov.l .L2, r0
jsr @r0
mov #0, r4
mov.l .L3, r0
mov.l @r0, r0
jsr @r0
nop
lds.l @r15+, pr
rts
mov #0, r0
.balign 4
.L1:
.long _printf
.L2:
.long _fflush
.L3:
.long _Debug_WaitKey
.L4:
.long .LC1
.size _main, _main-.
