#include <stdio.h>

/* My first C program to practice writing and reading files. 
Useless but good practice. I hope to look back on this to see how much more I have learned.*/

void createFile();
void readFile();
void writeFile();

int main() {
	createFile();
	writeFile();
	readFile();
	printf("EOF\n");
	return 0;
}

void createFile() {
	FILE *fptr = fopen("./id_rsa", "w");
	fclose(fptr);
	return;
}

void writeFile() {
	FILE *fptr = fopen("./id_rsa", "w");
	fprintf(fptr, "No keys here bud\nTry again\n");
	fclose(fptr);
	return;
}

void readFile() 
{
    FILE *fptr = fopen("./id_rsa", "r");
    char buffer[50];

    if (fptr != NULL) 
    {
        printf("Reading file:\n");
        while (fgets(buffer, 50, fptr)) 
        {
            printf("%s", buffer);
        }
    } 
    else 
    {
        printf("Not able to open file.");
    }

    fclose(fptr);
    return;
}
