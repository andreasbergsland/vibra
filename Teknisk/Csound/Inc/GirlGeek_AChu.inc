;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
;/////////////////////////////////////////////////////////////////////////////////////////////////
instr		GirlGeek_AChu


ivarIndx		=		p5-1	; Index to look up the presets in the tables above, i.e. preset num
print ivarIndx
iSensor		=		p4
;printf_i		"Starting GirlGeek_AChu with preset %i and sound %i - Do the Bipp-a-chu!\n", 1, ivarIndx, iSnd
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with GirlGeek_AChu\n", 1, iSensor
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

; Preset values for the 7 variations: kThresh (determines rate of triggering), kDecay (duration), kRevMix, kNoiseMix, kDistMix, 
;				1		2		3		4		5		6		7
kGain[]	fillarray	100, 		3, 		6,		3,		0.8, 		0.5, 		0.5
kThresh[]	fillarray	1.5, 		10, 		1.5, 		4, 		6, 		1.5, 		1.5	; Negative envelope for slow changing intensity
;kAttack[]	fillarray	0.001,	0.001,	0.001,	0.001,	0.1,		0.1,		0.1
;kDecay[]	fillarray	0.15,		0.2,		0.15,		0.18,		0.15,		0.15,		0.15
kRevMix[]	fillarray	0.1,		0.3,		0.3,		0.5,		0.5,		0.1,		0.1
kNoiseMix[]	fillarray	0,		0.5,		0.6,		0,		0.2,		0,		0
kDistMix[]	fillarray	0,		0.6,		0.6,		0,		0.2,		0,		0
kDCAmp[]	fillarray	0, 		0.01,		0,		0,		0,		0,		0
kPitch1[]	fillarray	1.001, 	0.25,		1.5,		1.02,		1,		1,		1
kPitch2[]	fillarray	semitone(5),0.32,		1.81,		semitone(5),0.5,		1,		1
kPitch3[]	fillarray	semitone(12),0.38,	2.04,		semitone(12),0.25,	1,		1
kPitch4[]	fillarray	semitone(-5), 	0.52,		1.35,		semitone(24),0.75,	1,		1
kPitch5[]	fillarray	2.001, 	0.68,		1.93,		semitone(36),1,		1,		1
kPitch6[]	fillarray	semitone(-5), 1.1,	2.88,		semitone(48),1.5,		1,		1

kFade		linsegr	0 ,2, 1, p3-1, 1, iFadeOut*0.5, 0.1, iFadeOut*0.5, 0	; Global fadeout

gkQuat[]	init		4
kOri[]	init		3
kDelta[]	init		3
kDelta2[]	init		3
kDelt[]	init		3

kOri		=		gkEuler

;printk	0.1,	kOri[0]

kDelta	Delta_euler		gkEuler, 0.01, 0.01
kd_ori_sm[]	init			3
kd_ori_sm	Portk_array		kDelta, 0.03				; Delta orientation
kspeed	=			int(kd_ori_sm[0]*1000)*0.001 * -1	; Calculate speed from delta 
										; orientation of dimension 0 (x)=wheel rotation
											; Note: speed is reversed due to positioning of sensor
;printk2	kspeed
kDelta2	Delta_euler		gkEuler2, 0.01, 0.01
kd_ori_sm2[]	init			3
kd_ori_sm2	Portk_array		kDelta2, 0.03

kFastRotate	port			kd_ori_sm2[2], 0.3
kNewSound	trigger		abs(kFastRotate), 0.5, 0

kRnd		trandom	kNewSound, 0, 11.999
kSnd		=		int(kRnd)
kpreset	=		0
kpreset	=		(kpreset < 7)? kpreset + kNewSound: 0

kStartTurn	init		0
kCloser	init		0
if		kNewSound == 1 || kStartTurn > 0	then
kStartTurn	+=		0.07
endif

if	kStartTurn > 360	then
kStartTurn	=		0
endif

if		kNewSound == 1 || kCloser > 0	then
kCloser	+=		0.00018
endif

if	kCloser > 1	then
kCloser	=		0
endif

iCloseTab	ftgentmp		0, 0, 1024, -9, 1, 0.5, 270
kCloserD	table			kCloser, iCloseTab, 1
kCloserD	=			kCloserD + 0.5

kAzi		=			70 - int(gkEuler2[2]*100)*0.01 
gkAzi[0]	=			kAzi
gkDist[0]	=			2

gkAzi[1]	=			kAzi + 10 * kspeed + kStartTurn
gkDist[1]	=			4 - kCloserD * 3
;gkSpread[1]	=			4

gkAzi[2]	=			kAzi - 10* kspeed + kStartTurn
gkDist[2]	=			4- kCloserD * 3

gkAzi[3]	=			kAzi + 20* kspeed + kStartTurn
gkDist[3]	=			6- kCloserD * 3

gkAzi[4]	=			kAzi - 20* kspeed + kStartTurn
gkDist[4]	=			6- kCloserD * 3

gkAzi[5]	=			kAzi + 20 + kStartTurn
gkDist[5]	=			8 - kCloserD * 7

kOriX		port			kDelta[0], 0.05
kOriY		port			kDelta[1], 0.05
kOriZ		port			kDelta[2], 0.05

; Make triggers related to speed
apuls, kmetro	Metro_a	abs(kspeed*10), 0

; Triggers for the different presets
aTrig[]	init		7
aTrig[0]	=		apuls
kTimeGap	=		0.19 + kDelta[0] * 0.1
aTrig[1]	=		a(gkMultiMetro[4])
aTrig[2]	=		a(gkMultiMetro[6])
aTrig[3]	=		apuls
aTrig[4]	=		apuls
aTrig[5]	=		apuls
aTrig[6]	=		apuls

iAttTab	ftgentmp	0, 0, 1024, -7, 0.04, 512, 0.001, 512, 0.001
iDecTab	ftgentmp	0, 0, 1024, -7, 0.4, 512, 0.1, 512, 0.05
kAttack	table		kspeed*0.3, iAttTab, 1		; But what to do with negative speeds (=backwards)?
kDecay	table		kspeed*0.3, iDecTab, 1

;if		kThresh[ivarIndx] < 0	then
;kEnv		=			port((kOriX+kOriY+kOriZ), 1.2)
;aEnv		upsamp		kEnv
;endif

; Choose sound file
kTab		=		giTabNums[kSnd]

ktimp		init		0
ktimp		+=		abs(kDelta[0])*0.0003
atimp		=		a(ktimp)


; Make envelope from trigger
kEnvMix	init		0
kEnvMix	=		(kEnvMix + kd_ori_sm2[2]*0.00001)
if kspeed > 0	then
kEnvMix	=	0
else
kEnvMix	=	1
endif

aEnv		follow2	apuls, kAttack, kDecay
aStatic	=		0.2
aEnvMix	ntrpol	aEnv, aStatic, kEnvMix

iAmpTab	ftgen		0, 0, 1024, -7, 50, 256, 25, 256, 12, 256, 5, 256, 5
kampInd	=		abs(kspeed)*0.5
kampPuls	table		kampInd, iAmpTab, 1

kampStatic	=		0.001 + abs(kspeed)*0.5
kampMix	ntrpol	kampPuls, kampStatic, kEnvMix


kpitch	=		abs(gkQuat[1])

aMIX[]	init		8

kloop		=		int(line(0, 1, 5000))
;printk	0.1,	kloop

aNoiseIn		diskin2	"Radio/FM-Noise.aif", 1, 0, 17
aNoise	=	aNoiseIn*(kNoiseMix[ivarIndx]) + a(1-kNoiseMix[ivarIndx])

iMincAmp		=		0.5
a0		mincer	atimp, iMincAmp, kPitch1[kpreset], kTab, 1
a1		mincer	atimp+0.05, iMincAmp, kPitch2[kpreset], kTab, 1
a2		mincer	atimp+0.1, iMincAmp, kPitch3[kpreset], kTab, 1
a3		mincer	atimp+0.15, iMincAmp, kPitch4[kpreset], kTab, 1
a4		mincer	atimp+0.2, iMincAmp, kPitch5[kpreset], kTab, 1
a5		mincer	atimp+0.07, iMincAmp, kPitch6[kpreset], kTab, 1

iplen	=	2048	;  length of impulse response partitions (latency <-> CPU usage)
kupdate init	1
kclear	=	0
kFadeIn	linseg	0.0, 3.0, 1
aOUT		=		aEnv*(a0+a1+a2+a3+a4+a5)*kFadeIn
aNoiseMod	=		aOUT * aNoise
aLimit	limit		aNoiseMod, -0.05, 0.05
aLimit	=		aLimit * 4

aMix			ntrpol	aOUT, aLimit, kDistMix[ivarIndx]

aconv 		liveconv 	aOUT, giIR_record, iplen, kupdate, kclear

acomp			compress	aconv, aconv, 0, 48, 60, 100, 0.01, 0.1, 0.02
aScalRev		=		aconv * 0.2
arevL, arevR	reverbsc	aScalRev, aScalRev, 0.9, 8000, sr, 2

kupdate	=	0
; Mix to audio array
gaSend[0]	=     gaSend[0] + a0 * kFadeIn * kampMix * aEnvMix;gaSend[0] + (aMix*(1-kRevMix[ivarIndx])) * kGain[0]*gkVolume[iSensor-1] * kFade
gaSend[1]	=     gaSend[1] + a1 * kFadeIn * kampMix * aEnvMix;
gaSend[2]	=	gaSend[2] + a2 * kFadeIn* kampMix * aEnvMix
gaSend[3]	=	gaSend[3] + a3 * kFadeIn * kampMix * aEnvMix
gaSend[4]	=	gaSend[4] + a4 * kFadeIn * kampMix * aEnvMix
gaSend[5]	=	gaSend[5] + arevL * kFadeIn +  a0 * kCloserD * 0.08
; Update IR for when end of buffer is reached
kndx	init	0
kndx	+=	ksmps
if	kndx>=giIR_maxlen	then
kndx	=	0
kupdate = 	1
endif	

	tablew	aOUT*0.05, a(kndx), giIR_record

endin

