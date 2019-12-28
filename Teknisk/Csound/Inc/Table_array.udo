	opcode	Table_array, k[], k[]ipoo
kArr_in[], iTab, iMode, iOffset, iWrap	xin
iLen		lenarray	kArr_in
kArr[]	init		iLen
kndx	=	0
loop:
kin	=		kArr_in[kndx]
kout	table		kin, iTab, iMode, iOffset, iWrap
kArr[kndx]	=	kout
loop_lt	kndx, 1, iLen, loop
xout	kArr
endop
