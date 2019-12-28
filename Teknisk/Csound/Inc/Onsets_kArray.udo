/*  Onset detector with debounce for arrays

*/
	opcode 	Onsets_kArray, k[]k[], k[]iiiio
kArr[], idelt, irmsthresh, iNoiseThrsh, iDebounceTime, icnt	xin
iLen		lenarray	kArr
kRMS[]	init		iLen
kDel[]	init		iLen
kRMS_d[]	init		iLen
kRMS_d_Del[] init		iLen
kAtt[]	init		iLen

if icnt >= lenarray(kArr)-1 goto body
kArr, kRMS 		Onsets_kArray 	kArr, idelt, irmsthresh, iNoiseThrsh, iDebounceTime, icnt+1
body:
ktime			timeinsts
kRMS[icnt]		rms		a(kArr[icnt])	
kDel[icnt]		delayk	kRMS[icnt], idelt
kRMS_d[icnt]	=		kRMS[icnt] - kDel[icnt]
kRMS_d_Del[icnt]	delayk	kRMS_d[icnt], idelt
kAtt[icnt]		trigger	kRMS_d[icnt], irmsthresh, 0
kArr[icnt]		sc_trig	kAtt[icnt], iDebounceTime
kArr[icnt]		trigger	kArr[icnt], 0.00001, 0
	xout		kArr, kRMS
	endop