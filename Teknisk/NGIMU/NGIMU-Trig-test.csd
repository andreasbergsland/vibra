<CsoundSynthesizer>
<CsOptions>
-odac1 -iadc2 -b8 -B16
</CsOptions>
<CsInstruments>
sr		=		48000
ksmps		=		1
nchnls	=		2

giOSCh1	OSCinit	8035
;giOSCh2	OSCinit	8034
;giOSCh3	OSCinit	8036

instr		1
ain, adum	ins
k1, k2, k3, k4, k5, k6, k7, k8, k9, k10		init		0

aVal 		init		0
;Using linear accel
kans		OSClisten	giOSCh1, "/linear", "fff", k1, k2, k3;, k4, k5, k6, k7, k8, k9, k10
kans		OSClisten	giOSCh1, "/euler", "fff", kRoll, kPitch, kYaw
;kans		OSClisten	giOSCh2, "/sensors", "ffffffffff", k21, k22, k23, k24, k25, k26, k27, k28, k29, k20
;kans		OSClisten	giOSCh2, "/euler", "fff", k21, k22, k23
;kans		OSClisten	giOSCh3, "/sensors", "ffffffffff", k31, k32, k33, k34, k35, k36, k37, k38, k39, k30
;kans		OSClisten	giOSCh3, "/euler", "fff", k31, k32, k33
; Use accel z
;if		k3+k23+k33 > abs(0.8)	then
kmagnitude	=		sqrt(k4^2+k5^2+k6^2)

k_mms2	= 	kmagnitude * 9806.65
;printk2 	k_mms2
kmag_eul	=		sqrt(k1^2+k2^2+k3^2)

;foutk	"NoiseTestNGIMU.txt", 6, k_mms2
;if kans == 1 then
;dumpk3  k1,k2,k3, "/Users/andber/Desktop/NGIMU_linear_accel_impulse_2.txt", 8, 0
;endif
;kDiff2		=		diff(k23) * 100
;kDiff3		=		diff(k33) * 100
;kInSnd	downsamp	ain
;printk	1/kr,	k33
;printk	1/kr,	kInSnd, 50
;endif
;fout		"LatencyTestNGIMUx3.wav", 2, ain, a(kdiff * 1000)
endin
</CsInstruments>
<CsScore>
i1	0	57
</CsScore>
</CsoundSynthesizer>