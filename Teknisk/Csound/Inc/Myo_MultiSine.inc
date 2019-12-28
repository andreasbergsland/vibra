;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
; 			MYO => Myo MultiSine
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		Myo_MultiSine

kMyoNum		=		p4
iSensorNum		=		p4
iOct			=		6
iPitch1		=		p5
iRelTime		=		4
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts
printf_i		"Starting Myo_multisine with pitch %i\n", 1, iPitch1

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with Myo_multisine\n", 1, iSensorNum
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

; Intensity of accels => sound intensity
iHalfPw		=		0.02
kEMG[]		init		8
if			kMyoNum == 1	then
kIntensity		=		gkMyo1_Acc_int
kAmp			=		gkMyo1_EMG_sum
kGyroX		=		gkMyo1_Gyro[0]
kEMG			=		gkMyo1_EMG_bf
kEMG_1		=		gkMyo1_EMG_bf[0]
kEMG_2		=		gkMyo1_EMG_bf[1]
kEMG_3		=		gkMyo1_EMG_bf[2]
kEMG_4		=		gkMyo1_EMG_bf[3]
kEMG_5		=		gkMyo1_EMG_bf[4]
kEMG_6		=		gkMyo1_EMG_bf[5]
kEMG_7		=		gkMyo1_EMG_bf[6]
kEMG_8		=		gkMyo1_EMG_bf[7]
kEMG_sum		=		gkMyo1_EMG_sum
elseif		kMyoNum == 2	then
kIntensity		=		gkMyo2_Acc_int
kAmp			=		gkMyo2_EMG_sum
kGyroX		=		gkMyo2_Gyro[0]
kEMG			=		gkMyo2_EMG_bf
kEMG_1		=		gkMyo2_EMG_bf[0]
kEMG_2		=		gkMyo2_EMG_bf[1]
kEMG_3		=		gkMyo2_EMG_bf[2]
kEMG_4		=		gkMyo2_EMG_bf[3]
kEMG_5		=		gkMyo2_EMG_bf[4]
kEMG_6		=		gkMyo2_EMG_bf[5]
kEMG_7		=		gkMyo2_EMG_bf[6]
kEMG_8		=		gkMyo2_EMG_bf[7]
kEMG_sum		=		gkMyo2_EMG_sum
elseif		kMyoNum == 3	then
kIntensity		=		gkMyo3_Acc_int
kAmp			=		gkMyo3_EMG_sum
kGyroX		=		gkMyo3_Gyro[0]
kEMG			=		gkMyo3_EMG_bf
kEMG_1		=		gkMyo3_EMG_bf[0]
kEMG_2		=		gkMyo3_EMG_bf[1]
kEMG_3		=		gkMyo3_EMG_bf[2]
kEMG_4		=		gkMyo3_EMG_bf[3]
kEMG_5		=		gkMyo3_EMG_bf[4]
kEMG_6		=		gkMyo3_EMG_bf[5]
kEMG_7		=		gkMyo3_EMG_bf[6]
kEMG_8		=		gkMyo3_EMG_bf[7]
kEMG_sum		=		gkMyo3_EMG_sum
elseif		kMyoNum == 4	then
kIntensity		=		gkMyo4_Acc_int
kAmp			=		gkMyo4_EMG_sum
kGyroX		=		gkMyo4_Gyro[0]
kEMG			=		gkMyo4_EMG_bf
kEMG_1		=		gkMyo4_EMG_bf[0]
kEMG_2		=		gkMyo4_EMG_bf[1]
kEMG_3		=		gkMyo4_EMG_bf[2]
kEMG_4		=		gkMyo4_EMG_bf[3]
kEMG_5		=		gkMyo4_EMG_bf[4]
kEMG_6		=		gkMyo4_EMG_bf[5]
kEMG_7		=		gkMyo4_EMG_bf[6]
kEMG_8		=		gkMyo4_EMG_bf[7]
kEMG_sum		=		gkMyo4_EMG_sum
endif

;printk2		kEMG_1

idelt		=		0.02
irmsthresh	=		0.06
iNoiseThrsh	=		0.001
iDebounceTime=		0.25

kEMG1_onset, krms1, kend1	Onsets_k	kEMG_1, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG2_onset, krms2, kend2	Onsets_k	kEMG_2, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG3_onset, krms3, kend3	Onsets_k	kEMG_3, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG4_onset, krms4, kend4	Onsets_k	kEMG_4, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG5_onset, krms5, kend5	Onsets_k	kEMG_5, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG6_onset, krms6, kend6	Onsets_k	kEMG_6, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG7_onset, krms7, kend7	Onsets_k	kEMG_7, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG8_onset, krms8, kend8	Onsets_k	kEMG_8, idelt, irmsthresh, iNoiseThrsh, iDebounceTime

kPeak1		init		0
kPeak2		init		0
kPeak3		init		0
kPeak4		init		0
kPeak5		init		0
kPeak6		init		0
kPeak7		init		0
kPeak8		init		0

kPeak1		=		(kEMG1_onset == 1)? krms1*10: kPeak1
kPeak2		=		(kEMG2_onset == 1)? krms2*10: kPeak2
kPeak3		=		(kEMG3_onset == 1)? krms3*10: kPeak3
kPeak4		=		(kEMG4_onset == 1)? krms4*10: kPeak4
kPeak5		=		(kEMG5_onset == 1)? krms5*10: kPeak5
kPeak6		=		(kEMG6_onset == 1)? krms6*10: kPeak6
kPeak7		=		(kEMG7_onset == 1)? krms7*10: kPeak7
kPeak8		=		(kEMG8_onset == 1)? krms8*10: kPeak8

;printk2	kPeak1

aFol1			follow2	a(kEMG1_onset), 	   0.01, iRelTime
aFol2			follow2	a(kEMG2_onset)*0.80, 0.01, iRelTime
aFol3			follow2	a(kEMG3_onset)*0.70, 0.01, iRelTime
aFol4			follow2	a(kEMG4_onset)*0.50, 0.01, iRelTime
aFol5			follow2	a(kEMG5_onset)*0.40, 0.01, iRelTime
aFol6			follow2	a(kEMG6_onset)*0.27, 0.01, iRelTime
aFol7			follow2	a(kEMG7_onset)*0.23, 0.01, iRelTime
aFol8			follow2	a(kEMG8_onset)*0.20, 0.01, iRelTime

kEMG_onset, krms, kend	Onsets_k	kEMG_sum, idelt, irmsthresh, iNoiseThrsh, 10
kRandom		trandom	kEMG_onset, 0, 5
kRandom		init		2

;
;iGateFun		ftgentmp	0, 0, 1024, -7, 0.0, 40, 0.001, 984, 0.5
;kAmpGated		table		kAmp, iGateFun, 1
;aAmp			=		a(kAmpGated)
;aFiltAmp		tone		aAmp, iAmpFiltHP

;kGyro			port		(kGyroX/360), 0.1
;kGyro			=		limit(kGyro*2, -1, 1)
;
;iPitchTab		ftgentmp	0, 0, 1024, -7, iPitch1, 800, iPitch1, 24, iPitch2, 200, iPitch2
;kPitchInd		=		kEMG_sum * 3
;kPitchClass		table		kPitchInd, iPitchTab, 1
;kPitchClass		port		kPitchClass, 0.04
;kPitch		=		(kPitchClass/100) + iOct

aOUT[]		init		8
iCpsBas		=		cpspch(iOct + iPitch1*0.01)
aOUT[0]		oscil3	aFol1 * kPeak1, iCpsBas
aOUT[1]		oscil3	aFol2 * kPeak2, iCpsBas + round(kRandom*2) * iCpsBas
aOUT[2]		oscil3	aFol3 * kPeak3, iCpsBas + round(kRandom*3) * iCpsBas
aOUT[3]		oscil3	aFol4 * kPeak4, iCpsBas + round(kRandom*4) * iCpsBas
aOUT[4]		oscil3	aFol5 * kPeak5, iCpsBas + round(kRandom*5) * iCpsBas
aOUT[5]		oscil3	aFol6 * kPeak6, iCpsBas + round(kRandom*6) * iCpsBas
aOUT[6]		oscil3	aFol7 * kPeak7, iCpsBas + round(kRandom*7) * iCpsBas
aOUT[7]		oscil3	aFol8 * kPeak8, iCpsBas + round(kRandom*8) * iCpsBas

aMIX			=		(aOUT[0]+aOUT[1]+aOUT[2]+aOUT[3]+aOUT[4]+aOUT[5]+aOUT[6]+aOUT[7]) 
aMIX			=		aMIX * gkVolume[kMyoNum-1]

kFade			linsegr	0, 1, 1, p3-1, 1, iFadeOut, 0

; Mix to audio array
gaSend[kMyoNum-1]	=		gaSend[kMyoNum-1] + aMIX * kFade ;aFiltAmp

			endin
