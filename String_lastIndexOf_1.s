//*****************************************************************
//Name: 	Diego Salas
//Program:	String_lastIndexOf_1.s
//Class:	CS 3B
//Lab:		RASM-3
//Date:		October 19, 2023 at 3:30 PM
//Purpose:
//	Returns the last occurrence of the character ch in the string
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
	.global String_lastIndexOf_1
	.data
	.text
String_lastIndexOf_1:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
	
	//Step-1 iterate string until the last characters
	//initialize counter for reverseString
	mov x9, #0
	
	//W2 first byte of string
	ldrb w2, [x0], #1
	
	reverseString:
		//Check if string[i] == "\n"
		cmp w2, #0
		b.eq stopReverse	//if true goto stopReverse
		
		//Else
		ldrb w2, [x0], #1	//next string[i]
		add x9, x9, #1		//count++
	
		b reverseString

stopReverse:
	//initialize counter for findCharacter
	add x9,x9,#1	//To account for the "\n" at the end of string
	mov x10, x9
	
	//W2 last byte of string
	ldrb w2, [x0], #-1
	//W3 load character wanting to be found
	ldrb w3, [x1], #1
	
	findCharacter:	
		//If (string[i] == x1)
		cmp w2, w3
		b.eq characterFound
		
		//Else
		ldrb w2, [x0], #-1	//Check next string[--i]
		sub x10, x10, #1		//count++
		
		cmp x10,#0
		b.eq stopCount
	
		b findCharacter
stopCount:
	mov x9, #-1		//x9 = -1 (Used if character not found)
characterFound:
	
	//When done move value of x10 to x0
	mov x9, x10
	mov x0, x9
	
	//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP
	
	ret
