#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int height;
    do
    {
        height = get_int("Height:");
    }
    while (height>8 || height<1);

   // printf("Stored: %i\n", height);

    for (int i = 0; i < height ; i++)
    {
        for (int j = 0; j < height; j++)
        {
            if (i + j < height - 1)
                printf(" ");
            else
                printf("#");
        }
    printf("\n");
    }
}
