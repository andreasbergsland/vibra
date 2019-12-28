/*  Schedkwhen instrument event trigger for arrays

*/
	opcode 	Schedkwhen_array, k[], k[]kkk[]kkk[]k[]k[]o
kArr[], kmintim, kmaxnum, kInsnum[], kwhen, kdur, kP4[], kP5[], kP6[], icnt	xin
iLen		lenarray	kArr

if icnt >= iLen-1 goto body
kArr   	Schedkwhen_array 	kArr, kmintim, kmaxnum, kInsnum, kwhen, kdur, kP4, kP5, kP6, icnt+1
body:
	schedkwhen	kArr[icnt], kmintim, kmaxnum, kInsnum[icnt], kwhen, kdur, kP4[icnt], kP5[icnt], kP6[icnt]
	xout		kArr
	endop