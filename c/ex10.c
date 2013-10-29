#include <stdio.h>
int main(int argc, char *argv[])
{
    int i = 0;

    char *arr[] = {NULL}; 
    printf("null: %s\n", arr[0]);

    // go through each string in argv
    for(i = 1; i < argc; i++) {
        printf("arg %d: %s\n", i, argv[i]);
    }
    
    // make our own array of strings
    char *states[] = {
        "California", "Oragon",
        "Washingtin", "Texas"
    };
    states[5] = argv[2];
    int num_states = 5;
    
    for(i = 0; i < num_states; i++) {
        printf("state %d: %s\n", i, states[i]);
    }

    return 0;
}
