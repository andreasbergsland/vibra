<CsoundSynthesizer>
<CsOptions>
-odac1 -iadc2 -b8 -B16
</CsOptions>
<CsInstruments>
sr		=		48000
ksmps		=		1
nchnls	=		2
iport		=		8035
giOSChandle	OSCinit	iport

instr		1
ain, adum	ins
k1, k2, k3, k4, k5, k6, k7, k8, k9, k10		init		0
aVal 		init		0
kans		OSClisten	giOSChandle, "/sensors", "ffffffffff", k1, k2, k3, k4, k5, k6, k7, k8, k9, k10
; Use accel z
if		k3 > abs(0.8)	then
aVal		=		a(k3) * 100
;kInSnd	downsamp	ain
;printk	1/kr,	k3
;printk	1/kr,	kInSnd, 50
endif
fout		"LatencyTestNGIMU.wav", 2, ain, aVal
endin
</CsInstruments>
<CsScore>
i1	0	12
</CsScore>
</CsoundSynthesizer>