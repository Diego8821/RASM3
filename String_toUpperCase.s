//@ Subroutine String_toUpperCase: Provided a pointer to a null terminated
//@		string, String_toUpperCase will return the string with all letters
//@		uppercased
//@ X0: address of input string
//@ X1: address of output string
//@ X4: original output string for length calc
//@	W5: current character being processed
//@ LR: Must contain the return address
//@ All registers are preserved, except X0
	
	.data
	.global String_toUpperCase
	.text
	
String_toUpperCase:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
	
	mov x4,x1	//keeping track of original output string
	
	loop:
		ldrb w5,[x0],#1		//load character and increment ptr
	//If (w5 > 'z')
		cmp w5, #'z'		//Checks
		b.gt cont			//if true goto cont
	//Else if (w5 < 'a')
		cmp w5, #'a'		//Checks
		b.lt cont			//if true goto cont
	//Else (letter is lowercase)
		sub w5,w5, #('a'-'A')	//convert to uppercase
	
	//End if
	cont:
		strb w5,[x1],#1		//store character to output str
		cmp w5,#0			//If (w5 != '\n')
		b.ne loop			//goto loop
		
	sub x0,x1,x4		//get length by subing ptrs	
	
	//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP	
	
	ret
