; First Name: Emmet
; Last Name: Stanevich
; ID: E01705769
; Assignment #3
; 3/13/19
; This program will scan the contents of x7000 to x7009, and order them from smallest to largest
;R0 <- SCROLLING POINTER THROUGHOUT THE ARRAY
;R1 <- HOLDS THE VALUE STORED AT THE ADDRESS DESIGNATED BY R0
;R2 <- HOLDS THE CURRENT SMALLEST VALUE
;R3 <- HOLDS THE 2'S COMPLEMENT OF THE VALUE STORED IN R1, AS WELL AS GRABBING THE FIRST VALUE IN THE SUB-ARRAY
;R4 <- POINTS TO THE END OF THE ARRAY
;R5 <- HOLDS THE CURRENT STARTING POSITION OF THE ARRAY
;R6 <- HOLDS THE POSITION OF THE SMALLEST VALUE IN THE ARRAY
;R7 <- DOES NOTHING, COULD BE RESERVED FOR THE JMP FUNCTION
;ARRSTART <- DESIGNATES THE START OF THE ARRAY
;ARREND <- DESIGNATES THE END OF THE SUB-ARRAY
.ORIG X3000
LD R0,ARRSTART	;SETS R0 TO X7000
ADD R5,R0,#0	;SETS R5 TO THE FIRST ADDRESS
LD R4,ARREND	;SETS R4 TO THE LAST ADDRESS
NEXT_ROUND LDR R2,R0,#0	;SETS R2 TO THE VALUE POINTED AT BY R0
ADD R6,R0,#0	;INITIALIZES R6 AS THE VALUE POINTED AT BY R0
NOT R3,R4
ADD R3,R3,#1
ADD R3,R0,R3
BRZP FINISH	;IF R0==R4, THERE IS NOTHING LEFT TO SORT
LOOP	LDR R1,R0,#0	;LOADS THE VALUE OF THE ADDRESS DESIGNATED BASED ON R0 INTO R1

COMPARE	ADD R2,R2,#0	;LOOKS AT THE VALUE OF THE CURRENT SMALLEST VALUE
BRN COMPAREN	;BRANCHES IF R2 CONTAINS A NEGATIVE NUMBER
BRNZP COMPAREP	;BRANCHES IF R2 CONTAINS A NONNEGATIVE NUMBER
BREAKCOMP	ADD R0,R0,#1	;INCREMENTS R0
NOT R3,R4	;SETS R3 TO THE INVERSE OF R4
ADD R3,R3,#1	;SETS R3 TO THE 2'S COMPLEMENT OF R4
ADD R3,R0,R3	;SETS R3 TO THE DIFFERENCE BETWEEN R0 AND R4
BRNZ LOOP	;REPEATS IF R0 HASN'T REACHED R4 YET
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

SWITCH	LDR R3,R5,#0	;LOADS THE VALUE STORED AT THE LOCATION SPECIFIED BY R5 INTO R3
STR R2,R5,#0	;STORES THE VALUE STORED IN R2 INTO THE LOCATION POINTED AT BY R5
STR R3,R6,#0	;STORES THE VALUE STORED IN R3 INTO THE LOCATION POINTED AT BY R6
ADD R5,R5,#1	;INCREMENTS R5
ADD R0,R5,#0	;SETS R0'S VALUE TO THAT OF R5
BRNZP NEXT_ROUND	;STARTS A NEW CYCLE
BRNZP FINISH
FINISH	HALT
ARRSTART	.FILL X7000
ARREND	.FILL X7009
.END