.text
.global main
main:
    ldr r2, =message
    mov r3, #0
    bl loop
    mov r7, #1
    swi 0
    
loop:
    ldr r2, =message
    ldr r1, [r2, r3]
    cmp r1, #0
    moveq pc, lr
    push {r0-r3, lr}
    ldr r0, =charFormat
    bl printf
    pop {r0-r3, lr}
    add r3, r3, #1
    b loop

.data
charFormat:
    .asciz "%c\n"

message:
    .asciz "hello world\000"


