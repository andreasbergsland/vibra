	opcode	MapTab_array, k[], k[]i

kArr_in[], iTab	xin

iTabLen	=		ftlen(iTab)
iArrLen	lenarray	kArr_in
kArr[]	init		iArrLen

if	iArrLen == 1	goto	one
if	iArrLen == 2	goto	two
if	iArrLen == 3	goto	three
if	iArrLen == 4	goto	four
if	iArrLen == 5	goto	five
if	iArrLen == 6	goto	six
if	iArrLen == 7	goto	seven
if	iArrLen == 8	goto	eight
if	iArrLen == 9	goto	nine
if	iArrLen == 10	goto	ten

ten:
kArr[9]	table		kArr_in[9],  iTab, 1
nine:
kArr[8] 	table		kArr_in[8],  iTab, 1
eight:
kArr[7] 	table		kArr_in[7],  iTab, 1
seven:
kArr[6] 	 table	kArr_in[6],  iTab, 1
six:
kArr[5] 	 table	kArr_in[5],  iTab, 1
five:
kArr[4] 	 table	kArr_in[4],  iTab, 1
four:
kArr[3] 	 table	kArr_in[3],  iTab, 1
three:
kArr[2] 	 table	kArr_in[2],  iTab, 1
two:
kArr[1] 	 table	kArr_in[1],  iTab, 1
one:
kArr[0] 	 table	kArr_in[0],  iTab, 1


xout	kArr
endop
