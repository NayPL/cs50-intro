#include <cs50.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

bool only_digits(string text);
char rotate(char text, int number);

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");

        return 1;
    }
    else if (only_digits(argv[1]) == false)
    {
        printf("Usage: ./caesar key\n");

        return 1;
    }

    int key = atoi(argv[1]);
    string plain = get_string("plaintext:  ");

    printf("ciphertext:  ");
    for (int i = 0, n = strlen(plain); i < n; i++)
    {
        char cipher = rotate(plain[i], key);
        printf("%c", cipher);
    }

    printf("\n");

    return 0;
}

bool only_digits(string text)
{
    for (int i = 0; i < strlen(text); i++)
    {
        if (isdigit(text[i]))
        {
            return true;
        }
    }
    return false;
}

char rotate(char text, int number)
{
    int txt = 0;
    int c = 0;

    for (int i = 0, n = text; i < n; i++)
    {
        if (isalpha(text) && islower(text))
        {
            txt = (int)text - 97;
            c = (txt + number) % 26 + 97;

            return (char)c;
        }
        else if (isalpha(text) && isupper(text))
        {
            txt = (int)text - 65;
            c = (txt + number) % 26 + 65;

            return (char)c;
        }
    }
    return text;
}
