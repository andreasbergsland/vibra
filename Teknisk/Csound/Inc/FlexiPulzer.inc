instr	FlexiPulzer
insno nstrnum "FlexiPulzer"
print	insno
iSensorNum		=		p4
printf_i		"Starting Flexi_pulzer with sensor %i - Pulzin' good... 1, 2, 3, ....\n", 1, iSensorNum
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with FlexiPulzer\n", 1, iSensorNum
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

iPitchTab1		ftgentmp	0, 0, 8, -2, 0, 0.03, 0.05, 0.07, 0.10, 0.14, 0.17, 0.19
iPitchTab2		ftgentmp	0, 0, 8, -2, 0, 0.02, 0.03, 0.05, 0.07, 0.08, 0.10, 0.12
iPitchTab3		ftgentmp	0, 0, 8, -2, 0, 0.02, 0.05, 0.07, 0.10, 0.12, 0.14, 0.17
iPitchTab4		ftgentmp	0, 0, 8, -2, 0, 0.03, 0.04, 0.07, 0.08, 0.11, 0.12, 0.18

;							 	oct	pch	plz1	plz2	AmpFlt pchTab
iPreset1		ftgentmp		0, 0, 8, -2, 8, 	5, 	6, 	7, 	0.5, iPitchTab1	
iPreset2		ftgentmp		0, 0, 8, -2, 6, 	3, 	5, 	7, 	0.45, iPitchTab1
iPreset3		ftgentmp		0, 0, 8, -2, 7, 	0, 	6, 	7, 	0.65, iPitchTab2
iPreset4		ftgentmp		0, 0, 8, -2, 9, 	5, 	5, 	6, 	0.6, iPitchTab2
iPreset5		ftgentmp		0, 0, 8, -2, 8, 	1, 	4, 	6, 	0.4, iPitchTab3
iPreset6		ftgentmp		0, 0, 8, -2, 8, 	0, 	4, 	7, 	0.3, iPitchTab3
iPreset7		ftgentmp		0, 0, 8, -2, 8, 	5, 	2, 	5, 	0.7, iPitchTab4
iPreset8		ftgentmp		0, 0, 8, -2, 8, 	8, 	4, 	7, 	0.4, iPitchTab4
iPreset9		ftgentmp		0, 0, 8, -2, 8, 	10, 	6, 	7, 	0.55, iPitchTab4

iVariantTab		=		p5 + iPreset1

iOct			table		0, iVariantTab
iPitch1		table		1, iVariantTab
iPitchTab		table		5, iVariantTab
iAmp			table		4, iVariantTab
iPulse1		table		2, iVariantTab
; Intensity of accels => sound intensity
iIntTab		ftgentmp	0, 0, 1024, -16, 0, 1024, -8, 3.5
if			iSensorNum == 1	then
kIntensity		table		gkMyo1_Acc_int, iIntTab, 1
kGyroX		=		wrap(gkMyo1_euler[0]*110, 0, 360)


elseif		iSensorNum == 2	then
kIntensity		table		gkMyo2_Acc_int, iIntTab, 1
kGyroX		=		wrap(gkMyo2_euler[0]*110, 0, 360)

elseif		iSensorNum == 3	then
kIntensity		table		gkMyo3_Acc_int, iIntTab, 1
kGyroX		=		wrap(gkMyo3_euler[0]*110, 0, 360)

elseif		iSensorNum == 4	then
kIntensity		table		gkMyo4_Acc_int, iIntTab, 1
kGyroX		=		wrap(gkMyo4_euler[0]*110, 0, 360)

elseif		iSensorNum == 5	then
kIntensity		=		gkNGIMU1_aInt
kGyroX		=		gkNGIMU1_Eul[0]		; X = rotation
;kPitch		=		gkNGIMU1_Eul[0] + 300

elseif		iSensorNum == 6	then			; Elen's sensor
kIntensity		=		gkNGIMU2_aInt;0.6;gkNGIMU2_Acc_int; Difficult for Elen to 
kGyroX		=		gkNGIMU2_Eul[0]		; X = rotation
;kPitch		=		gkNGIMU2_Eul[0] + 300

elseif		iSensorNum == 7	then
kIntensity		=		gkNGIMU3_aInt * 4
kGyroX		=		gkNGIMU3_Eul[0]		; X = rotation
;kPitch		=		gkNGIMU3_Eul[0] + 300

elseif		iSensorNum == 8	then
kIntensity		=		gkNGIMU4_aInt * 3
kGyroX		=		gkNGIMU4_Eul[0]		; X = rotation
;kPitch		=		gkNGIMU4_Eul[0] + 300
endif

kIntScaled		=		int(kIntensity*2)
kPCInd		limit		kIntScaled, 0, 7.99

kPitchClass1	table		kPCInd, iPitchTab
kPitch1		=		(iOct + kPitchClass1)
kCps1			=		cpspch(kPitch1)

kDur1			=		wrap((kIntensity),0.01, 0.08)

;kIntInd		init		0
;kIntInd		=		(kIntensity > 0)? kIntensity: kIntInd
;iGateFun		ftgentmp	0, 0, 1024, -7, 0.0, 250, 0.200, 774, 1
;kAmpGated		table		kIntensity, iGateFun, 1

;kAmp			port		kIntensity, 0.05
aAmp			=		a(kIntensity*0.25)
aFiltAmp		tone		aAmp, 30
kAmp			downsamp	aFiltAmp

kFade			cossegr	0 ,1, 1, p3-1, 1, iFadeOut, 0
gkAmp[]		init		8			; 8 values in the array, one for each sensor
gkAmp[iSensorNum-1] = 		kFade * kAmp

kGyro			port		(kGyroX/360), 0.1
kGyro			=		limit(kGyro, -0.001, 0.001)
gkNudge		=		kGyro

kdur			=		0.2
kcnt			init		0
kcnt			+=		gkMetro

kcount[]		init		8
kcount[0]		=		kcnt % 24
kcount[1]		=		kcnt % 16
kcount[2]		=		kcnt % 12
kcount[3]		=		kcnt % 8
kcount[4]		=		kcnt % 6
kcount[5]		=		kcnt % 4
kcount[6]		=		kcnt % 3
kcount[7]		=		kcnt % 2

kchng[]		init		8
kchng[0]		changed	kcount[0]
kchng[1]		changed	kcount[1]
kchng[2]		changed	kcount[2]
kchng[3]		changed	kcount[3]
kchng[4]		changed	kcount[4]
kchng[5]		changed	kcount[5]
kchng[6]		changed	kcount[6]
kchng[7]		changed	kcount[7]

ktrig[]		init		8
ktrig[0]		=		(kchng[0]==1 && kcount[0] == 0)? 1: 0
ktrig[1]		=		(kchng[1]==1 && kcount[1] == 0)? 1: 0
ktrig[2]		=		(kchng[2]==1 && kcount[2] == 0)? 1: 0
ktrig[3]		=		(kchng[3]==1 && kcount[3] == 0)? 1: 0
ktrig[4]		=		(kchng[4]==1 && kcount[4] == 0)? 1: 0
ktrig[5]		=		(kchng[5]==1 && kcount[5] == 0)? 1: 0
ktrig[6]		=		(kchng[6]==1 && kcount[6] == 0)? 1: 0
ktrig[7]		=		(kchng[7]==1 && kcount[7] == 0)? 1: 0


if			ktrig[iPulse1] == 1	then
			event		"i", "PulzerTone", 0, kDur1, iSensorNum-1, kCps1
endif


endin


