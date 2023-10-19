//*****************************************************************
//Name: 	Diego Salas
//Program:	String_replace.s
//Class:	CS 3B
//Lab:		RASM-3
//Date:		October 19, 2023 at 3:30 PM
//Purpose:
//	It returns the new update string after changing all the occurrences
// of oldChar with newChar
// 
//Input:
//@ X0: Must point to a null terminated string
//@ X1: Must point to oldChar
//@ X2: Must point to newChar
//@ X3: Must contains number of bytes needed for string
//@ LR: Must contain the return address
//@ All registers are preserved, except X0
//
//Output:
//@ X0: Returns the new updated string 
//*****************************************************************
	.global String_replace
	.data
ptrString2:	.skip 30	//int *ptrString = null (For concat & replace)
chLF:	.byte 0xa
	.text
String_replace:
	//Preserve AAPCS registers
	str x19, [SP, #-16]!	//PUSH
	str x20, [SP, #-16]!	//PUSH
	str x21, [SP, #-16]!	//PUSH
	str x30, [SP, #-16]!	//Push LR
	
	//Moves address to register x20
	mov x20,x0				//x20(szX0 = x0(instr)) & avoid deletion 
							//malloc
	mov x19,x1				//x19(szX0 = x1(oldChar)) & avoid deletion 
							//malloc	
	mov x21,x2				//x21(szX0 = x1(newChar)) & avoid deletion 
							//malloc					
   
	mov x0,x3	//x0 = x3(sizeString)
   	//Step 1 allocate enough memory (heap) to store the new string
    //Malloc looks into X0 for the number of bytes requested
    bl malloc
   
    //Step 2 store address into ptrString
    ldr x1,=ptrString2
    str x0,[x1]		//ptrString = value(x0) returned by malloc
   
    //Begin the process of copying szX into *ptrString
    mov x2,x20		//x2 = x20(instr)
    ldrb w4,[x19], #1	//Load oldChar
    ldrb w5,[x21], #1	//Load newChar
    loop1:
        ldrb w3,[x2], #1	//copies first byte into W3
        cmp w3,w4			//If(string[i] == oldChar)
        b.eq replace
        cmp w3,'\n'			//If (x3 == "\n")
        b.eq exitLoop1		//goto exitLoop1
        cmp w3,#0
        b.eq exitLoop1
        strb w3,[x0], #1	//Store szX[i] into *ptrString
        
        //Advance both pointers (X2-src) (X0-dst)
        
        b loop1
        
        
        //Deals special case IN LOOP1
        replace:
			strb w5,[x0],#1
			b loop1
exitLoop1:
    //returns x0 with ptrString address inside ready to print
    ldr x0,=ptrString2
    ldr x0,[x0]		//dereferences *ptrString to get actual address
    
    bl putstring
    
    ldr x0,=chLF
    bl putch
    
    ldr x0,=ptrString2
    ldr x0,[x0]
    bl free
    
    //ldr x0,=ptrString1
    //add x0,x0,#1
    //ldr x0,[x0]
    //bl free
	
	//Popped in reverse order
	ldr x30, [SP], #16		//POP LR
	ldr x21, [SP], #16		//POP
	ldr x20, [SP], #16		//POP
	ldr x19, [SP], #16		//POP
	
	ret
