;/////////////////////////////////////////////////////////////////////////////////////////////////

;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		NGIMU_Noizer
prints	"Bring me some Noizzzze\!\n"
iSensorNum		=		p4
; Intensity of accels => sound intensity
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release

if trigger(kRelease,0.5,0) == 1	then
printf	"Turning off sensor %i with Noizer\n", 1, iSensorNum
endif

if			iSensorNum == 5	then
kIntensity		=		(gkNGIMU1_mags[1]) 
kGyroX		=		gkNGIMU1_Eul[1]		; X = rotation
kEulerX		=		gkNGIMU1_Eul[0]
kEulerZ		=		gkNGIMU1_Eul[2]
kPitch		=		gkNGIMU1_Eul[0] + 300

elseif		iSensorNum == 6	then			; Elen's sensor
kIntensity		=		(gkNGIMU2_mags[1])   ;0.6;gkNGIMU2_Acc_int; Difficult for Elen to 
kGyroX		=		gkNGIMU2_Eul[1]		; X = rotation
kEulerX		=		gkNGIMU2_Eul[0]
kEulerZ		=		gkNGIMU2_Eul[2]
kPitch		=		gkNGIMU2_Eul[0] + 300

elseif		iSensorNum == 7	then
kIntensity		=		(gkNGIMU3_mags[1]) 
kGyroX		=		gkNGIMU3_Eul[1]		; X = rotation
kEulerX		=		gkNGIMU3_Eul[0]
kEulerZ		=		gkNGIMU3_Eul[2]
kPitch		=		gkNGIMU3_Eul[0] + 300

elseif		iSensorNum == 8	then
kIntensity		=		(gkNGIMU4_mags[1]) 
kGyroX		=		gkNGIMU4_Eul[1]		; X = rotation
kEulerX		=		gkNGIMU4_Eul[0]
kEulerZ		=		gkNGIMU4_Eul[2]
kPitch		=		gkNGIMU4_Eul[0] + 300
endif

;printk2		kIntensity

kIntInd		init		0
kIntInd		=		(kIntensity > 0)? kIntensity: kIntInd
iGateFun		ftgentmp	0, 0, 1024, -7, 0.0, 250, 0.000, 774, 1

kAmpGated		table		kIntensity * 0.21, iGateFun, 1
aAmp			=		a(kAmpGated)

gaFiltAmp[]		init		8			; 8 values in the array
aFiltAmp		tone		aAmp, 1

; Use this line for testing with myo
kd_1			init		0
kd_2			init		0
kd_3			init		0
kd_4			init		0

kval1			port		kGyroX, 0.1
kval2			port		kEulerX, 0.3
kval3			port		kEulerZ, 0.4
kval4			port		kGyroX, 0.6

kdel1			delayk	kval1, 0.02
kdel2			delayk	kval2, 0.02
kdel3			delayk	kval3, 0.02
kdel4			delayk	kval4, 0.02

kd_1			=		kval1 - kdel1
kd_2			=		kval2 - kdel2
kd_3			=		kval3 - kdel3
kd_4			=		kval4 - kdel4

;printk2	kd_1

aNoise1		rand		abs(kd_1)
aNoise2		rand		abs(kd_2)
aNoise3		rand		abs(kd_3)
aNoise4		rand		abs(kd_4)

kInd1			port		(kd_1*30+0.5), 0.5
kInd2			port		(kd_2*42+0.5)* 0.6, 0.3
kInd3			port		(1 - kd_3*35)* 0.3, 0.7
kInd4			port		(kd_4*40+0.4)* 0.6, 0.2

;printk2	kInd2
iCOFun1		ftgentmp	0, 0, 1024, -7, 200, 512, 1200, 512, 5000
iCOFun2		ftgentmp	0, 0, 1024, -7, 400, 512, 1400, 512, 8000
iCOFun3		ftgentmp	0, 0, 1024, -7, 800, 512, 1600, 512, 4000
iCOFun4		ftgentmp	0, 0, 1024, -7, 500, 512, 1800, 512, 6000

kCO1			table		kInd1, iCOFun1, 1
kCO2			table		kInd2, iCOFun2, 1
kCO3			table		kInd3, iCOFun3, 1
kCO4			table		kInd4, iCOFun4, 1

aNoise1		lpf18		aNoise1, kCO1, 0.4 + kd_1 * 10, 0
aNoise2		moogladder	aNoise2, kCO2, 0.5, 0
aNoise3		lpf18		aNoise3, kCO3, 0.4, 0.6
aNoise4		moogladder	aNoise4, kCO4, 0.7, 0

; Mix to audio array
;a1,a2		pan2		aNoise1, kInd1
;a3,a4		pan2		aNoise2, kInd2
;a5,a6		pan2		aNoise3, kInd3
;a7,a8		pan2		aNoise4, kInd4

;aL, aR	reverbsc	(a1 + a3 + a5 + a7), (a2 + a4 + a6 + a8), 0.75, 5000
kFade		cossegr	1, p3, 1, iFadeOut, 0
aMix		=		(aNoise1 + aNoise2 + aNoise3 + aNoise4) * gkVolume[iSensorNum-1] * aFiltAmp

;aVCO		vco2		0.01, 3, 16, 0.001, 0
;aMix		=		rand(aVCO+0.01)
gaSend[iSensorNum-1]	=		gaSend[iSensorNum-1] + aMix

			endin

