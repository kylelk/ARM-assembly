#include <stdio.h>

extern void insertion_sort(int values[], int size);

int main(){
    int number_count=0;
    int numbers[] = {1,-900, 484, -78, 194, 518, 326, 125, 549, -145, 531, -416, 978, -416, 979, -421, -391, 841, -129, 561, 166, -3}; 
    number_count = sizeof(numbers)/sizeof(int)-1;
    insertion_sort(numbers, number_count);
   
    int i;
    for(i=0; i<=number_count; i++){
        printf("%d ", numbers[i]);
    }
    putchar('\n');
  
    return 0;
}
