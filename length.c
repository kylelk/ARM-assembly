#include <stdio.h>

extern int string_length(char *str);

int main(){
    int len;
    static char *message = "hello world";
    len = string_length(message);
    printf("%d\n", len);
    return 0;
}
