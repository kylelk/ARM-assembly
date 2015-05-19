#include <stdio.h>

extern int add(int a, int b);

int main(){
    int a,b,n;
    a = 3;
    b = 5;
    n = add(a,b);
    printf("%d=%d+%d\n",n,a,b);
    return 0;
}
