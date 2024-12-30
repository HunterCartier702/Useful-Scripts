#include <stdio.h>

// Notes to help understand pointers

void printAge(int *pAge)
{
	printf("You are %d\n", *pAge); //in order to access value of the address stored within the pointer, dereference
}

int main() 
{
	// * = indirection operator (value at address)
	// & = (address of operator)
	// pointer =  a "variable-like" reference that holds a memory address to another variable, array, etc. 
	// some tasks are performed more easily with pointers
	// variables have a value and an address
	// use * operator to declare a pointer. 
	// use * operator to access a value at stored address
	// data types of variable and pointer must be the same

	int age = 21;
	//int *pAge = &age; // the address of &age == the value of *pAge. ex: 0x7fff39b38594
	int *pAge = NULL; //good practice to assign NULL if declaring a pointer
	pAge = &age;

	printf("1. address of age: %p\n", &age); //address of variable age. ex: 0x7fff39b38594
	printf("2. value of age: %d\n", age); //the value of address &age. ex: 21

	printf("3. value of pAge: %p\n", pAge); //address of value. ex: 0x7fff39b38594
	printf("4. value at stored address: %d\n", *pAge); //(value at address) or dereferencing ex: 21

	printf("the size of age: %zu bytes\n", sizeof(age)); //4 bytes. ints use 4 bytes
	printf("the size of pAge: %zu bytes\n", sizeof(pAge)); //8 bytes.

	printAge(pAge);

	return 0;
}
