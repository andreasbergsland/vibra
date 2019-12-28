	opcode	EMGwarbler_array, k[], k[]kk

kArr_in[], kDepth, kSpeed	xin

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
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[9]	=		kArr_in[9] * (1-kDepth) + kWarble * kDepth * kArr_in[9]		
nine:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[8]	=		kArr_in[8] * (1-kDepth) + kWarble * kDepth * kArr_in[8]
eight:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[7]	=		kArr_in[7] * (1-kDepth) + kWarble * kDepth * kArr_in[7]
seven:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[6]	=		kArr_in[6] * (1-kDepth) + kWarble * kDepth * kArr_in[6]
six:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[5]	=		kArr_in[5] * (1-kDepth) + kWarble * kDepth * kArr_in[5]
five:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[4]	=		kArr_in[4] * (1-kDepth) + kWarble * kDepth * kArr_in[4]
four:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[3]	=		kArr_in[3] * (1-kDepth) + kWarble * kDepth * kArr_in[3]
three:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[2]	=		kArr_in[2] * (1-kDepth) + kWarble * kDepth * kArr_in[2]
two:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[1]	=		kArr_in[1] * (1-kDepth) + kWarble * kDepth * kArr_in[1]
one:
kSpline	rspline	-1, 1, kSpeed, kSpeed
kWarble	=		(kSpline > 0)? kSpline: 0
kArr[0]	=		kArr_in[0] * (1-kDepth) + kWarble * kDepth * kArr_in[0]


xout	kArr
endop
