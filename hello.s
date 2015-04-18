@ can be compiled using:  gcc -nostdlib hello.s -o hello
@ can also be compiled using:  as hello.s -o hello.o ; ld hello.o -o hello
.global _start
_start:
    mov r0, #1
    ldr r1, =message
    ldr r2, =len
    mov r7, #4
    swi 0
    
    mov r0, #0
    mov r7, #1
    swi 0

.data
message:
    .ascii "hello world\n"
len = .-message
