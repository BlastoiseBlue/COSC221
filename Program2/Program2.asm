; First Name: Emmet
; Last Name: Stanevich
; ID: E01705769
; Assignment #2
; 2/25/19
; This program will scan the contents of x7000 to x7009, and swap the smallest number wih the number in x7000
;R0 <- THE LOCATION OF THE ARRAY
;R1 <- HOLDS THE VALUE STORED AT THE ADDRESS DESIGNATED BY R0
;R2 <- HOLDS THE CURRENT SMALLEST VALUE
;R3 <- HOLDS THE 2'S COMPLEMENT OF THE VALUE STORED IN R1
;R4 <- A COUNTER THAT TRACKS HOW MANY VALUES ARE LEFT IN THE ARRAY
;R5 <- A POINTER THAT SCROLLS THROUGH THE ARRAY
;R6 <- HOLDS THE POSITION OF THE SMALLEST VALUE IN THE ARRAY
;R7 <- HOLDS THE FIRST VALUE OF THE ARRAY
.ORIG X3000
LD R0,START	;SETS R0 TO X7000
ADD R5,R0,#0	;SETS R5 TO THE FIRST ADDRESS
LDR R7,R0,#0	;SETS R7 TO THE FIRST VALUE
ADD R4,R4,#10;SETS THE COUNTER TO 10
LDR R2,R0,#0	;SETS R2 TO THE VALUE POINTED AT BY R0
ADD R6,R0,#0
LOOP	LDR R1,R0,#0	;LOADS THE VALUE OF THE ADDRESS DESIGNATED BASED ON R0 INTO R1

COMPARE	ADD R2,R2,#0	;LOOKS AT THE VALUE OF THE CURRENT SMALLEST VALUE
BRN COMPAREN	;BRANCHES IF R2 CONTAINS A NEGATIVE NUMBER
BRNZP COMPAREP	;BRANCHES IF R2 CONTAINS A NONNEGATIVE NUMBER
BREAKCOMP	ADD R0,R0,#1	;INCREMENTS R0
ADD R4,R4,#-1	;DECREMENTS COUNTER
BRP LOOP	;REPEATS IF COUNTER HASN'T REACHED 0 YET
BRNZP SWITCH

COMPAREP	ADD R1,R1,#0	;LOOKS AR THE CURRENT VALUE
BRN COMPAREPN	;BRANCHES IF R1 IS NEGATIVE
BRNZP COMPAREPP	;BRANCHES IF R1 IS POSITIVE

COMPAREPN	BRNZP SETNEW

COMPAREPP	NOT R3,R1
ADD R3,R3,#1	;STORES THE 2'S COMPLEMENT OF R1
ADD R3,R3,R2	;CALCULATES THE DIFFERENCE BETWEEN R2 AND R1
BRP SETNEW	;IF R1 IS SMALLER THAN R2, UPDATE R2 AND R6
BRNZP BREAKCOMP

COMPAREN	ADD R1,R1,#0	;LOOKS AT THE CURRENT VALUE
BRN COMPARENN	;BRANCHES IF BOTH R1 AND R2 CONTAIN NEGATIVE VALUES
BRNZP COMPARENP	;BRANCHES IF R1 IS POSITIVE

COMPARENN NOT R3,R1
ADD R3,R3,#1	;STORES THE 2'S COMPLEMENT OF R1 IN R3
ADD R3,R3,R2	;CALCULATES THE DIFFERENCE BETWEEN R2 AND R1
BRP SETNEW	;IF R1 HAS A GREATER MAGNITUDE THAN R2, UPDATE R2 AND R6
BRNZP BREAKCOMP

COMPARENP BRNZP BREAKCOMP	;IF R2 CONTAINS A NEGATIVE, WHILE R1 DOESN'T, R2 REMAINS THE SAME

SETNEW	ADD R2,R1,#0	;UPDATES R2'S VALUE TO THAT OF R1
ADD R6,R0,#0
BRNZP BREAKCOMP

SWITCH	STR R2,R5,#0	;STORES THE VALUE STORED IN R2 INTO THE LOCATION POINTED AT BY R5
STR R7,R6,#0	;	STORES THE VALUE STORED IN R7 INTO THE LOCATION POINTED AT BY R6
BRNZP FINISH
FINISH	HALT
START	.FILL x7000
.END