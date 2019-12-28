;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
; 			MYO 1  => MYO MINCER/TRACER
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		Myo_WarbleSine

kMyoNum		=		p4
iSensor		=		p4
iOct			=		6
iPitch1		=		p5
iRelTime		=		4

printf_i		"Starting Warble sine with sensor %i - wrlblrbllrrllrbllwrll\n", 1, iSensor
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with WarbleSine\n", 1, iSensor
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


; Smooth EMG data (if not using the filters in Myo Mapper 3)
kEMG_smooth[]	init		8
kEMG_smooth		Portk_array	kEMG, 0.04
iMapFun		ftgentmp	0, 0, 1024, -7, 0, 80, 0, 944, 1
kEMG_map[]		init		8
kEMG_map		MapTab_array kEMG_smooth, iMapFun
kEMG_warble[]	init		8
kDepth		=		0.2
kSpeed		=		12
kEMG_warble		EMGwarbler_array	kEMG_map, kDepth, kSpeed

;printk2		kEMG_1

idelt		=		0.02
irmsthresh	=		0.06
iNoiseThrsh	=		0.001
iDebounceTime=		0.25

kEMG_onset, krms, kend	Onsets_k	kEMG_sum, idelt, irmsthresh, iNoiseThrsh, 10
iRand		random	2, 3.5
kRandom	=		iRand

iThresh	=		25
kAcc		init		0
if	kAcc < iThresh	then
kAcc		+=		abs(kIntensity)
kTrig		=		0
else
kTrig		=		1
kAcc		=		0
endif

iCpsBas		=		cpspch(iOct + iPitch1 * 0.01)
kRandBas		trandom	kTrig, iCpsBas, iCpsBas * 3
kCpsBas		=		iCpsBas

aOUT[]		init		8


aOUT[0]		oscil3	kEMG_warble[0], kCpsBas
aOUT[1]		oscil3	kEMG_warble[1], kCpsBas + round(kRandom*2) * iCpsBas
aOUT[2]		oscil3	kEMG_warble[2], kCpsBas + round(kRandom*3) * iCpsBas
aOUT[3]		oscil3	kEMG_warble[3], kCpsBas + round(kRandom*4) * iCpsBas
aOUT[4]		oscil3	kEMG_warble[4], kCpsBas + round(kRandom*5) * iCpsBas
aOUT[5]		oscil3	kEMG_warble[5], kCpsBas + round(kRandom*6) * iCpsBas
aOUT[6]		oscil3	kEMG_warble[6], kCpsBas + round(kRandom*7) * iCpsBas
aOUT[7]		oscil3	kEMG_warble[7], kCpsBas + round(kRandom*8) * iCpsBas

kFade			linsegr	1, iFadeOut, 0

aMIX			=		(aOUT[0]+aOUT[1]+aOUT[2]+aOUT[3]+aOUT[4]+aOUT[5]+aOUT[6]+aOUT[7]) * kFade

; Mix to audio array
gaSend[kMyoNum-1]	=		gaSend[kMyoNum-1] + (aMIX * gkVolume[kMyoNum-1])



			endin
