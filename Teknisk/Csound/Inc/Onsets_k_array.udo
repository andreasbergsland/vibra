	opcode 	Onsets_k_array, k[]k[], k[]iiiio

kInput[], idelt, irmsthresh, iNoiseThrsh, iDebounceTime, icnt	xin
iLen		lenarray	kInput
kOnset[]	init		iLen
kEnding[]	init		iLen	


if 	(icnt >= iLen) goto find_onsets
kOnset[icnt], kEnding[icnt]   Onsets_k_array kInput[icnt], idelt, irmsthresh, iNoiseThrsh, iDebounceTime, icnt+1

find_onsets:
kDebOnsets	init		1
ktime		timeinsts

krms		=		kInput[icnt]	
krms_del	delayk	krms, idelt
krms_d	=		krms - krms_del
krms_d_del	delayk	krms_d, idelt
kattack	trigger	krms_d, irmsthresh, 0
kdecay	=		(krms_d < 0 && krms_d_del < 0)? 1: 0


; New onset will have to wait for decay phase (two delay periods with rms decrease)
kswitch	init		0
if		kswitch	==	0	then
kswitch	=		kswitch + kattack
elseif	kswitch	>	0	then
kswitch	=		kswitch - kdecay
endif

; Onset	begins when switch changes from 0 to 1
konset	trigger	kswitch, 0.5, 0

kOnset[icnt]	=		konset * kDebOnsets

if		kOnset[icnt] == 1		then
know		=		ktime		; reset timer
endif

ktimeout	=		ktime - know

kDebOnsets	=		(ktimeout > iDebounceTime)? 1: 0

ksound	=		krms > iNoiseThrsh? 1: 0
kEnding[icnt]		trigger	ksound, 0.5, 1

	xout		kOnset, kEnding
	endop