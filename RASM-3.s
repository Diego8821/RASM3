	.global _start
.data
instr:	.asciz	"This is our Test String that we will convert.\n"
incmp:	.asciz  "Find my orc\n"
chFind:		.asciz	"o\n"
szNL:	.asciz	"\n"
outstr:		.skip 	24
chLF:	.byte 0xa
	.text
_start:
	ldr x0,=instr
	ldr x1,=outstr
	
	bl String_toUpperCase

	ldr x0,=outstr
	bl putstring
//==============================
	ldr x0,=instr
	ldr x1,=outstr
	
	bl String_toLowerCase

	ldr x0,=outstr
	bl putstring
//==============================
//ofIndex1
	ldr x0,=instr
	ldr x1,=chFind
	bl String_indexOf_1
	mov x20, x0		//Keeps track on index
	add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//ofindex2
	ldr x0,=instr
	ldr x1,=chFind
	mov x2, x20		//x2 = previousIndex + 1
	bl String_indexOf_2
	mov x20, x0		//Keeps track on index
	add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//ofIndex3
	ldr x0,=instr
	ldr x1,=incmp
	bl String_indexOf_3
	//mov x20, x0		//Keeps track on index
	//add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//lastOfIndex1
	ldr x0,=instr
	ldr x1,=chFind
	bl String_lastIndexOf_1
	mov x20, x0		//Keeps track on index
	sub x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//lastOfIndex2
	ldr x0,=instr
	ldr x1,=chFind
	bl String_lastIndexOf_2
	//mov x20, x0		//Keeps track on index
	//add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//lastOfIndex3
	ldr x0,=instr
	ldr x1,=incmp
	bl String_lastIndexOf_3
	//mov x20, x0		//Keeps track on index
	//sub x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
//===============================
//String_concat
	ldr x0,=instr
	bl String_length
	mov x2,x0		//x2 = x0(size of string)
	
	ldr x0,=instr
	ldr x1,=incmp
	bl String_concat
    bl putstring
    
    ldr x0,=chLF
    bl putch
    
    ldr x0,=ptrString
    ldr x0,[x0]
    bl free
    
	//When done move value of x10 to x0
	mov x9, x10
	mov x0, x9
	
	mov x0,#0
	mov x8,#93
	svc 0
