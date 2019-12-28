
opcode	Onsets, kkk, aiiii
ain, idelt, irmsthresh, iNoiseThrsh, iDebounceTime	xin

; Crude onset detection
; Crude onset detection
;idelt		=		0.008
;irmsthresh	=		0.04
;iNoiseThrsh	=		0.25
kDebOnsets	init		1
ktime		timeinsts

krms		rms		ain	
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

kOnset	=		konset * kDebOnsets

if		kOnset == 1		then
know		=		ktime		; reset timer
endif

ktimeout	=		ktime - know

kDebOnsets	=		(ktimeout > iDebounceTime)? 1: 0

ksound	=		krms > iNoiseThrsh? 1: 0
kend		trigger	ksound, 0.5, 1


xout		kOnset, krms, kend
endop
