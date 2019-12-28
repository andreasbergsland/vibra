;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
; 			MYO 1  => MYO MINCER/TRACER
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		Myo_minctracer

kMyoNum		=		p4
iSensorNum		=		p4
kSnd			=		wrap(p5, 0, (giNumFiles-1))
iSnd			=		wrap(p5, 0, (giNumFiles-1))
iFadeOut		=		p6

xtratim		iFadeOut
kRelease		release
kTime			timeinsts

printf_i		"Starting Myo_minctracer with sound %i\n", 1, iSnd

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with Myo_minctracer\n", 1, iSensorNum
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

; Intensity of accels => sound intensity
iHalfPw		=		0.02
if			kMyoNum == 1	then
kIntensity		=		gkMyo1_Acc_int
kAmp			=		gkMyo1_EMG_sum
kGyroX		=		gkMyo1_Gyro[0]
elseif		kMyoNum == 2	then
kIntensity		=		gkMyo2_Acc_int
kAmp			=		gkMyo2_EMG_sum
kGyroX		=		gkMyo2_Gyro[0]
elseif		kMyoNum == 3	then
kIntensity		=		gkMyo3_Acc_int
kAmp			=		gkMyo3_EMG_sum
kGyroX		=		gkMyo3_Gyro[0]
elseif		kMyoNum == 4	then
kIntensity		=		gkMyo4_Acc_int
kAmp			=		gkMyo4_EMG_sum
kGyroX		=		gkMyo4_Gyro[0]
endif


;iGateFun		ftgentmp	0, 0, 1024, -7, 0, 24, 0, 1000, 1
;kAmpGated		table		kIntensity*100, iGateFun, 1
;kAmp			init		0
;kAmp			=		(kIntensity > 0.00000001)?	kIntensity: kAmp
;iGateFun		ftgentmp	0, 0, 1024, -7, 0.02, 10, 0.02, 1014, 0.25
;kAmpGated		table		kAmp, iGateFun, 1
;kAmpFilt		portk		kAmpGated, 0.05
;aAmp			=		a(kAmpGated)
;aFiltAmp		tone		aAmp, 0.2

iGateFun		ftgentmp	0, 0, 1024, -7, 0.0, 40, 0.0, 984, 1
kAmpGated		table		kAmp, iGateFun, 1
aAmp			=		a(kAmpGated)
aFiltAmp		tone		aAmp, 5

kSnd			=		p5
kTransp		=		1

kTimp			init		0
kTimp			+=		(kGyroX) * 0.00001		; Use gyro x = rotation
aTimp			=		a(kTimp)
kSndTab		=		giTabNums[kSnd]


a1			mincer	aTimp, 0.5, kTransp, kSndTab, 1, 1024
f1			pvsanal	a1 , 1024, 128, 1024, 1

kNumPart		init		0
kNumPart		=		(kIntensity > 0.0000001)?	kIntensity : kNumPart
kNumPartials 	=		wrap((int(350*kNumPart)),5, 50) 

ftrace	pvstrace	f1, kNumPartials
fsmooth	pvsblur	ftrace, 0.05, 0.1
atrace	pvsynth	fsmooth
;alim		limit		atrace, -0.005, 0.005
;abal		balance	alim, a1

;asmooth	pvsynth	ftrace

; Mix to audio array
kFade			cossegr	1, iFadeOut, 0
aOUT			=		atrace * aFiltAmp * 5  * gkVolume[kMyoNum-1] * kFade

gaSend[kMyoNum-1]	=		gaSend[kMyoNum-1] + aOUT

; Set spatialization parameters--------------------------------------------------
;if	kRelease == 0	then
;
;gkAzi[kMyoNum-1] = 	-45
;
;gkDist[kMyoNum-1]=	2
;
;endif
;---------------------------------------------------------------------------------			
			endin
