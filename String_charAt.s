.global String_charAt
	
	.data
	
	.text
	
String_charAt:

//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR

//loads from main
//x0 ,= sz1
//mov x1, #4

//parameters 
	//x0 - points to szX
	//x1 - containts indicated position
	// Output: x0 - character found
	
	
	//setup counter
		mov x9, #0

	
Loop:	

//w2 - first byte of string
	ldrb w2, [x0], #1

	//check if null
	cmp w2, #0
	b.eq done

//cmp counter to indicated value 
	cmp x9, x1
	b.eq found		//if equal save go to found


	add x9,x9, #1
	
	b Loop
	
	
found:

	mov x0, x2

done:		


//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP	
	
	RET
	
stop: 
	mov x9, #-1		//if character not found
	b done
.end
