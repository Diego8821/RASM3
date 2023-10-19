
	.global	String_copy
	
	.data
	
	.text
	
String_copy:
	
	//Pre-req conditions 
	// x0 - holds original string to be copied
	// x1 - gets a copy of x0
	// x0 - x1 gets moved back into x0

	//Initialize index to 0 
	mov	x2, #0
	
	//Dont need since you are already going on the first byte inside
	//of copyLoop
	//loads a 32-bit word (4bytes) from memory location X0 is pointing to
	//then increment
		//ldr	w2,	[x0],#1

	
copyLoop:
	//w2 = first byte of the string
	ldrb w2, [x0], #1

	
	//store into x1 while going throgh x0 string
	strb w2, [x1], #1
	
	cmp w2, #0		//if reached end of string
	b.eq done
	
	//else
	//increment the index x2 and continue searching
	add x2, x2, #1
	
	
	
	//repeat the loop
	b copyLoop
	
done:

	//save the result into x0
	mov x0, x1
	
	ret
	
.end
	
