; First Name: Emmet
; Last Name: Stanevich
; ID: E01705769
; Assignment #2
; This program will scan the contents of x7000 to x7009, and swap the smallest number wih the number in x7000
START	.ORIG X3000
LD R0,X4000	;SETS R0 TO X4000
ADD R4,R4,#10;SETS THE COUNTER TO 10
;ADD R5,R5,#1	;SETS THE POINTER TO X4000
LDR R2,R0,0
ADD R6,R0,0
LOOP	LDR R1,R0,0	;LOADS THE VALUE OF THE ADDRESS DESIGNATED BASED ON R0 INTO R1

COMPARE	ADD R2,R2,0	;LOOKS AT THE VALUE OF THE CURRENT SMALLEST VALUE
BRN COMPAREN	;BRANCHES IF R2 CONTAINS A NEGATIVE NUMBER
BRNZP COMPAREP	;BRANCHES IF R2 CONTAINS A NONNEGATIVE NUMBER
BREAKCOMP	ADD R0,R0,#1	;INCREMENTS R0
ADD R4,R4,#-1	;DECREMENTS COUNTER
BRP LOOP	;REPEATS IF COUNTER HASN'T REACHED 0 YET
BRNZP FINISH

COMPAREP	ADD R1,R1,0	;LOOKS AR THE CURRENT VALUE
BRN COMPAREPN	;BRANCHES IF R1 IS NEGATIVE
BRNZP COMPAREPP	;BRANCHES IF R1 IS POSITIVE

COMPAREPN	BRNZP SETNEW

COMPAREPP	NOT R3,R1
ADD R3,R3,#1	;STORES THE 2'S COMPLEMENT OF R1
ADD R3,R3,R2	;CALCULATES THE DIFFERENCE BETWEEN R2 AND R1
BRP SETNEW	;IF R1 IS SMALLER THAN R2, UPDATE R2 AND R6
BRNZP BREAKCOMP

COMPAREN	ADD R1,R1,0	;LOOKS AT THE CURRENT VALUE
BRN COMPARENN	;BRANCHES IF BOTH R1 AND R2 CONTAIN NEGATIVE VALUES
BRNZP COMPARENP	;BRANCHES IF R1 IS POSITIVE

COMPARENN NOT R3,R1
ADD R3,R3,#1	;STORES THE 2'S COMPLEMENT OF R1 IN R3
ADD R3,R3,R2	;CALCULATES THE DIFFERENCE BETWEEN R2 AND R1
BRP SETNEW	;IF R1 HAS A GREATER MAGNITUDE THAN R2, UPDATE R2 AND R6
BRNZP BREAKCOMP

COMPARENP BRNZP BREAKCOMP	;IF R2 CONTAINS A NEGATIVE, WHILE R1 DOESN'T, R2 REMAINS THE SAME

SETNEW	ADD R2,R1,0	;UPDATES R2'S VALUE TO THAT OF R1
ADD R6,R0,0
BRNZP BREAKCOMP


;COUNTER	and r4,r4,0	;clear r4, to be used as a counter
;ARRAYREF	and r0,r0,0	;clear r0, which will be made to point to the array
;CURRENT	and r1,r1,0	;clear r1, to hold the current value
;SMALLEST	and r2,r2,0	;clear r2, to hold the smallest current value
;COMPARATOR	and r3,r3,0	;clear r3, to be used to find if the current address holds a smaller value than what is stored in r2
;POINTER	and r5,r5,0	;clear r5, to be used as a pointer
;SMALLESTADD	and r6,r6,0	;clear r6, which stores the address of the smallest current value
;ADD R0,R0,x7000
; ADD r4,r4,#10	;sets the counter to 10
; LOOP	LDR 
; brp LOOP
FINISH	HALT
.END
.ORIG x7000
x123F
x6534
x300F
x4005
x3F19
x2D2F
x1200
x0042
x12AA
x54EF
.END