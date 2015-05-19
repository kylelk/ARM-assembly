.text
.global add
add:
    push {r1-r2, lr}
    add r0, r0, r1
    pop {r1-r2, lr}
    mov pc, lr

