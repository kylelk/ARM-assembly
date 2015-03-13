.global main
main:
    mov r0, #42         @ ASCII star '*'
    bl putchar
    mov r0, #10
    bl putchar

    mov r0, #2          @ loop starting value
    mov r1, #10         @ loop limit
    bl loop
    mov r0, #42
    bl repeatChar       @ triangle base
    
    mov r0, #10         @ new line
    bl putchar

    mov r7, #1
    swi 0

loop:
    cmp r0, r1
    moveq pc, lr

    push {r0, r1, lr}    
    push {r0}
    mov r0, #42
    bl putchar
    pop {r0}
    
    sub r1, r0, #2      @ print spacing
    mov r0, #32
    bl repeatChar
    
    mov r0, #42
    bl putchar
    
    mov r0, #10
    bl putchar    
    pop {r0, r1, lr}

    add r0, #1
    b loop

@ r0  character to repeat
@ r1  times to repeat
repeatChar:
    cmp r1, #1
    movlt pc, lr
    push {r0, r1, lr}
    bl putchar
    pop {r0, r1, lr}
    sub r1, #1
    b repeatChar
