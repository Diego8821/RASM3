//*****************************************************************
//Name: 	Diego Salas
//Program:	String_indexOf_1
//Class:	CS 3B
//Lab:		RASM-3
//Date:		October 19, 2023 at 3:30 PM
//Purpose:
//	Returns theindex of first occurrence of the specified character ch
// in the string
// 
//Input:
//@ X0: Must point to a null terminated string
//@ X1: Must point to the character to find
//@ LR: Must contain the return address
//@ All registers are preserved, except X0
//
//Output:
//@ X0: Contains the index of where the character was found
//		(If not found X0 = -1)
//*****************************************************************
	.global String_indexOf_1
	.data
	.text
String_indexOf_1:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
	
	//initialize counter for findCharacter
	mov x9, #0
	
	//W2 first byte of string
	ldrb w2, [x0], #1
	//W3 load character wanting to be found
	ldrb w3, [x1], #1
	
	findCharacter:
		//Check if string[i] == "\n"
		cmp w2, #0
		b.eq stopCount	//if true goto stopCount
		
		//Else if (string[i] == x1)
		cmp w2, w3
		b.eq characterFound
		
		//Else
		ldrb w2, [x0], #1	//Check next string[i]
		add x9, x9, #1		//count++
	
		b findCharacter

stopCount:
	mov x9, #-1		//x9 = -1 (Used if character not found)
characterFound:
	
	//When done move value of x9 to x0
	mov x0, x9
	
	//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP
	
	ret
