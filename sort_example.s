.text
.global main
main:
    ldr r0, =values
    ldr r1, =values.count
    ldr r1, [r1]
    bl insertion_sort

    ldr r0, =values
    ldr r1, =values.count
    ldr r1, [r1]
    mov r1, #20
    bl print_values

    mov r0, #'\n'
    bl putchar
    
    mov r7, #1
    swi 0

.global insertion_sort
insertion_sort:
    push {r0-r5, lr}
    mov r3, r0    @ items address
    mov r4, r1    @ item count
    mov r5, #0
    insertion_sort.loop1:
        ldr r1, [r3, r5, LSL #2] @ t
        mov r0, r5 @ j
        push {r0-r5, lr}
        insertion_sort.loop2:
            cmp r0, #0
            beq insertion_sort.set_value
            sub r2, r0, #1
            ldr r2, [r3, r2, LSL #2] @ values[j-1]
            cmp r1, r2
            bgt insertion_sort.set_value
            @sub r0, #1
            str r2, [r3, r0, LSL #2] @ values[j] = values[j-1]
            sub r0, #1
            b insertion_sort.loop2
        insertion_sort.set_value:
            str r1, [r3, r0, LSL #2]
        pop {r0-r5, lr}
        add r5, #1
        cmp r5, r4
        ble insertion_sort.loop1 
    pop {r0-r5, lr}
    mov pc, lr

print_values:
    push {r0-r3, lr}
    mov r2, #0
    print_values.loop:
        push {r0-r2, lr}
        ldr r1, [r0, r2, LSL #2]
        ldr r0, =numberFormatInline
        bl printf
        pop {r0-r2, lr}
        cmp r1, r2
        add r2, r2, #1
        bne print_values.loop

    pop {r0-r3, lr}
    mov pc, lr    

.data
values.count: .word 20
values: .word -900, 484, -78, 194, 518, 326, 125, 549, -145, 531, -416, 978, -416, 978, -421, -391, 841, -129, 561, 166, -3
numberFormat: .asciz "%d\n"
numberFormatInline: .asciz "%d "

