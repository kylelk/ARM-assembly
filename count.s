.global main

printNum:
    .asciz "%d\n"
    .align 4

main:
    mov r0, #0
    mov r1, #10
    bl loop

    mov r7, #1
    swi 0

loop:
    push {r0,r1}
    mov r1, r0
    ldr r0, =printNum
    bl printf
    pop {r0,r1}
    
    cmp r0, r1
    beq end_loop

    add r0, r0, #1
    bl loop


end_loop:
    mov r7, #1
    swi 0

