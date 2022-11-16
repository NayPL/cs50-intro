#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;

int main(int argc, char *argv[])
{
    // Check command-line arguments
    if (argc != 2)
    {
        printf("Wrong command-line usage\n");
        return 1;
    }

    // Open file in read mode
    FILE *file = fopen(argv[1], "r");

    // Check if file is readable
    if (!file)
    {
        printf("File cannot be read\n");
        return 1;
    }

    // Check if it's a JPEG
    BYTE bytes[512];
    int counter = 0;
    FILE *filename = NULL;
    char img[8];

    while (fread(bytes, 512, 1, file) == 1)
    {
        if (bytes[0] == 0xff && bytes[1] == 0xd8 && bytes[2] == 0xff && (bytes[3] & 0xf0) == 0xe0)
        {
            if (counter > 0)
            {
                fclose(filename);
            }

            // Write JPEG into img
            sprintf(img, "%03i.jpg", counter);

            // Open file in write mode
            filename = fopen(img, "w");

            counter++;
        }

        if (filename != NULL)
        {
            fwrite(bytes, 512, 1, filename);
        }
    }

    // Close files
    fclose(filename);
    fclose(file);

    return 0;
}
