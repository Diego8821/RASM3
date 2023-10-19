	.global _start
.data
instr:	.asciz	"Cat in the hat\n"
incmp:	.asciz  "Green eggs and ham\n"
instr3:	.asciz	"cat in the hat.\n"
chFind:		.asciz	"a"
chReplace:	.asciz  "o"
ch1:		.asciz  "g"
egg:		.asciz  "egg\n"
szT:	.asciz  "True\n"
szF:	.asciz  "False\n"
szNL:	.asciz	"\n"
szS:	.asciz	" \n"
outstr:		.skip 	24
chLF:	.byte 0xa

szString1:    .asciz         "s1.length() = "
szString2:    .asciz         "s2.length() = "
szString3:    .asciz         "s3.length() = "
szString4:    .asciz         "String_equals(s1,s3) = "
szString5:    .asciz         "String_equals(s1,s1) = "
szString6:    .asciz         "String_equalsIgnoreCase(s1,s3) = "
szString7:    .asciz         "String_equalsIgnoreCase(s1,s2) = "
szString8:    .asciz         "String_substring_2(s3,7) = "
szString9:    .asciz         "String_charAt(s2,4) = "

szString11:    .asciz         "String_indexOf_1(s2,'g') = "
szString12:    .asciz         "String_indexOf_2(s2,'g',9) = "
szString13:    .asciz         "String_indexOf_3(s2,eggs) = "
szString14:    .asciz         "String_lastIndexOf_1(s2,'g') = "
szString15:    .asciz         "String_lastIndexOf_2(s2,'g',6) = "
szString16:    .asciz         "String_lastIndexOf_3(s2,egg) = "
szString17:    .asciz         "String_replace(s1,'a','o') = "
szString18:    .asciz         "String_toLowerCase(s1) = "
szString19:    .asciz         "String_toUpperCase(s1) = "
szString20:    .asciz         "String_concat(s1, " ") = "
szString21:    .asciz         "String_concat(s1, s2) = "

	.text
_start:
//==============================
//String.length() 1
	//print prompt
	ldr x0,=szString1
	bl putstring
	
	ldr x0,=instr
	bl String_length
	
	//Convert x0 to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc		//convert result to string
	//Print strResult
	LDR X0,=outstr	//X0->strResult
	BL putstring		//print
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//==============================
//String.length() 2
	//print prompt
	ldr x0,=szString2
	bl putstring
	
	ldr x0,=incmp
	bl String_length
	
	//Convert x0 to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc		//convert result to string
	//Print strResult
	LDR X0,=outstr	//X0->strResult
	BL putstring		//print
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//==============================
//String.length() 3
	//print prompt
	ldr x0,=szString3
	bl putstring
	
	ldr x0,=instr3
	bl String_length
	
	//Convert x0 to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc		//convert result to string
	//Print strResult
	LDR X0,=outstr	//X0->strResult
	BL putstring		//print
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//==============================
//ofIndex1
	//print prompt
	ldr x0,=szString11
	bl putstring

	ldr x0,=incmp
	ldr x1,=ch1
	bl String_indexOf_1
	mov x20, x0		//Keeps track on index
	add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
	
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//ofindex2
	//print prompt
	ldr x0,=szString12
	bl putstring
	
	ldr x0,=incmp
	ldr x1,=ch1
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
	
		//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//ofIndex3
	//print prompt
	ldr x0,=szString13
	bl putstring
	
	ldr x0,=incmp
	ldr x1,=egg
	bl String_indexOf_3
	//mov x20, x0		//Keeps track on index
	//add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
	
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//lastOfIndex1
	//print prompt
	ldr x0,=szString14
	bl putstring
	
	ldr x0,=incmp
	ldr x1,=ch1
	bl String_lastIndexOf_1
	mov x20, x0		//Keeps track on index
	sub x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
	
		//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//lastOfIndex2
	//print prompt
	ldr x0,=szString15
	bl putstring
	
	ldr x0,=incmp
	ldr x1,=ch1
	bl String_lastIndexOf_2
	//mov x20, x0		//Keeps track on index
	//add x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
	
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//lastOfIndex3
	//print prompt
	ldr x0,=szString16
	bl putstring
	
	ldr x0,=incmp
	ldr x1,=egg
	bl String_lastIndexOf_3
	//mov x20, x0		//Keeps track on index
	//sub x20,x20, #1	//Iterates to the next string index
	
	//Convert x0(index) to c-string & store into strResult
	LDR X1,=outstr	//X1->strResult
	BL	int64asc	//convert result to string
	
	//Print index
	ldr x0,=outstr
	bl putstring
	
	//Print "\n"
	ldr x0,=szNL
	bl putstring
//===============================
//String_replace
	//print prompt
	ldr x0,=szString17
	bl putstring
	
	ldr x0,=instr
	bl String_length
	mov x3, x0
	//ldr x1,=incmp
	//bl String_length
	add x3, x3, #20
	
	ldr x0,=instr
	ldr x1,=chFind
	ldr x2,=chReplace
	bl String_replace //(x0=*instr, x1 =*chFind, x2=*chReplace, x3=sizeString)
//==============================
//String_toLowerCase
	//print prompt
	ldr x0,=szString19
	bl putstring
	
	ldr x0,=instr
	ldr x1,=outstr
	
	bl String_toLowerCase

	ldr x0,=outstr
	bl putstring
//==============================
//String_toUpperCase
	//print prompt
	ldr x0,=szString18
	bl putstring
	
	ldr x0,=instr
	ldr x1,=outstr
	
	bl String_toUpperCase

	ldr x0,=outstr
	bl putstring
//==============================
//String_concat
	//print prompt
	ldr x0,=szString20
	bl putstring
	
	ldr x0,=instr
	bl String_length
	mov x2, x0
	//ldr x1,=szS
	//bl String_length
	add x2, x2, #20
	
	ldr x0,=instr
	ldr x1,=szS
	bl String_concat //(x0=*instr, x1 =*incmp, x2=sizeArray)
    
	//When done move value of x10 to x0
	//mov x9, x10
	//mov x0, x9
//===============================
//String_concat
	//print prompt
	ldr x0,=szString20
	bl putstring
	
	ldr x0,=instr
	bl String_length
	mov x2, x0
	//ldr x1,=incmp
	//bl String_length
	add x2, x2, #20
	
	ldr x0,=instr
	ldr x1,=incmp
	bl String_concat //(x0=*instr, x1 =*incmp, x2=sizeArray)
    
	//When done move value of x10 to x0
	//mov x9, x10
	//mov x0, x9
//===============================

	

	
	mov x0,#0
	mov x8,#93
	svc 0
