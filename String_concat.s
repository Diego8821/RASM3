//*****************************************************************
//Name: 	Diego Salas
//Program:	String_concat.s
//Class:	CS 3B
//Lab:		RASM-3
//Date:		October 19, 2023 at 3:30 PM
//Purpose:
//	Concatenates the specified string "str" at the end of the string.
// 
//Input:
//@ X0: Must point to a null terminated string
//@ X1: Must point to the string that is concatenating
//@ X2: Must contains number of bytes needed for superstring
//@ LR: Must contain the return address
//@ All registers are preserved, except X0
//
//Output:
//@ X0: Returns the new updated string 
//*****************************************************************
	.global String_concat
	.data
ptrString:	.skip 30	//int *ptrString = null (For concat & replace)
chLF:	.byte 0xa
	.text
String_concat:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
	
	//Moves address to register x20
	mov x20,x0				//x20(szX0 = x0(instr)) & avoid deletion 
							//malloc
	mov x19,x1				//x19(szX0 = x1(incmp)) & avoid deletion 
							//malloc					
   
	mov x0,x2	//x0 = x2(sizeString)
   	//Step 1 allocate enough memory (heap) to store the new string
    //Malloc looks into X0 for the number of bytes requested
    bl malloc
   
    //Step 2 store address into ptrString
    ldr x1,=ptrString
    str x0,[x1]		//ptrString = value(x0) returned by malloc
   
    //Begin the process of copying szX into *ptrString
    mov x2,x20		//x2 = x20(szX)
    ldrb w3,[x2],#1
    loop1:
        cmp w3,'\n'		//If (x3 == "\n")
        b.eq exitLoop1		//goto exitLoop1
        cmp w3,#0
        b.eq exitLoop1
        strb w3,[x0], #1	//Store szX[i] into *ptrString
        ldrb w3,[x2], #1	//copies first byte into W3
        
        //Advance both pointers (X2-src) (X0-dst)
        
        b loop1
exitLoop1:
    //Begin the process of copying szY into *ptrString
    mov x2, x19		//x2 = x20(szY0

    loop2:
        ldrb w3,[x2], #1	//copies first byte into W3
        cmp w3,'\n'		//If (x3 == "\n")
        b.eq exitLoop2		//goto exitLoop2
        cmp w3,#0
        b.eq exitLoop1
        //-- short cutting by not needing t recall the value of ptrString
        //	  since that address is already in X0
        strb w3,[x0], #1
        
        //Advance both pointers (X2-src) (X0-dst)
        
        b loop2
exitLoop2:
    
    //returns x0 with ptrString address inside ready to print
    ldr x0,=ptrString
    ldr x0,[x0]		//dereferences *ptrString to get actual address
    
    bl putstring
    
    ldr x0,=chLF
    bl putch
    
    ldr x0,=ptrString
    ldr x0,[x0]
    bl free
    
    //ldr x0,=ptrString
    //add x0,x0,#1
    //ldr x0,[x0]
    //bl free
	
	//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP
	
	ret
