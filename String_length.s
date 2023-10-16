//Programmer: Diego Rojas
//Program:		String_length.s
//class:		CS3B
//Lab:			10
//Date:			10/12/2023
//Purpose:
//	String_length function is a loop that keeps going string == null
//	once it exits out of the loop it will then save the result into x0
//	and return once the function is called again

	.global String_length	

	.data

	.text



String_length:

//Pre-req conditions

	//intiallize a counter for the string length
		mov	x1,	#0
		
	//W2 = first byte of the string
		ldr	w2,	[x0],#1
		
	
top:
	//compare w2 to ascii null character
		cmp	w2, #0
		b.eq	bottom		
		
	//else reload w2 and increment x1
		ldrb w2, [x0],#1
		add x1, x1, #1
	
	//then reloop until false
		b top
		
bottom:

	//When done move the value of x1 into x0
		mov x0, x1

		RET	//return to calling function
	
	.end
