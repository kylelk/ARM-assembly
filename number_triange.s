.text
.global main
main:
    mov r0, #10
    mov r1, #1
    bl triangle

    mov r0, #10
    bl putchar

    mov r7, #1
    swi 0

triangle:
    cmp r1, r0
    movgt pc, lr
    push {r0,r1,lr}
    mov r0, r1
    mov r1, #1
    bl row
    mov r0, #10
    bl putchar
    pop {r0,r1,lr}
    add r1, r1, #1
    b triangle

row:
    cmp r1, r0
    movgt pc, lr
    push {r0,r1,lr}
    ldr r0, =numFormat
    bl printf
    pop {r0,r1,lr}
    add r1, r1, #1
    b row

.data
numFormat:
    .asciz "%d "

