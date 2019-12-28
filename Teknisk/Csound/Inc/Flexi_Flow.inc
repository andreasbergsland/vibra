instr		FlexiFlow
iSensor		=		p4
iVariant		=		p5
iIndex		=		iSensor - 1
printf_i		"Starting FlexiFlow with sensor %i  - Floooowing!\n", 1, iSensor
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

kFade			linsegr	0, 1, 1, p3-1, 1, iFadeOut, 0

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with FlexiFlow\n", 1, iSensor
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

kEMG[]	init		8
kDelta[]	init		3
kOri[]	init		3
kEul[]	init		3


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

kDelta		Delta_array		kOri, 0.03, 0.03
kDeltaAbs[]		init			3
kDeltaSum		=			abs(kDelta[0])+abs(kDelta[1])+abs(kDelta[2])

aNoise1		diskin2	"Radio/FM-Noise.aif", 1, 0, 17
aNoise2		diskin2	"Radio/FM-Noise.aif", 0.5, 0, 17
aNoise3		diskin2	"Radio/FM-Noise.aif", 0.25, 0, 17
aNoise4		diskin2	"Radio/FM-Noise.aif", 1.5, 0, 17

iSnd		=		int(random(0, 12))
iTab		=		giTabNums[iSnd]
iLen		=		ftlen(iTab)/sr
ktimp		init		0
kIncr		port		kDeltaSum, 1
ktimp		+=		kIncr*0.0005
;ktimp		line		0, 0.2, 1
atimp		=		a(ktimp)
kAmp		port		(kDeltaSum * 20), 1.7
aSnd		mincer	atimp, kAmp, 1.5, iTab, 1

;aSnd		temposcal	ktimp, kAmp, 1.7, iTab, 1
kCO		=		500+kIncr*1500
kBW		=		kCO * 0.15
aSndFilt	butbp		aSnd, kCO, kBW	
aSndFilt	butbp		aSndFilt, kCO, kBW

kTimp		=		3 + (rspline(0, 0.1, 3, 5))
aTimp		=		a(kTimp)

k1CO			=		downsamp(tone(a(kEMG[0]),0.3))
k2CO			=		downsamp(tone(a(kEMG[1]),0.4))
k3CO			=		downsamp(tone(a(kEMG[2]),0.5))
k4CO			=		downsamp(tone(a(kEMG[3]),0.6))
k5CO			=		downsamp(tone(a(kEMG[4]),0.5))
k6CO			=		downsamp(tone(a(kEMG[5]),0.6))
k7CO			=		downsamp(tone(a(kEMG[6]),0.5))
k8CO			=		downsamp(tone(a(kEMG[7]),0.8))

aMinc1	mincer	aTimp, 0.7*k1CO, semitone(-12), giTabNums[0], 1
aMinc2	mincer	aTimp, 0.6*k2CO, semitone(-24), giTabNums[0], 1
aMinc3	mincer	aTimp, 0.5*k3CO, semitone(-36), giTabNums[0], 1
aMinc4	mincer	aTimp, 0.3*k4CO, semitone(12), giTabNums[0], 1
aMinc5	mincer	aTimp, 0.4*k5CO, semitone(6), giTabNums[0], 1
aMinc6	mincer	aTimp, 0.2*k6CO, semitone(19), giTabNums[0], 1
aMinc7	mincer	aTimp, 0.2*k7CO, semitone(24), giTabNums[0], 1
aMinc8	mincer	aTimp, 0.2*k8CO, semitone(38), giTabNums[0], 1

aDroneMix	=		aMinc1+aMinc2+aMinc3+aMinc4+aMinc5+aMinc6+aMinc7+aMinc8

aDrL, aDrR	reverbsc	aDroneMix, aDroneMix, 0.9, 12000, sr, 2

kCO1			=		(60 + abs(k1CO)* 200)
aCO1_sm		tone		a(kCO1), 0.6
kCO1_sm		downsamp	aCO1_sm
aFilt1		lpf18		aNoise1, kCO1_sm, 0.3, 0.6

kCO2			=		(120 + abs(k2CO)* 280)
aCO2_sm		tone		a(kCO1), 1.1
kCO2_sm		downsamp	aCO1_sm
aFilt2		lpf18		aNoise2, kCO2_sm, 0.4, 0.6

kCO3			=		(640 + abs(k3CO)* 380)
aCO3_sm		tone		a(kCO3), 1.7
kCO3_sm		downsamp	aCO3_sm
kBW3			limit		(120 - 80 * abs(k3CO)), 20, 120
aFilt3		butbp		aNoise3, kCO3_sm, kBW3

kCO4			=		(940 + abs(k4CO)* 1280)
aCO4_sm		tone		a(kCO4), 1.5
kCO4_sm		downsamp	aCO4_sm
kBW4			limit		(100 - 100 * abs(k4CO)), 20, 200
aFilt4		butbp		aNoise4, kCO4_sm, kBW4

if	iSensor < 5	then
aSMix1		tone		a(kEMG[4]), 0.8
aSMix2		tone		a(kEMG[5]), 1.1
aSMix3		tone		a(kEMG[6]), 1.2
aSMix4		tone		a(kEMG[7]), 1.3
else
aSMix1		=		downsamp(tone(a(kDelta[0]),0.3))
aSMix2		=		downsamp(tone(a(kDelta[1]),0.3))
aSMix3		=		downsamp(tone(a(kDelta[2]),0.3))
aSMix4		=		downsamp(tone(a(kDelta[1]),0.3))
endif

aMix1			=		(aSMix1*aFilt1)*10
aMix2			=		(aSMix2*aFilt2)*10
aMix3			=		(aSMix3*aFilt3)*10
aMix4			=		(aSMix4*aFilt4)*10

aL,aR			reverbsc	aMix1+aMix2, aMix3+aMix4+aSndFilt, 0.8, 15000, sr, 3
if	iVariant == 1	then
gaSend[iIndex]	=		gaSend[iIndex] + (aL+aR)*kFade*gkVolume[iIndex]
elseif iVariant == 2	then
gaSend[iIndex]	=		gaSend[iIndex] + (aDroneMix + aDrL+aDrR)*kFade*gkVolume[iIndex]
else
gaSend[iIndex]	=		gaSend[iIndex] + (aDroneMix + aDrL+aDrR+aL+aR);*kFade*gkVolume[iIndex]
endif

outs	gaSend[iIndex], gaSend[iIndex]
gaSend[iIndex] = 0
endin