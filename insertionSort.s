.text
.global insertion_sort
insertion_sort:
    push {r0-r5, lr}
    mov r3, r0    @ items address
    mov r4, r1    @ item count
    mov r5, #1    @ current item index
    insertion_sort.loop1:
        ldr r1, [r3, r5, LSL #2] @ t
        mov r0, r5 @ j
        push {r0-r2, lr}
        insertion_sort.loop2:
            cmp r0, #0
            beq insertion_sort.set_value
            sub r2, r0, #1
            ldr r2, [r3, r2, LSL #2] @ values[j-1]
            cmp r1, r2
            bgt insertion_sort.set_value
            str r2, [r3, r0, LSL #2] @ values[j] = values[j-1]
            sub r0, #1
            b insertion_sort.loop2
        insertion_sort.set_value:
            str r1, [r3, r0, LSL #2]
        pop {r0-r2, lr}
        add r5, #1
        cmp r5, r4
        ble insertion_sort.loop1 
    pop {r0-r5, lr}
    mov pc, lr

