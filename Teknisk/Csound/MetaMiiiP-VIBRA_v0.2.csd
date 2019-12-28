<CsoundSynthesizer>
<CsOptions>
-odac3  -iadc3 -Ma -b64 -B128
;-odac0 -Ma -b64 -B128
</CsOptions>
<CsInstruments>
/*
Gjøreliste:
- Fiks transponering/sortering
- Fiks tilfeldighet i filvalg - OK
- styr lydbankvalg med knapper - OK!
- bedre organiserte lydbanker så det er lettere å orientere seg (4 soner?)
- Sjekk om jeg har tilgang til alle samples i en bank
- glidebryter med finstemming?
- ha mulighet for å ha lyd inn
. Trigge en og en lyd (discrete)
- Effekt som feter opp og strekker ut lyden (mincer)
- Glidebryter styrer mengden tilfeldige variasjoner i tonehøyde
- Myo kan trigge enkeltlyder (EMG)
- Prøv å gjør noe mer spennende ut av liveconv-instrumentet
- Check values from NGIMU for consistency

CONTROLS:
Encoders:
- 1: Change sound bank
- 2+3: Sound file chooser

Sliders
1: Activity/trig freq
3: Transpose
4: Fine transpose
5: Volume
8: Grain envelope
9: Random panning (0-33%)
11: Grain duration
10: Random sound deviation

13: Conv mix
16. Master vol

Buttons:	
1: Start particles
6: Use NGIMU
*/

;**************************************************************************************************
sr		=		48000	; Sample rate matches sound files
ksmps		=		16	; Samples per control period - gives a kr period of 1.33ms
nchnls	=		2	; 2-chnls
0dbfs		=		1	; Maximum 0dB reference level
;**************************************************************************************************

#define	ALWAYSON		# 999999 #

#include	"Inc/UC44.udo"

#include	"Inc/Table_array.udo"

#include	"Inc/Onsets_kArray.udo"

#include	"Inc/Schedkwhen_array.udo"

#include	"Inc/Metro_a.udo"

#include	"Inc/Upsamptrig.udo"

#include	"Inc/Delta_array.udo"

#include	"Inc/IMU_intensity.udo"

#include	"Inc/Portk_array.udo"


giMyo		OSCinit	54321
giNGIMU1	OSCinit	8038

; ALWAYS ON INSTRUMENTS**********************************
		alwayson	"receiveCtrl"
		alwayson	"makeTables"
		alwayson	"Effects"
		alwayson	"Mixer"
;********************************************************
; Grain envelope tables
giSigmoRise 	ftgen		0, 0, 8193, 19, 0.5, 1, 270, 1			; rising sigmoid
giSigmoFall 	ftgen		0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid
giExpFall		ftgen		0, 0, 8193, 5, 1, 4096, 0.000001, 4097, 0.000001	; exponential decay
giTriangleWin 	ftgen		0, 0, 8193, 7, 0, 4096, 1, 4096, 0			; triangular window
; Basic waveforms
giSine		ftgen 	0, 0, 8192, 10, 1
giCosine		ftgen 	0, 0, 8192, 9, 1, 1, 180

giGainMasks		ftgen		0, 0, 16, -2, 0, 0, 1
giChnmasks		ftgen		0, 0, 16, -2, 0, 0, 0.01

gaSnd[]		init		2

giIR_maxlen	=	32768		; Just under a second
giIR_record 	ftgen 	0, 0, giIR_maxlen, 2, 1, 0

/*******************************************************************************
Data receiving instrument + make sample tables
*******************************************************************************/
		instr		receiveCtrl
; Get MIDI control data from UC44---------
gkCtrl[][]		init		10, 17
; dim1: widget group (0 = sliders, 1 = green buttons, 2 = grey buttons, 3-10 encoders)
; dim2: strip/controller number
gkCtrl		UC44		1, 0
;-----------------------------------------
; Adjust to fit with encoders on the UC44 (0-99)
gkSndBank		=		((gkCtrl[3][1]*100) > 0.5 && (gkCtrl[3][1]*100) < 1)? 1: int(gkCtrl[3][1]*100)
gkSndBank		limit		gkSndBank, 0, 5

gkMovData[][]	init		8, 8
gkSndBank1		init		1
gkSndBank2		init		1
giNumFilesLay[][]	init		1, 1
giLayNums		=		1
giMaxFiles		=		1000



; Get OSC data from Myo
kEMG[]	init		8
kEMGchg, kEMG		OSClisten 	giMyo, "/myo/1/emg/bfilt", "ffffffff"

kMyoRaw[]	init		10
kMyoChg, kMyoRaw		OSClisten 	giMyo, "/myo/1/imu/raw", "ffffffffff"

kMyoQuats[]	init		4
kMyoQuats	slicearray	kMyoRaw, 6, 9

; Get data from NGIMU
gkNG1Eul[]	init		3
kNG1Echg, gkNG1Eul	OSClisten	giNGIMU1, "/euler", "fff"

kNG1Quats[]	init		4
kNG1Qchg, kNG1Quats	OSClisten	giNGIMU1, "/quaternion", "ffff"

kNG1Lin[]	init		3
kNG1LinChg, kNG1Lin	OSClisten	giNGIMU1, "/linear", "fff"

kNG1LinAbs[]	init		3
kNG1LinAbs		maparray	kNG1Lin, "abs"
kNG1Lin[]		init		3
kNG1Lin		Portk_array		kNG1LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG1LinTab[]	init		3
gkNG1LinTab		Table_array	kNG1Lin, iLinTab, 1


kNG1L_int[]	init		3
kNG1L_int, gkNG1L_mags	IMU_intensity	kNG1Lin

gkNG1Q_d[]	init		4
gkNG1Q_d	Delta_array	kNG1Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG1Q_abs[]	init		4
kNG1Q_abs	maparray	gkNG1Q_d, "abs"
gkNG1Q_mag	sumarray	kNG1Q_abs


; Do some ftab mapping
gkEMG[]	init		8
iEMGtab	ftgentmp	0, 0, 1024, -16, 0, 30, 0, 0, 674, -1, 1, 300, 0, 1
gkEMG		Table_array	kEMG, iEMGtab

gkEMG_onsets[] init	8
idelt		=		0.001
irmsthresh	=		0.05
iNoiseThrsh	=		0
iDebounceTime=		0.05
gkEMG_rms[]	=		8
gkEMG_onsets, gkEMG_rms 	Onsets_kArray	gkEMG, idelt, irmsthresh, iNoiseThrsh, iDebounceTime

kP4[]		fillarray	0, 2, 4, 5, 7, 9, 11, 12
kIns[]	fillarray	2, 2, 2, 2, 2, 2, 2, 2
kPan[]	fillarray	0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 1
kArr[]	init		8

; Control effects and sound playing instruments-----------------------------------
;
;kArr		Schedkwhen_array	 gkEMG_onsets, 0, 0, kIns, 0, 5, kP4, gkEMG_rms, kPan
;
kbank		=		0	; default = bank 1

if trigger:k(gkCtrl[1][1], 0.5, 0) == 1	then
 event	"i", "particles", 0, $ALWAYSON, kbank
elseif trigger:k(gkCtrl[1][1], 0.5, 1) == 1	then
 printf "Turning off particles instrument ---%i", 1-gkCtrl[1][1], gkCtrl[1][1]
 turnoff2(nstrnum("particles"),0,1)
endif

endin
/******************************************************************
			Make tables
******************************************************************/
			instr		makeTables
;-----------Make tables section--------------------------------
SFiles1[]	directory	"/Users/andber/Particles/Xternal/Sets_old/SingerPhonemes/Patch_structure/Sounds/Layered/Layer1", ".aif"
;SFiles1[]	directory	"/Users/andber/Particles/Xternal/TestPLight/", ".aif"
SFiles2[]	directory	"/Users/andber/Particles/Sets/7-Analog/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles3[]	directory	"/Users/andber/Particles/Xternal/Sets_old/4-ROBERT_SOLO/Patch_structure/Sounds/Layered/Layer1", ".aiff"
SFiles4[]	directory	"/Users/andber/Particles/Xternal/Sets_old/Set_Greta/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles5[]	directory	"/Users/andber/Particles/Sets/5-UHS_test/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles6[]	directory	"/Users/andber/Particles/Sets/1-Materials/Patch_structure/Sounds/Layered/Layer1", ".aif"
giNumSets	=		6
giNumFiles[]	init		6
giNumFiles[0]	lenarray	SFiles1
giNumFiles[1]	lenarray	SFiles2
giNumFiles[2]	lenarray	SFiles3
giNumFiles[3]	lenarray	SFiles4
giNumFiles[4]	lenarray	SFiles5
giNumFiles[5]	lenarray	SFiles6

printarray giNumFiles

imaxnumfiles max		giNumFiles[0], giNumFiles[1], giNumFiles[2], giNumFiles[3], giNumFiles[4], giNumFiles[5]
SFiles[]	init		imaxnumfiles

; Make tables with sound files, store table numbers in an array
giTabNums[][]	init			6, imaxnumfiles
giTabLengths[][]	init			6, imaxnumfiles

ibank			=			0
bankloop:
 SFiles[]	init	       imaxnumfiles
  if	ibank == 0	then
   SFiles	=	SFiles1
  elseif ibank == 1	then
   SFiles	=	SFiles2
  elseif ibank == 2	then
   SFiles	=	SFiles3
  elseif ibank == 3	then
   SFiles	=	SFiles4
  elseif ibank == 4	then
   SFiles	=	SFiles5
  elseif ibank == 5	then
   SFiles	=	SFiles6
  endif

  if giNumFiles[ibank] > 1 then
;; Get number part of file name and put it in an array as integers for later sorting
 igetNumber[]	init		giNumFiles[ibank]
 indx1			=		0
loop1:
  ilen			=		strlen(SFiles[indx1])				; Get length of path + file name
  indx	=		0
  SNum	=		""
  iSlashMatch=		-1
  iDotMatch  =		-1
  until	iSlashMatch == 0 do
   SChar	strsub	SFiles[indx1], ilen-indx, ilen-indx-1
   iSlashMatch strcmp	SChar, "/"
   iDotMatch	strcmp	SChar, "."
    if iSlashMatch == 0 then
     iSlashInd = indx
    elseif iDotMatch == 0	then
     iDotInd = indx
    endif
   indx	+= 1
  od

 Sordinal		strsub	SFiles[indx1], ilen -iSlashInd, ilen-iDotInd-1	; Extract file name string minus path and extension
 iNumber		strtol	Sordinal
 igetNumber[indx1]	=		iNumber					; Convert to integer
 loop_lt	indx1, 1, giNumFiles[ibank], loop1
;------------

; Sort files with number array as key------------
 SortedFiles[]	init		1
 SortedFiles[]	init		giNumFiles[ibank]
 iMax			maxarray	igetNumber
 indx2			=		0
loop2:
  iMin, iMinIndx	minarray	igetNumber
  SortedFiles[indx2]	=	SFiles[iMinIndx]
  igetNumber[iMinIndx]		=	iMax + 1000
 loop_lt	indx2, 1, giNumFiles[ibank], loop2
endif
  
 indx1		=			0
maketables:
 if indx1 < giNumFiles[ibank] then
   ifn			ftgentmp			0, 0, 0, 1, SortedFiles[indx1], 0, 0, 1	; Read files as mono
   giTabNums[ibank][indx1]	=			ifn
 endif
 loop_lt	indx1, 1, imaxnumfiles, maketables


loop_lt	ibank, 1, 6, bankloop

			endin

/*
Ideas:
Use quaternions to morph between different types of sounds
What types of sounds do I need:
- Drones (needs to be tunable, but how?), 
- Gestures (noise <-> tone, could organize the sound bank to do this). Could use a kind of particles
setup to do this, but with some extra effects, could also have some extra sounds. Try to use delta euler or quaternion
to get an activity value.
- Mincer with partial tracking to make tonal material and tails like in wheelchair instrument

*/

		instr		particles

iht		=		0.01
kParams[]	init		10
kParams[0]	port		gkCtrl[0][5] * 15, iht	; volume

; Use whichever of fader or sensor is active
kSensorDiff	port		gkNG1L_mags, 0.04
kFaderDiff	=		abs(port:k(diff:k(gkCtrl[0][1]), 0.1))
kUseSensor	=		trigger:k(kSensorDiff,0.05, 0)
kUseFader	=		trigger:k(kFaderDiff, 0.0001, 0)
kSwitch	init		0
if	changed:k(kUseFader)==1	then
 kSwitch	=		-1
elseif changed:k(kUseSensor)==1 then
 kSwitch	=		1
endif

kActivity	=		gkCtrl[0][1]
kChooser	=		gkCtrl[4][1] + gkCtrl[5][1]* 0.5
kTranspose	=		gkCtrl[0][3]
kRandPan	=		rand(gkCtrl[0][9]*0.333)
kParams[2]	port		kChooser, iht	; sound file chooser
kParams[3]	init		0.5
kParams[3]	port		gkCtrl[0][8], iht	; Grain envelope
kParams[8]	=		gkCtrl[0][4]	; Fine transpose

;
 if kSwitch == 1	then
  kParams[0]	port		(gkNG1Q_mag +  gkNG1L_mags)*20, 0.05 ; Volume
  kParams[1]	=		gkNG1Q_mag +  gkNG1L_mags ; Triggering frequency (activity)
  kParams[4]	=		(gkNG1Eul[1]/-180)+0.5 ; Transpose
  kParams[7]	=		(gkNG1Eul[0]/180)+0.5
 elseif kSwitch == -1	then
  kParams[0]	port		gkCtrl[0][1], 0.05 ; Volume
  kParams[1]	port		kActivity, iht ; Triggering frequency (activity)
  kParams[4]	port		kTranspose, iht	; Transpose
  kParams[7]	=		0.333 + kParams[2]*0.333 + kRandPan
 endif

if	gkCtrl[1][6] ==	1	then
 kParams[0]		port		(gkNG1Q_mag +  gkNG1L_mags)*20, 0.05 ; Volume
 kParams[1]		port		kActivity, iht
 kParams[4]		port		kTranspose, iht	; Transpose
 kParams[7]		=		(gkNG1Eul[0]/180)+0.5
endif

kParams[5]	port		gkCtrl[0][10] * 10, iht ; Random sound deviation
kParams[6]	port		(1-gkCtrl[0][11]), iht	; Grain duration

#include	"Inc/particlesLight.inc"


gaSnd[0]		=		gaSnd[0] + a1 * kfadeout * kVolume
gaSnd[1]		=		gaSnd[1] + a2 * kfadeout * kVolume

		endin

		instr		Effects

iplen		=		2048	;  length of impulse response partitions (latency <-> CPU usage)
kupdate 	init		1
kclear	=		0
aOut		=		gaSnd[0]+gaSnd[1]
fSig		pvsanal	gaSnd[0]+gaSnd[1], 1024, 256, 1024, 1
kscal		=		semitone((gkCtrl[0][14]-0.5)*12)
fScal		pvscale	fSig, semitone((gkCtrl[0][14]-0.5)*24)	; Transpose 1
fScal2	pvscale	fSig, semitone((gkCtrl[0][15]-0.5)*24)	; Transpose 2
fMix		pvsmix	fScal, fScal2
aOut		pvsynth	fMix
aconv 	liveconv 	aOut, giIR_record, iplen, kupdate, kclear
kMix		port		gkCtrl[0][13], 0.02
aL		=		(kMix * aconv  + gaSnd[0]*(1-kMix)) 
aR		=		(kMix * aconv  + gaSnd[1]*(1-kMix))

gaSnd[0]	=		gaSnd[0] + aL
gaSnd[1]	=		gaSnd[1] + aR

kupdate	=		0

kndx		init		0
kndx		+=		ksmps
if		kndx>=giIR_maxlen	then
kndx		=		0
kupdate 	= 		1
endif
		tablew	aOut*0.025, a(kndx), giIR_record

		endin


;***************************************************
		instr Mixer
;****************************************************

		outs	gaSnd[0]* gkCtrl[0][16], gaSnd[1]* gkCtrl[0][16]

gaSnd[0]	=		0
gaSnd[1]	=		0

		endin





</CsInstruments>
<CsScore>
f0	36000
;i "particles" 1	100	0
  ;i100	1	0.4	0	
</CsScore>
</CsoundSynthesizer>