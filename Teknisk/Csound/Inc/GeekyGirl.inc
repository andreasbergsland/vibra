;/////////////////////////////////////////////////////////////////////////////////////////////////
;			GEEKY GIRL - based on MinceTracer
; 			
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		GeekyGirl

kMyoNum		=		p4
iSensorNum		=		p4
kSnd			=		wrap(p5, 0, (giNumFiles-1))
iSnd			=		wrap(p5, 0, (giNumFiles-1))
iFadeOut		=		p6

xtratim		iFadeOut
kRelease		release
kTime			timeinsts

printf_i		"Starting GeekyGirl with sound %i\n", 1, iSnd

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with GeekyGirl\n", 1, iSensorNum
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

; Intensity of accels => sound intensity
iHalfPw		=		0.02

kRotation		=		port(gkEuler[0],0.05)
kLastRot		init		0
kd_Rot		=		kRotation - kLastRot
kLastRot		=		kRotation

kd_Rot_smooth	=		port(kd_Rot, 0.3)

kIntensity		=		(gkEuler[0]) / 360
kAmp			=		0.1


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
kTimp			+=		kd_Rot * 0.01		; Use gyro x = rotation
aTimp			=		a(kTimp)
kSndTab		=		giTabNums[kSnd]

a1			mincer	aTimp, 0.5, kTransp, kSndTab, 1, 1024
f1			pvsanal	a1 , 1024, 128, 1024, 1

kNumPart		init		0
kNumPart		=		(kd_Rot_smooth > 0.0000001)?	kd_Rot_smooth : kNumPart
kNumPartials 	=		wrap((int(1000*kNumPart)),5, 50) 

printk2	kNumPartials

ftrace		pvstrace	f1, kNumPartials
fsmooth		pvsblur	ftrace, 0.05, 0.1
atrace		pvsynth	fsmooth
;alim		limit		atrace, -0.005, 0.005
;abal		balance	alim, a1

;asmooth	pvsynth	ftrace

; Mix to audio array
kFade			cossegr	1, iFadeOut, 0
aOUT			=		atrace* aFiltAmp * 30  * gkVolume[kMyoNum-1] * kFade

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
