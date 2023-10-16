//Programmer: Diego Rojas
//Purpose: 
//Returns a -1 or a 0. compares 2 strings and if they are the same then
//it will output return a 0. if the strings are not the same then it 
//will return a 0
//USES REGISTERS X0 and X1 FOR COMPARISON

	.global String_equals
	
	.data
	
	.text
	
	
	
String_equals:

//Pre-req conditions 

	//Initialize index to -1 (indicating character not found)
	mov	x2, #-1
	
	//loads a 32-bit word (4bytes) from memory location x0 is pointing to
	//then increment
		ldr	w2,	[x0],#1
		
	//loads a 32-bit word (4bytes) from memory location x1 is pointing to
	//then increment 		
		ldr w3, [x1], #1
	
searchLoop:
	//w2 = first byte of the string
	ldrb w2, [x0], #1
	
	//w3 = first byte of the string 
	ldrb w3, [x1], #1

	
	
	//compare the current character to the target character (x1)
	cmp w2, w3
	
	
	
	//Branch to found label if a match is found
	b.eq found
	
	
	
	//else if(not found)
	//increment the index x2 and continue searching
	add x2, x2, #1
	
	
	
	//repeat the loop
	b searchLoop
	
found:
	//character found return the index x2 and save into x0
	mov x0, x2

		RET	//return to calling function

notFound:
	//character not found return -1 (x2 alreadt set to -1) save to x0
	mov x0, x2
	
		RET	//return to calling function
		
	.end
