;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
; 			MYO 1  => MYO MINCER/TRACER
;/////////////////////////////////////////////////////////////////////////////////////////////////
instr		Flexi_BippAChu


iRnd		random	0, 11.999
iSnd		=		int(iRnd)

iSensor		=		p4
printf_i		"Starting Flexi_BippAChu with sensor %i and sound %i - Do the Bipp-a-chu!\n", 1, iSensor, iSnd
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with Flexi_BippAChu\n", 1, iSensor
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif



; Preset values for the 7 variations: kThresh (determines rate of triggering), kDecay (duration), kRevMix, kNoiseMix, kDistMix, 
;				1		2		3		4		5		6		7
kGain[]	fillarray	3, 		3, 		6,		3,		0.8, 		0.5, 		0.5
kThresh[]	fillarray	1.5, 		10, 		1.5, 		4, 		6, 		1.5, 		1.5	; Negative envelope for slow changing intensity
kAttack[]	fillarray	0.001,	0.001,	0.001,	0.001,	0.1,		0.1,		0.1
kDecay[]	fillarray	0.15,		0.2,		0.15,		0.18,		0.15,		0.15,		0.15
kRevMix[]	fillarray	0.5,		0.02,		0.02,		0.5,		0.5,		0.1,		0.1
kNoiseMix[]	fillarray	0,		0.5,		0.6,		0,		0.2,		0,		0
kDistMix[]	fillarray	0,		0.6,		0.6,		0,		0.2,		0,		0
kDCAmp[]	fillarray	0, 		0.01,		0,		0,		0,		0,		0
kPitch1[]	fillarray	1.001, 	0.25,		1.5,		1.02,		1,		1,		1
kPitch2[]	fillarray	semitone(2),0.32,		1.81,		semitone(5),0.5,		1,		1
kPitch3[]	fillarray	semitone(17),0.38,	2.04,		semitone(12),0.25,	1,		1
kPitch4[]	fillarray	1.504, 	0.52,		1.35,		semitone(24),0.75,	1,		1
kPitch5[]	fillarray	2.001, 	0.68,		1.93,		semitone(36),1,		1,		1
kPitch6[]	fillarray	semitone(-5), 1.1,	2.88,		semitone(48),1.5,		1,		1

ivarIndx	=		p5-1		; Index to look up the presets in the tables above

kFade		linsegr	0 ,2, 1, p3-1, 1, iFadeOut*0.5, 0.1, iFadeOut*0.5, 0	; Global fadeout

kEMG[]	init		8
gkQuat[]	init		4
kOri[]	init		3
kDelta[]	init		3
kDelt[]	init		3

if		iSensor == 1	then
kEMG		=		gkMyo1_EMG_bf
kOri		=		gkMyo1_euler
elseif	iSensor == 2	then
kEMG		=		gkMyo2_EMG_bf
kOri		=		gkMyo2_euler
elseif	iSensor == 3	then
kEMG		=		gkMyo3_EMG_bf
kOri		=		gkMyo3_euler
elseif	iSensor == 4	then
kEMG		=		gkMyo4_EMG_bf
kOri		=		gkMyo4_euler
elseif	iSensor == 5	then
kOri		=		gkNGIMU1_Eul*0.01
elseif	iSensor == 6	then
kOri		=		gkNGIMU2_Eul*0.01
elseif	iSensor == 7	then
kOri		=		gkNGIMU3_Eul*0.01
elseif	iSensor == 8	then
kOri		=		gkNGIMU4_Eul*0.01
endif

;printk	0.1,	kOri[0]

kDelta	Delta_array		kOri, 0.03, 0.03
kOriX		port			kDelta[0], 0.05
kOriY		port			kDelta[1], 0.05
kOriZ		port			kDelta[2], 0.05

if		iSensor <= 4	then
kOriDelta	=			kOriX		; Myo
elseif	iSensor >= 5	then
kOriDelta	=			kOriY		; NGIMU
endif

; Make trigger based on accumulated velocity: more movement => more rapid triggering
kAcc		init		0
if	kAcc < kThresh[ivarIndx]	then
kAcc		+=		abs(kOriDelta)
kTrig		=		0
else
kTrig		=		1
kAcc		=		0
endif

aTrig[]	init		7
aTrig[0]	=		a(kTrig)
kTimeGap	=		0.19 + kDelta[2] * 0.1		; not currently in use
aTrig[1]	=		a(gkMultiMetro[4])
aTrig[2]	=		a(gkMultiMetro[6])
aTrig[3]	=		a(kTrig)
aTrig[4]	=		a(kTrig)
aTrig[5]	=		a(kTrig)
aTrig[6]	=		a(kTrig)

aEnv		follow2	aTrig[ivarIndx], kAttack[ivarIndx], kDecay[ivarIndx]
if		kThresh[ivarIndx] < 0	then
kEnv		=			port((kOriX+kOriY+kOriZ), 1.2)
aEnv		upsamp		kEnv
endif


iTab		=		giTabNums[iSnd]
iLen		=		ftlen(iTab)/sr
print	iLen

ktimp		init		0
ktimp		+=		abs(kDelta[1])*0.002
atimp		=		a(ktimp)

kamp		port		(kDelta[1]*30) + kDCAmp[ivarIndx], 0.05
kpitch	=		abs(gkQuat[1])

aMIX[]	init		8

kloop		=		int(line(0, 1, 5000))
;printk	0.1,	kloop

aNoise		diskin2	"Radio/FM-Noise.aif", 1, 0, 17
aNoise	=	aNoise*(kNoiseMix[ivarIndx]) + a(1-kNoiseMix[ivarIndx])

aMIX[0]		mincer	atimp, kamp, kPitch1[ivarIndx], iTab, 1
aMIX[1]		mincer	atimp+0.05, kamp, kPitch2[ivarIndx], iTab, 1
aMIX[2]		mincer	atimp+0.1, kamp, kPitch3[ivarIndx], iTab, 1
aMIX[3]		mincer	atimp+0.15, kamp, kPitch4[ivarIndx], iTab, 1
aMIX[4]		mincer	atimp+0.2, kamp, kPitch5[ivarIndx], iTab, 1
aMIX[5]		mincer	atimp+0.07, kamp, kPitch6[ivarIndx], iTab, 1

iplen	=	2048	;  length of impulse response partitions (latency <-> CPU usage)
kupdate init	1
kclear	=	0
kFadeIn	linseg	0.0, 3.0, 1
aOUT		=		aEnv*(aMIX[0]+aMIX[1]+aMIX[2]+aMIX[3]+aMIX[4]+aMIX[5]+aMIX[6]+aMIX[7])*kFadeIn
aNoiseMod	=		aOUT * aNoise
aLimit	limit		aNoiseMod, -0.05, 0.05
aLimit	=		aLimit * 4

aMix			ntrpol	aOUT, aLimit, kDistMix[ivarIndx]

aconv 		liveconv 	aOUT, giIR_record, iplen, kupdate, kclear

;compress
aScalRev		=		aconv * 0.05
arevL, arevR	reverbsc	aScalRev, aScalRev, 0.9, 8000, sr, 2

kupdate	=	0
; Mix to audio array
gaSend[iSensor-1]	= gaSend[iSensor-1] + (aMix*(1-kRevMix[ivarIndx])+arevL*kRevMix[ivarIndx]) * kGain[iSensor-1]*gkVolume[iSensor-1] * kFade

kndx	init	0
kndx	+=	ksmps
if	kndx>=giIR_maxlen	then
kndx	=	0
kupdate = 	1
endif	

	tablew	aOUT*0.05, a(kndx), giIR_record

endin

