; UDO to fill a 2D array

opcode	Fill2DArray, k[], k[]i
kArr[],ival	xin
idim1	lenarray	kArr, 1
idim2	lenarray	kArr, 2
krun	init		0
if	krun	== 0	then
 kndx1	 =	0 	
loop1:
  kndx2	=	0
loop2:
  kArr[kndx1][kndx2]	=	ival
  loop_lt	kndx2, 1, idim2, loop2
 loop_lt	kndx1, 1, idim1, loop1
endif
krun = 1
xout	kArr
endop