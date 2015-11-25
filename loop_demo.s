.arm
.text
.global main
main:
    mov r0, #0
    mov r1, #0
loop:
    cmp r0, r1
    add r0, r0, #1
    blt loop
    mov r0, #0
    ldr r1, =loop_count
    ldr r2, [r1]
    add r2, r2, #1
    str r2, [r1]

    push {r0-r2, lr}
    mov r1, r2
    ldr r0, =numberFormat
    bl printf
    pop {r0-r2, lr}

    ldr r1, =max_count
    ldr r1, [r1]
    cmp r2, r1


    ldr r1, =loops_per_cycle
    ldr r1, [r1]

    blt loop
 
    mov r7, #1
    swi 0

.data
loop_count: .word 0
max_count: .word 100
loops_per_cycle: .word 0xfffff
.align 4
numberFormat: .asciz "%d\n"

