
.586
.model flat, c
.stack 100h
.data
;count dword ?		; -------> ---- Assembly Adding Powers ----
	counter dword 0		; dword(doubleWord) is 32bits and 2words ---> 1byte=8bits, 2bytes=word, 4bytes(32bits)=2words -> dword
.code

doit proc

	; this is a comment i can type whatever i like after a semicolon and assembler will ignore it
	
	; ----------------------- Alternating Operations - Our Next Challenge ------------------------------------------



	ret

	; ----------------- Assembly - Jump Overflow ------------------------------------

	; Static - means its loaded, it exist for the entire duration of the program
	; General Purpose Registers - eax, ebx, ecx, edx 
	; zero flag - bit 6	-> 1 if result is 0, 0 if result is not 0
	; sign flag - bit 7	-> 1 if negative, 0 if positive
	; overflow bit - bit 11
	
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
	; program exercise of how many multiplyCauseAnOverflow by 3's to overflow -> overflow in etiration 20

;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;
;	mul ebx,	
;	;jo multiplyCauseAnOverflow		;jo - jump overflow
;	add ecx, eax
;	jo additionCauseAnOverflow
;	inc counter
;	cmp counter, 5
;	;cmp counter, 100		; overflow value of ECX = B6D41DB8, which is over 32bits  
;	jl again
;
;;multiplyCauseAnOverflow:
;;	nop			; nop - no operation - means waste away, for breakpoint
;additionCauseAnOverflow
;	nop
;	ret			; ecx --- holds the total value of 363 in Hex is 16B
	
	; -------- How overflow bit turn on ---------

;	mov eax, 0ffffffffh
;	mov ebx, 2
;	mul ebx
;
;	ret

	; ----------------- Assembly - Static Memory ---------------------------------------

	; Static - means its loaded, it exist for the entire duration of the program
	; General Purpose Registers - eax, ebx, ecx, edx 
	
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B


;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;	mul ebx,		
;	add ecx, eax
;	inc counter
;	cmp counter, 5
;	;cmp counter, 100		; overflow value of ECX = B6D41DB8, which is over 32bits  
;	jl again
;
;	ret			; ecx --- holds the total value of 363 in Hex is 16B

	; ----------------- Assembly - Adding Up to the Nth Power ----------------------------------
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;	xor edx, edx
;
;again:
;	mul ebx,		
;	add ecx, eax
;	inc edx			; error loop 
;	;cmp eax, 243
;	cmp edx, 5
;	jl again
;
;	ret

	; ----------------- Assembly - Writing a Program to Add the Powers -------------------------

		; requires self implementation knowledge
	; 3square = 3 x 3 = 9	; total sum 12, total hex C
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(ebx)		Power(eax)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; program challenge: 3^1 + 3^2 + 3^3 + 3^4 + ..... + 3^100
	
	; ----- initialization -----
;	mov eax, 1
;	mov	ebx, 3
;	xor ecx, ecx
;
;again:
;	mul ebx, eax		
;	add ecx, eax
;	cmp eax, 243
;	jl again
;
;	ret

	; --------------- Assembly Adding Powers ------------------------

	; requires self implementation knowledge
	; 3square = 3 x 3 = 9	; total sum 12, total hex C
	; 3^5 = 3x3x3x3x3=243	; total sum 363, total hex 16B
;	 loop(eax)		Power(ebx)		totalSum(ecx)		totalHex
;		3^1				3				3					3
;		3^2				9				12					C
;		3^3				27				39					27
;		3^4				81				120					78
;		3^5				243				363					16B
	; program challenge: 3^1 + 3^2 + 3^3 + 3^4 + ..... + 3^100

	;ret

	; ---------- Subtle Assembly Bugs --------------------
	
	; eax will store the accumalation (sum)
	; ecx will store the count

	; ----- add 1 to 10000 --------

;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;;again:				 ; error infinite loop with no change 
;	inc ecx
;	cmp ecx, 10000	; increment to 10000
;	;cmp ecx, 3
;	;inc ecx		; error cmp must be above the jle(conditional branch)
;;again:				 ; error infinite loop of "jle again"
;	jle again		; jump lessthan/equalto
;
;
;	ret			

	; ----------- Assembly Adding 1 to 100 -----------------

	; eax will store the accumalation (sum)
	; ecx will store the count

	; ----- add 1 + 2 + 3 -----		; result 6
;
;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;	inc ecx
;	cmp ecx, 3		; increment to 6
;	jle again		; jump lessthan/equalto
;
;	; add 1 + 2 + 3		; result 6
;
;	ret				; result 6  will ret bec -> not jle -> cmp ecx, 3

;	; ----- add 1 to 100 --------
;
;	move eax, 0
;	move ecx, 1
;again:
;	add eax, ecx
;	inc ecx
;	cmp ecx, 100	; increment to 100
;	jle again		; jump lessthan/equalto
;
;
;	ret			

	; ----------- Assembly Multiple Branches --------------
	; combining conditional/unconditional branching statements

	;move eax, 3
	;move eax, 5		; cmp eax ---- 5 - 5 = 0 (signflag(0))(zeroflag(1))
;	move eax, 9
;	cmp eax, 5		; 3 - 5 = -2 (signflag(1))(zeroflag(0))
;	jl lessThan5	; conditional branching statements
;	je equalTo5
;	jg greaterThan5
;
;lessThan5:			
;	mov ebx, -1		; 0FFFFFFFFh
;	jmp done		; unconditional branching statements
;equalTo5:			; 5-5=0 will jump here
;	mov ebx, 0
;	jmp done
;greaterThan5:		; move eax, 9 will jump here
;	mov ebx, 1
;	jmp done
;done:
;
;	ret				; return statement - also a branch

	; --------- Assembly Conditional Jumps -------------
	; Compare Instructions(cmp) --- sign (1(negative) 0(Positive)), zero (1(0value) 0(not0value))
	; Critical Point -- cmp must be above of a conditional branch example jl

;	mov eax, 0
;doItAgain:
;	inc eax
;	cmp eax, 5
;	;jmp doItAgain		; jmp -- unconditional branch(upward)
;	;jl doItAgain		; conditional branch(upward) jl -- jump less than	; cmp eax, 5 ; 5-5=0 
;	jge doItAgain		; jge - jump greaterthanequalto -- conditional branch(upward)
;
;	ret

	; -------- Assembly Increment (inc) and Decrement (dec) -------------

;	;mov eax, 0
;	;add eax, 1
;	;inc eax				; inc eax is same as add eax
;	;add eax, 1
;	;dec eax				; dec eax is same as sub eax
;	;add eax, 1
;	;add eax, 1
;
;	mov eax, 0
;doItAgain:				; unconditional jumping
;	;add eax, 1
;	inc eax
;	jmp doItAgain
;
;
;
;	ret

	; --------- Assembly Jump (jmp) Instruction ------------
	; EIP ---  Extended(32bits) Instruction Pointer -- a tracker to point its next instruction to execute
	; jmp --- same as goto(requires knowledge in goto)
	; main point is that every time you use a break, continue, return, if, while, for, do-while, and even a throw, you are using goto. They are just "controlled" or "structured" gotos, but they are still gotos.  However, in C# and C++, a goto is best if only used to break out of nested loops. You can't break out of nested loops by just using "break", so you are forced to use an actual GOTO.

	;move eax, 1
	;move eax, 2
	;jmp	anotherLocation		; jumps to "anotherLocation:"
	;
	;; mov eip, 0x003F101A	; error: cant directly modify EIP
	;move eax, 3
	;move eax, 4	
;anotherLocation:		; label for jumping to EIP here
	;move eax, 5
	;move eax, 6
	;
	;
	;ret

	; ------ Assembly Instruction Pointer ------
	; EIP ---  Extended(32bits) Instruction Pointer -- a tracker to point its next location

	;move eax, 1
	;move eax, 2
	;move eax, 3
	;move eax, 4
	;move eax, 5
	;move eax, 6
	;
	;
	;ret

	; ---------- Assembly Flags Register Sign Bit and Zero Bit -------------

	; EFL --- Flags registers(off/on) - Extended32bits(boleans bits)
	; Compare Instructions(cmp) --- sign (1(negative) 0(Positive)), zero (1(0value) 0(not0value))

	;mov eax, 1
	;cmp eax, 2	; compare(substract), 1-2 = -1, 1001

	;mov eax, 1
	;cmp eax, 2	; 2-1 = 1 , 0000

	;mov eax, 2
	;cmp eax, 2	; 2-2 = 0 , 0100
	


	;ret

	; --------------- Assembly Loop Primer ---------------
	; 1 + 2 + 3 + 4 + 5 = 15
	'mov eax, 1
	'add eax, 2
	'add eax, 3
	'add eax, 4		; 10	;0000000A
	'add eax, 5		; 15	;0000000F
	'; 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 ......
	'add eax, 6
	'add eax, 7
	'add eax, 8
	'add eax, 9
	'add eax, 10
	'add eax, 11
	'add eax, 12
	'add eax, 13
	'
	'
	'ret

	; ---- Programming the Scientific Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; scientific, 25 is the result for scientific calc

	;mov eax, 3
	;mov ebx, 4
	;mul ebx				; 3 * 4 = 12 -> eax		0000000C
	;mov ecx, eax		; 12 -> ecx				0000000C	; needed to mov for div
	;mov eax, 6
	;mov ebx, 2
	;div ebx				; 6 / 2 = 3 -> eax
	;add ecx, eax		; 12 + 3 = 15 -> ecx	0000000F
	;mov eax, 2
	;mov ebx, 5
	;mul ebx				; 2 * 5 = 10 -> eax		0000000A
	;add eax, ecx		; 15 + 10 = 25 -> eax	00000019



	;ret

	; ---- Optimizing the Previous Code Using Immediate Values ----

	;; 3 * 4 + 6 / 2 + 2 * 5 
	;
	;; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;;mul 4		; error -- immediate operand not allowed
	;;move ebx, 6
	;;add eax, ebx		; 12 + 6 = 18	00000012
	;add eax, 6		; opimize - embed immediate value 6
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9	
	;;div 2		; error -- immediate operand not allowed
	;;add eax, ebx		; 9 + 2 = 11	0000000B
	;add eax, 2		; opimize - embed immediate value 2
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037
	;
	;
	;; scientific, 25 is the result for scientific calc
	;
	;
	;
	;ret

	; ----- Programming the Standard Version's Expression Tree -----
	; 3 * 4 + 6 / 2 + 2 * 5 

	; standard, 55 is the result for standard calc
	;mov eax, 3			; 3 * 4
	;mov ebx, 4			
	;mul ebx				; eax = 12		0000000C
	;move ebx, 6
	;add eax, ebx		; 12 + 6 = 18	00000012
	;mov ebx, 2			; 18 / 2 
	;div ebx				; eax = 9		
	;add eax, ebx		; 9 + 2 = 11	0000000B
	;mov ebx, 5			; 11 * 5 
	;mul ebx				; eax = 55		00000037

	
	; scientific, 25 is the result for scientific calc



	;ret

	; ---- Two Expression Trees For the Same Equation -----
	; 3 * 4 + 6 / 2 + 2 * 5
	; 55 is the result for standard calc
	; 25 is the result for scientific calc


	;ret

	; ---- Expression Trees -----
	; 7 * 2 + 5 * 6		
	; result of expression in scientific calculator is 44
	; result in standard calculator is 114


	;ret

	; ----A More Complex Mathematical Expression ----

	; 7 + 2 * 8 - 8 / 5
	
	mov eax, 2		; eax 00000002
	mov ebx, 8		; ebx 00000008
	mul ebx			; (eax2 + ebx8)result 16decimal in eax hexadecimal00000010
	mov ecx, eax	; copy eax16 to ecx hexadecimal00000010
	mov eax, 8		; change eax2 to eax8 00000008
	mov ebx, 5		; change ebx8 to ebx5 00000005
	div ebx			; (eax8 / ebx5)result 1 in eax 00000001, remainder 3 in edx 00000003
	; 7 + 16 - 1
	mov ebx, 7		; ebx 00000007
	add ebx, ecx	; (ebx7 + ecx16)result decimal23 in ebx hexadecimal00000017
	; 23 - 1
	sub ebx, eax	; (ebx23 - eax1)result decimal22 in ebx hexadecimal00000016
	
	
	
	;ret
	
	
	
	; 9 / 2

	; ----Dividing Large Numbers---

	;mov eax, 0FFFFFFFFh	; largest 64bit value
	;mov edx, 0FFFFFFFFh
	;mov ebx, 2
	;div ebx
	;ret
	;error - integer overflow - result is too large must be less than 32bit


	;mov eax, 9		; eax(0000 0009) has the answer, edx(0000 0001) has the remainder
	;mov ebx, 2
	;mov edx, 1
	;div ebx
	;ret
	; ----Dividing Large Numbers---END
	
	
	;mov eax, 9		; eax has the answer, edx has the remainder
	;mov ebx, 2
	;div ebx
	
	; 2 useful assembly instrutions: nop , ret
	;nop				; no operation or do nothing for debugging
	;nop
	;nop
	;nop
	;ret				; return 
	
	
	
	; 8 * 4 

	;mov eax, 8		; eax is accumalator registry
	;mov ebx, 4
	;mov edx, 21323	; edx will fill the overflow	; edx is a data registry
	; mul eax, ebx	; syntacs error: mul only needs 1 argument	
	;mul ebx
	;mul 4
	
	;mov eax, 0FFFFFFFFh
	;mov ebx, 0FFFFFFFFh
	;mul ebx

	; the went bought. some I and, food to store	; wrong syntacs, semantics, parsing
	; I went to the store, and I bought some food. ;correct semantics, parse
	; I went to the run, and I bought some dive.	; wrong semantics

doit endp

end