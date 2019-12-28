;/////////////////////////////////////////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		Myo_SquineWave
prints	"Squiiining hard makes the day"
print	p1
kMyoNum		=		p4
iOct			=		6
iPitch1		=		p5
iPitch2		=		p5 + 7
iAmpFiltHP		=		300

iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
; Intensity of accels => sound intensity
iHalfPw		=		0.02
kEMG[]		init		8
if			kMyoNum == 1	then
kIntensity		=		gkMyo1_Acc_delta[0]
kAmp			=		gkMyo1_EMG_sum
kGyroX		=		gkMyo1_Gyro[0]
kEMG			=		gkMyo1_EMG_bf
kEMG_sum		=		gkMyo1_EMG_sum
elseif		kMyoNum == 2	then
kIntensity		=		gkMyo2_Acc_int
kAmp			=		gkMyo2_EMG_sum
kGyroX		=		gkMyo2_Gyro[0]
kEMG			=		gkMyo2_EMG_bf
kEMG_sum		=		gkMyo2_EMG_sum
elseif		kMyoNum == 3	then
kIntensity		=		gkMyo3_Acc_int
kAmp			=		gkMyo3_EMG_sum
kGyroX		=		gkMyo3_Gyro[0]
kEMG			=		gkMyo3_EMG_bf
kEMG_sum		=		gkMyo3_EMG_sum
elseif		kMyoNum == 4	then
kIntensity		=		gkMyo4_Acc_int
kAmp			=		gkMyo4_EMG_sum
kGyroX		=		gkMyo4_Gyro[0]
kEMG			=		gkMyo4_EMG_bf
kEMG_sum		=		gkMyo4_EMG_sum
endif

;kIntensity		=		abs(kGyroX)*0.0005

;printk2		kIntensity
iGateFun		ftgentmp	0, 0, 1024, -7, 0, 100, 0, 924, 0.5

kAmpGated		table		kIntensity, iGateFun, 1, 0, 1
aAmp			=		a(kAmpGated)
aFiltAmp		tone		aAmp, iAmpFiltHP

kGyro			port		(kGyroX/360), 0.1
kGyro			=		limit(kGyro*2, -1, 1)

iPitchTab		ftgentmp	0, 0, 1024, -7, iPitch1, 800, iPitch1, 24, iPitch2, 200, iPitch2
kPitchInd		=		kEMG_sum * 3
kPitchClass		table		kPitchInd, iPitchTab, 1
kPitchClass		port		kPitchClass, 0.04
kPitch		=		(kPitchClass/100) + iOct
aCps			=		a(cpspch(kPitch))
aInt			=		a(scale(kIntensity, 0.1, 1))
aClip			tone		aInt, 2
aSkew			=		a(kGyro)
;printk2		kIntensity

aOUT			squinewave 	aCps, aClip, aSkew , 0, 20
aOUT			=		aOUT * gkVolume[kMyoNum-1]

; Mix to audio array
gaSend[kMyoNum-1]	=		gaSend[kMyoNum-1] + aOUT * aFiltAmp

			endin
