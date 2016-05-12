.text
.global main
main:
    mov r0, #0
    mov r1, #1
    ldr r3, =limit
    ldr r3, [r3]
    bl loop

    mov r7, #1
    swi 0

loop:
    add r2, r0, r1
    mov r0, r1
    mov r1, r2

    cmp r1, r3
    bgt end_loop

    push {r0-r3}
    ldr r0, =printNum
    bl printf
    pop {r0-r3}

    bl loop

end_loop:
    #mov pc, lr

    mov r7, #1
    swi 0

.data
limit:
    .word 4000000

printNum:
    .asciz "%d\n"

