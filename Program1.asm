;First Name: Emmet
;Last Name: Stanevich
;ID: E01705769
;Assignment #1
;This program will start at x3000 and add the values of R0 and R1 into R3, calculate the negative of R2 via 2's complement and put that into R4, then place the sum of R3 and R4 into R5 and use the signage to determine which branch to jump to.
.orig x3000
;b0001011000000001
x1601;R3 <- R0+R1
;b1001100010111111
x98BF;R4 <- NOT R2
;b0001100100100001
x1921;R4 <- R4+1
;b0001101100000011
x1B03;R5 <- R4+R3
;b0000001000000001
x0201;BRp x3006
;b0000111000000011
x0E03;BRnzp x3009
;b0001000000100010
x1022;R0 <- R0+#2
;b0001001001100011
x1263;R1 <- R1+#3
;b0000111000000010
x0E02;BRnzp x300B
;b0001000000111111
x103F;R0 <- R0+#-1
;b0001001001111110
x127D;R1 <- R1+#-2