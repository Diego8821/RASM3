//Programmer: Diego Rojas
//Purpose: 
//Returns a -1 or a 0. compares 2 strings and if they are the same then
//it will output return a 0. if the strings are not the same then it 
//will return a 0
//USES REGISTERS X0 and X1 FOR COMPARISON
//IGNORES uppercase letters and lower case and ex. A=a

	.global String_equalsIgnoreCase
	
	.data
	

	
	//temp destination buffer for comparisons
	sztemp1:		.space 	20	//destination string buffer
	sztemp2:		.space	20 //destination string buffer

	
	.text
	
	
	

String_equalsIgnoreCase:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
//Pre-req conditions 

	//Initialize index to 0 (indicating character not found)
	mov	x2, #-1
	
	ldr x10,=sztemp1
	ldr x11,=sztemp2

//first loop to convert toupper
String1Convert:
	
//2nd loop to convert toupper

//once converted cmp those new strings and go to searchLoop



searchLoop:
	
	//w2 = first byte of the string
	ldrb w2, [x0], #1
	
	//w3 = first byte of the string 
	ldrb w3, [x1], #1

	
	//compare the current character to the target character (x1)
	cmp w2, w3
	
	//Branch to found label if a match is found
	b.eq found
	
	cmp w2, w3
	b.ne notFound
	
	//cases where x0 or x1 reach null character first
	cmp w2, #0
	b.lt notFound
	cmp w3, #0
	b.lt notFound
	
	//repeat the loop
	b searchLoop
	


found:
	//character found return the index x2 and save into x0(TRUE)
	//mov x2, #1
	mov x0, #1
	
//mov x0, x5

//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP
	
		RET	//return to calling function
		
notFound:
	//character not found return 0 FALSE
	//mov x2, #0
	mov x0, #0
	
		RET	//return to calling function
		
	.end
