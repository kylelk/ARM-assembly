.arm
.text
.global main
main:
    mov r7, #1
    swi 0

average_numbers:
    .average_numbers.next:
         

.data
.align 4
numbers_length: 10
.align 4
numbers_length_list: 1,2,3,4,5,6,8,9,10

