.text
.global string_length
string_length:
    push {r1-r2, lr}
    mov r2, r0
    _string_length_loop:
        ldrb r1, [r0], #1
        cmp r1, #0
        bne _string_length_loop
    sub r0, r2
    sub r0, #1
    pop {r1-r2, lr}
    mov pc, lr 

