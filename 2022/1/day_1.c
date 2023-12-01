#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printArray(int A[], int size)
{
    int i;
    for(i = 0; i < size; i++)
        printf("%d\n", A[i]);
}

int compare(const void* a, const void* b){
    int int_a = * ((int*) a );
    int int_b = * ((int*) b );

    if(int_a == int_b) return 0;
    else if (int_a < int_b) return -1;
    else return 1;
}

int main()
{
    FILE *fp  = fopen("input.txt","r");

    int calories = 0;
    int value = 0;
    int counter = 0;

    char line[64];
    int value_arr[256];

    while (fgets(line, sizeof(line), fp))
    {
        int length = strnlen(line, 64);
        if(line[length - 1] == '\n' && length > 1)
        {
            sscanf(line, "%d", &calories);
            value += calories;
        }
        else
        {
            value_arr[counter] = value;
            value = 0;
            counter++;
        }
    }
    while(counter < 256){
        value_arr[counter] = 0;
        counter++;
    }
    fclose(fp);

    qsort(value_arr, 256, sizeof(int), compare);
    int result = value_arr[255] + value_arr[254] + value_arr[253];

    printf("Answer for Q1 is: %i\n", value_arr[255]);
    printf("Answer for Q2 is: %i", result);

    return 0;
}