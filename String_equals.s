//Programmer: Diego Rojas
//Purpose: 
//Returns a -1 or a 0. compares 2 strings and if they are the same then
//it will output return a 0. if the strings are not the same then it 
//will return a 0
//USES REGISTERS X0 and X1 FOR COMPARISON
//compares lower to uppercase letters ex. A != a

	.global String_equals
	
	.data
	
	.text
	
	
	
String_equals:

//Pre-req conditions 

	//Initialize index to -1 (indicating character not found)
	mov	x2, #-1
	
	
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
	//character found return the index x2 and save into x0
	mov x2, #1		//1 for equal true
	mov x0, x2

		RET	//return to calling function

notFound:
	//character not found return -1 (x2 alreadt set to -1) save to x0
	mov x2, #0 //0 for not equal false
	mov x0, x2
	
		RET	//return to calling function
		
	.end
