;First Name: Emmet
;Last Name: Stanevich
;ID: E01705769
;Assignment #1
;This program will start at x3000 and add the values of R0 and R1 into R3, calculate the negative of R2 via 2's complement and put that into R4, then place the sum of R3 and R4 into R5 and use the signage to determine which branch to jump to.
.orig x3000
;b0001011000000001
;x1601
add r3,r0,r1;R3 <- R0+R1
;b1001100010111111
;x98BF
not r4,r2;R4 <- NOT R2
;b0001100100100001
;x1921
add r4,r4,#1;R4 <- R4+1
;b0001101100000011
;x1B03
add r5,r4,r3;R5 <- R4+R3
;b0000001000000001
;x0201
BRp ifpos;BRp x3006
;b0000111000000011
;x0E03
brnzp ifneg;BRnzp x3009
;b0001000000100010
;x1022
ifpos	add r0,r0,#2;R0 <- R0+#2
;b0001001001100011
;x1263
add r1,r1,#3;R1 <- R1+#3
;b0000111000000010
;x0E02
brnzp finish;BRnzp x300B
;b0001000000111111
;x103F
ifneg	add r0,r0,#-1;R0 <- R0+#-1
;b0001001001111110
;x127D
add r1,r1,#-2;R1 <- R1+#-2
finish halt
.end