<CsoundSynthesizer>
<CsOptions>
-odac1 -iadc2 -b8 -B16
</CsOptions>
<CsInstruments>
sr		=		48000
ksmps		=		1
nchnls	=		2

giOSCh1	OSCinit	8037
giOSCh2	OSCinit	8034
giOSCh3	OSCinit	8036

instr		1
ain, adum	ins
k1, k2, k3, k4, k5, k6, k7, k8, k9, k10		init		0
k21, k22, k23, k24, k25, k26, k27, k28, k29, k20		init		0
k31, k32, k33, k34, k35, k36, k37, k38, k39, k30		init		0
aVal 		init		0
;kans		OSClisten	giOSCh1, "/sensors", "ffffffffff", k1, k2, k3, k4, k5, k6, k7, k8, k9, k10
kans		OSClisten	giOSCh1, "/euler", "ffffffffff", k1, k2, k3
;kans		OSClisten	giOSCh2, "/sensors", "ffffffffff", k21, k22, k23, k24, k25, k26, k27, k28, k29, k20
kans		OSClisten	giOSCh2, "/euler", "ffffffffff", k21, k22, k23
;kans		OSClisten	giOSCh3, "/sensors", "ffffffffff", k31, k32, k33, k34, k35, k36, k37, k38, k39, k30
kans		OSClisten	giOSCh3, "/euler", "ffffffffff", k31, k32, k33
; Use accel z
;if		k3+k23+k33 > abs(0.8)	then
aVal1		=		a(k3) * 100
aVal2		=		a(k23) * 100
aVal3		=		a(k33) * 100
;kInSnd	downsamp	ain
;printk	1/kr,	k33
;printk	1/kr,	kInSnd, 50
;endif
fout		"LatencyTestNGIMUx3.wav", 2, ain, aVal1+aVal2+aVal3
endin
</CsInstruments>
<CsScore>
i1	0	15
</CsScore>
</CsoundSynthesizer>