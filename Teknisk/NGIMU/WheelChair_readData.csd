<CsoundSynthesizer>
<CsOptions>
-odac2  -b128 -B256
</CsOptions>
<CsInstruments>
sr		=		48000
ksmps		=		10
nchnls	=		2

giEul_V	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_euler_V.txt", 8, 0
giLin_V	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_linear_V.txt", 8, 0
giEul_H	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_euler_H.txt", 8, 0
giLin_H	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_euler_H.txt", 8, 0
giEul_B	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_linear_B.txt", 8, 0
giLin_B	ftgen 0, 0, 0, -23, "/Users/andber/Desktop/VIBRA/WheelChair/Elen_Snurr2_euler_B.txt", 8, 0

instr		1
kTime		timeinsts
ain, adum	ins
k1, k2, k3, k4, k5, k6, k7, k8, k9, k10		init		0
k11, k12, k13, k14, k15, k16, k17, k18, k19, k20		init		0
k21, k22, k23, k24, k25, k26, k27, k28, k29, k30		init		0
;k31, k32, k33, k34, k35, k36, k37, k38, k39, k30		init		0
aVal 		init		0
;kans		OSClisten	giOSCh1, "/sensors", "ffffffffff", k1, k2, k3, k4, k5, k6, k7, k8, k9, k10
;kans		OSClisten	giOSCh1, "/euler", "fff", k1, k2, k3
;kans		OSClisten	giOSCh1, "/linear", "fff", k4, k5, k6
;kans		OSClisten	giOSCh2, "/euler", "fff", k7, k8, k9
;kans		OSClisten	giOSCh2, "/linear", "fff", k10, k11, k12
;kans		OSClisten	giOSCh3, "/euler", "fff", k13, k14, k15
;kans		OSClisten	giOSCh3, "/linear", "fff", k16, k17, k18
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

kMetro	metro		50
kReadIndex	init		0
kEulV_x_last init		0
;foutk	"NoiseTestNGIMU.txt", 6, k_mms2
if kMetro == 1 then
kEulV_x	table		kReadIndex, giEul_V
kEulV_y	table		kReadIndex + 1, giEul_V
kEulV_z	table		kReadIndex + 2, giEul_V
kEulV_dx	=		kEulV_x - kEulV_x_last
if		kEulV_dx > 300	then
kEulV_dx	=		kEulV_dx - 360	
elseif	kEulV_dx < -300	then
kEulV_dx	=		kEulV_dx + 360
endif
kEulV_x_last = 		kEulV_x

kEulH_x	table		kReadIndex, giEul_H
kEulH_y	table		kReadIndex + 1, giEul_H
kEulH_z	table		kReadIndex + 2, giEul_H

kEulB		table		kReadIndex, giEul_B
kLinB		table		kReadIndex, giLin_B
kReadIndex	+=		3
endif

kMetro	 metro	kEulV_dx
printk2	kEulV_dx
outs		a(kMetro), a(kMetro)

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
i1	0	80
</CsScore>
</CsoundSynthesizer>