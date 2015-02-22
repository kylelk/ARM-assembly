@
@ ARM assembly programm which converts binary to ASCII
@ written by Kyle Kersey,  (C) 2015
@

.global main

main:
    adr r2, content     @ load address of binary string
    mov r3, #0          @ bit counter
    mov r4, #0          @ byte value
    b loop

loop:
    ldrb r0, [r2], #1   @ load next byte from memory
    cmp r0, #0          @ check for null terminator
    beq end_loop        @ quit loop

    sub r0, r0, #48     @ convert '0' or '1' to 0 or 1 to a bit
    lsl r4, r4, #1      @ byte<<1
    add r4, r4, r0      @ byte+=bit

    add r3, r3, #1      @ increment bit counter

    cmp r3, #8          @ if at 8th bit
    moveq r0, r4        @ move byte to r0 for printing        
    moveq r4, #0        @ clear byte
    moveq r3, #0        @ clear bit counter
    bleq printChar      @ print byte, branch with link

    b loop              @ continue loop, branch without link


end_loop:
    mov r0, #10         @ ascii new line
    bl putchar          @ print new line
    mov r7, #1          @ return 0
    swi 0               @ call software interupt 0

printChar:
    push {r2, lr}       @ store content and return address
    bl putchar          @ print ascii character stored in r0
    pop {r2,lr}         @ restore the content and return address
    mov pc, lr          @ set the return address

charFormat:
    .asciz "%c"
    .align 4

content:
    .ascii "0100100001100101011011000110110001101111001000000101011101101111011100100110110001100100\000"
    
