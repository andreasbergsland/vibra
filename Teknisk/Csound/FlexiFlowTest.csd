<CsoundSynthesizer>

<CsOptions>
-Ma -odac1
</CsOptions>


<CsInstruments>
nchnls	=		2
sr		=		44100
0dbfs		=		1


#include	"Inc/Delta_array.udo"

#include	"/Users/andber/Csound/UDOs/UC44.udo"

#include	"Inc/OSClistenArray.udo"

gaSend[]	init		8

gih		OSCinit	8001

instr		1
gkCtrlArr[][][]	init		2, 10, 17
gkIndices[]		init		3

gkCtrlArr, gkIndices	UC44		1


gkNGIMU[]		init			4
gkNGIMU		OSClistenArray	gih, "/quaternion", "ffff"
;printk2		kNGIMU[0]
;kstatus, kchan, kdata1, kdata2  midiin
;printf	"status=%i, chan=%i, data1=%i, data2=%i\n", (changed:k(kstatus+kchan+kdata1+kdata2)), kstatus, kchan, kdata1, kdata2

;gkVolume[]		init		8;=		gkControl[0][0][1]



;-----------Make tables section--------------------------------
SFiles[]	directory	"/Users/andber/Desktop/VIBRA/Teknisk/Csound/SND", ".wav"
giNumFiles	lenarray	SFiles
print		giNumFiles

; Make tables with sound files, store table numbers in an array
giTabNums[]		init			giNumFiles
giTabLengths[]	init			giNumFiles
indx1			=			0

maketables:
    ifn			ftgentmp		0, 0, 0, 1, SFiles[indx1], 0, 0, 1	; Read files as mono
    giTabNums[indx1]	=			ifn
    ilen			=			ftlen(ifn)
    giTabLengths[indx1]	=			ilen
loop_lt	indx1, 1, giNumFiles, maketables

; Keep track of categories of FM-recordings----------------------------------------
;iNumCats		=			7
;giCategories[][]	init			iNumCats, 30	 Use 7 categories: Kunst, Musikk, Nyheter, rePortasje, Reklame, Show og Utenriks
;									 each with space for 30 ftable numbers
;indxcat			=		0
;indxftnums			=		1
;indx2				=		0	 Index to iterate through the array
;SLastCat			strcpy		""			 initiate as empty string
;countmembers:
;    SCategory		strsub		SFiles[indx2], 58, 59
;    iCompare		strcmp		SCategory, SLastCat
;    if	indx2 == giNumFiles-1		then
;        giCategories[indxcat][0]=		indxftnums
;    elseif	iCompare 	!= 0	&& indx2 != 0	then		 When current is different from last...
;        giCategories[indxcat][0]=		indxftnums-1       write the number of members in the category to the first index
;        indxcat		+=			1			 change category....
;        indxftnums	=			1			 and reset index for ftable numbers
;    endif
;    giCategories[indxcat][indxftnums] =	giTabNums[indx2]
;    print indxcat, indxftnums, giTabNums[indx2]
;    SLastCat		strcpy		SCategory
;    indxftnums		+=			1
;loop_lt	indx2, 1, giNumFiles, countmembers

;if	gkTesting == 1	goto contin
; Send message to connect to server
;kTrig		init		1
;		OSCsend	kTrig, "192.168.1.39", 32000, "/vibra/connect", "si", "192.168.1.40", giMainPort
;kTrig		=		0
;-------------------------------------------------------------------------------
;contin:


endin

;
instr		FlexiFlow
;iSensor		=		p4
;iVariant		=		p5
;iIndex		=		iSensor - 1
;printf_i		"Starting FlexiFlow with sensor %i  - Floooowing!\n", 1, iSensor
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

kFade			linsegr	0, 1, 1, p3-1, 1, iFadeOut, 0

;if trigger(kRelease,0.5,0) == 1	then
;printf	"Fading out and turning off sensor %i with FlexiFlow\n", 1, iSensor
;kEnd		=		kTime
;endif
;;
;if	kRelease == 1	then
;kFadeCount	=	int(iFadeOut - (kTime - kEnd))
;printk2	kFadeCount
;endif
;
;kEMG[]	init		8
;kDelta[]	init		3
;kOri[]	init		3
;kEul[]	init		3
;
;kDelta		Delta_array		kOri, 0.03, 0.03
;kDeltaAbs[]		init			3
;kDeltaSum		=			abs(kDelta[0])+abs(kDelta[1])+abs(kDelta[2])
;
aNoise1		diskin2	"Radio/FM-Noise.aif", 1, 0, 17
;aNoise2		diskin2	"Radio/FM-Noise.aif", 0.5, 0, 17
;aNoise3		diskin2	"Radio/FM-Noise.aif", 0.25, 0, 17
;aNoise4		diskin2	"Radio/FM-Noise.aif", 1.5, 0, 17

if		gkIndices[1] == 2	then
kStripe	=		gkIndices[2]
endif

kSnd		=		int(kStripe)
kTab		=		giTabNums[kSnd]
;iLen		=		ftlen(kTab)/sr
;tableng
;ktimp		init		0
;kIncr		port		kDeltaSum, 1
;ktimp		+=		kIncr*0.0005
;;ktimp		line		0, 0.2, 1
atimp		=			a(gkCtrlArr[0][0][2])
;kAmp		port			(kDeltaSum * 20), 1.7
;aSnd		mincer		atimp, 1, 1, iTab, 1


;;aSnd		temposcal	ktimp, kAmp, 1.7, iTab, 1
;kCO		=		500 + kIncr*1500
;kBW		=		kCO * 0.15
;aSndFilt	butbp		aSnd, kCO, kBW	
;aSndFilt	butbp		aSndFilt, kCO, kBW
;
;kTimp		=		3 + (rspline(0, 0.1, 3, 5))
;aTimp		=		a(kTimp)
;
k1CO			=		downsamp(tone(a(gkCtrlArr[0][0][3]),0.3))
;k2CO			=		downsamp(tone(a(kEMG[1]),0.4))
;k3CO			=		downsamp(tone(a(kEMG[2]),0.5))
;k4CO			=		downsamp(tone(a(kEMG[3]),0.6))
;k5CO			=		downsamp(tone(a(kEMG[4]),0.5))
;k6CO			=		downsamp(tone(a(kEMG[5]),0.6))
;k7CO			=		downsamp(tone(a(kEMG[6]),0.5))
;k8CO			=		downsamp(tone(a(kEMG[7]),0.8))
;
aMinc1	mincer	atimp * 0.55 , 0.7*abs(gkNGIMU[0]), semitone(-12), kTab, 1
aMinc2	mincer	atimp * 0.51, 0.6*abs(gkNGIMU[1]), semitone(-24), kTab, 1
aMinc3	mincer	atimp * 0.49, 0.5*abs(gkNGIMU[2]), semitone(-36), kTab, 1
aMinc4	mincer	atimp * 0.45, 0.4*abs(gkNGIMU[3]), semitone(12), kTab, 1
;aMinc5	mincer	aTimp, 0.4*k5CO, semitone(6), giTabNums[0], 1
;aMinc6	mincer	aTimp, 0.2*k6CO, semitone(19), giTabNums[0], 1
;aMinc7	mincer	aTimp, 0.2*k7CO, semitone(24), giTabNums[0], 1
;aMinc8	mincer	aTimp, 0.2*k8CO, semitone(38), giTabNums[0], 1

aDroneMixL	=		(aMinc1+aMinc3)* gkCtrlArr[0][0][1];+aMinc5+aMinc6+aMinc7+aMinc8
aDroneMixR	=		(aMinc2+aMinc4)* gkCtrlArr[0][0][1]
;

aDrL, aDrR	reverbsc	aDroneMixL, aDroneMixR, 0.9, 12000, sr, 2
;
;kCO1			=		(60 + abs(k1CO)* 200)
;aCO1_sm		tone		a(kCO1), 0.6
;kCO1_sm		downsamp	aCO1_sm
;aFilt1		lpf18		aNoise1 + aMinc1, kCO1_sm, 0.3, 0.6

gaSend[0]	=		aDroneMixL + aDrL
gaSend[1]	=		aDroneMixR + aDrR

;kCO2			=		(120 + abs(k2CO)* 280)
;aCO2_sm		tone		a(kCO1), 1.1
;kCO2_sm		downsamp	aCO1_sm
;aFilt2		lpf18		aNoise2, kCO2_sm, 0.4, 0.6
;
;kCO3			=		(640 + abs(k3CO)* 380)
;aCO3_sm		tone		a(kCO3), 1.7
;kCO3_sm		downsamp	aCO3_sm
;kBW3			limit		(120 - 80 * abs(k3CO)), 20, 120
;aFilt3		butbp		aNoise3, kCO3_sm, kBW3
;
;kCO4			=		(940 + abs(k4CO)* 1280)
;aCO4_sm		tone		a(kCO4), 1.5
;kCO4_sm		downsamp	aCO4_sm
;kBW4			limit		(100 - 100 * abs(k4CO)), 20, 200
;aFilt4		butbp		aNoise4, kCO4_sm, kBW4
;
;if	iSensor < 5	then
;aSMix1		tone		a(kEMG[4]), 0.8
;aSMix2		tone		a(kEMG[5]), 1.1
;aSMix3		tone		a(kEMG[6]), 1.2
;aSMix4		tone		a(kEMG[7]), 1.3
;else
;aSMix1		=		downsamp(tone(a(kDelta[0]),0.3))
;aSMix2		=		downsamp(tone(a(kDelta[1]),0.3))
;aSMix3		=		downsamp(tone(a(kDelta[2]),0.3))
;aSMix4		=		downsamp(tone(a(kDelta[1]),0.3))
;endif
;
;aMix1			=		(aSMix1*aFilt1)*10
;aMix2			=		(aSMix2*aFilt2)*10
;aMix3			=		(aSMix3*aFilt3)*10
;aMix4			=		(aSMix4*aFilt4)*10
;
;aL,aR			reverbsc	aMix1+aMix2, aMix3+aMix4+aSndFilt, 0.8, 15000, sr, 3
;if	iVariant == 1	then
;gaSend[iIndex]	=		gaSend[iIndex] + (aL+aR)*kFade*gkVolume[iIndex]
;elseif iVariant == 2	then
;gaSend[iIndex]	=		gaSend[iIndex] + (aDroneMix + aDrL+aDrR)*kFade*gkVolume[iIndex]
;else
;gaSend[iIndex]	=		gaSend[iIndex] + (aDroneMix + aDrL+aDrR+aL+aR)*kFade*gkVolume[iIndex]
;endif
;;aMix1+aMix2+aMix3+aMix4+
outs		gaSend[0] , gaSend[1]
endin
</CsInstruments>


<CsScore>
#define	ALWAYSON	#999999#

i	1 		0	$ALWAYSON
i 	"FlexiFlow"	0	$ALWAYSON
</CsScore>


</CsoundSynthesizer>