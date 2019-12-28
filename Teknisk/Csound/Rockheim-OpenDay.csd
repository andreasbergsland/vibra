	<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B256 -m0 -d ;--realtime
</CsOptions>

<CsInstruments>

/*

*/
;**************************************************************************************************
sr		=		44100	; Sample rate matches sound files
ksmps		=		16	; Samples per control period - gives a kr period of 1.33ms
nchnls	=		2	; 8-chnls
0dbfs		=		1	; Maximum 0dB reference level
;**************************************************************************************************
;		INITIATE GLOBAL VARIABLES AND CHANNELS, FTABLES AND GUI
;**************************************************************************************************
#define	ALWAYSON		#9999999#

; Declare channels for communication with Max
#include		"Inc/MaxSndChnls.inc"

; Set to 0 when running whole setup, for testing with single sensors, set to 1
gkTesting	init			0

; Initiate python
		pyinit

/*_____________________________________________________________________________________________
 INITIATE OSC PORTS FOR COMMUNICATION WITH NGIMUs
*/
giNGIMU1	OSCinit		8001
giNGIMU2	OSCinit		8002
giNGIMU3	OSCinit		8003

;_____________________________________________________________________________________________

;==========================================================================================
;==========================================================================================
;==========================================================================================
; 	INCLUDE UDOs SECTION
;==========================================================================================
;==========================================================================================
;==========================================================================================
;#include "/Users/andber/Particles/MC3.0/Inc/Udo/Debounce.udo"

; UDO that lists the names of the folders in a folder, here the set names
;#include "/Users/andber/Particles/MC3.0/Inc/Udo/GetFolderNames.udo"

;#include "/Users/andber/Particles/MC3.0/Inc/Udo/ReadAndSortFiles.udo"

;#include "/Users/andber/Particles/MC3.0/Inc/Udo/Metro_a.udo"
;
;#include "Inc/Onsets_k.udo"
;
;#include "Inc/OSClistenArray.udo"
;
;#include "Inc/Portk_array.udo"
;
;#include "Inc/MapTab_array.udo"
;
;#include "Inc/Accel_intensity.udo"
;
#include "Inc/Delta_array.udo"

#include "Inc/Delta_euler.udo"

;#include "Inc/MultiMetro.udo"

		seed		0

gaSend[]	init		2

giSine	ftgen		0, 0, 2^18, 10, 1
giFadePart  ftgen		0, 0, 1024, 5, 1, 400, 0.05, 624, 0.000001
giMaxAmps	ftgen		0, 0, 256, -7, 0
giMaxFrqs	ftgen		0, 0, 256, -7, 0

giIR_maxlen	=	8192*4	; Just over a second
giIR_record 	ftgen 	0, 0, giIR_maxlen, 2, 1, 0

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;		Receive OSC-data from motion tracking system, cook/prepare global parameters
;		Manage sound sets 1 and 2 for one and two player modes
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

			instr		1

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
iNumCats		=			7
giCategories[][]	init			iNumCats, 30	; Use 7 categories: Kunst, Musikk, Nyheter, rePortasje, Reklame, Show og Utenriks
									; each with space for 30 ftable numbers
indxcat			=		0
indxftnums			=		1
indx2				=		0	; Index to iterate through the array
SLastCat			strcpy		""			; initiate as empty string
countmembers:
    SCategory		strsub		SFiles[indx2], 58, 59
    iCompare		strcmp		SCategory, SLastCat
    if	indx2 == giNumFiles-1		then
        giCategories[indxcat][0]=		indxftnums
    elseif	iCompare 	!= 0	&& indx2 != 0	then		; When current is different from last...
        giCategories[indxcat][0]=		indxftnums-1      ; write the number of members in the category to the first index
        indxcat		+=			1			; change category....
        indxftnums	=			1			; and reset index for ftable numbers
    endif
    giCategories[indxcat][indxftnums] =	giTabNums[indx2]
;    print indxcat, indxftnums, giTabNums[indx2]
    SLastCat		strcpy		SCategory
    indxftnums		+=			1
loop_lt	indx2, 1, giNumFiles, countmembers


endin

	instr 	2

; NGIMU sensors --------------------------------------
gkEuler1[]		init		3
kans, gkEuler1	OSClisten	giNGIMU1, "/euler", "fff"
gkEuler2[]		init		3
kans, gkEuler2	OSClisten	giNGIMU2, "/euler", "fff"
gkEuler3[]		init		3
kans, gkEuler3	OSClisten	giNGIMU3, "/euler", "fff"

gkLinear1[]		init		3
kans, gkLinear1 	OSClisten	giNGIMU1, "/linear", "fff"
gkLinear2[]		init		3
kans, gkLinear2 	OSClisten	giNGIMU2, "/linear", "fff"
gkLinear3[]		init		3
kans, gkLinear3 	OSClisten	giNGIMU3, "/linear", "fff"

; Gyro: 0-2, accel: 3-5, magneto: 6-8, baro:9
gkIMU1[]		init		10
kans, gkIMU1 	OSClisten	giNGIMU1, "/sensors", "ffffffffff"
gkIMU2[]		init		10
kans, gkIMU2 	OSClisten	giNGIMU2, "/sensors", "ffffffffff"
gkIMU3[]		init		10
kans, gkIMU3 	OSClisten	giNGIMU3, "/sensors", "ffffffffff"

; Get salient parameters-----------------------------------
gkd_Euler1[]	init		3
gkd_Euler1		Delta_euler		gkEuler1, 1/kr, 0.01

; Speed left wheel


; Speed right wheel

; Average speed both wheels


; Orientation chair





;--------------------------------------------------
;printk2	gkNGIMU1_Eul[0] ; (Roll, pitch, yaw)
;kcpslast	init		0
;kcps		=		gkNGIMU1_Eul[1]
; This code is for correcting jumps in the values - does not work well when dancers roll on the floor.
;if	(kcps - kcpslast) > 300	then
;kcps		=	kcps - 360
;elseif (kcps - kcpslast) < -300	then
;kcps		=	kcps + 360
;endif
;out(oscil(0.2, 400+kcps*2))
;kcpslast	=		kcps
;printk2	kcps


;iArrLen	lenarray	gkMyo1_EMG_bf
;
;; Do filtering on EMG array
;kHalfTime	=		0.02
;kMyo_EMG_po[]	Portk_array		gkMyo1_EMG_bf, kHalfTime


endin

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
			MAPPING SECTION
Sensor 1: NGIMU 1
Sensor 2: NGIMU 2
Sensor 3: NGIMU 3

One instrument establishes a mapping between one/two sensors and one instrument

Parameters for the sound playing instruments are general, to make for easier remapping:
1. Energy articulation (intensity).
2. Sound variation (choice of sound segment: could control a. file index and b. skip time)
3. Modulation (could control, in decreasing order dependent on importance : a. rate, b. depth 0-1, 
							c. skew/dur of "grain" 0.001-4, d.attack/decay factor 0.5, e.shape 0= soft, 1=hard/square)
4. Pitch/transposition
5. Timbre (could control: a. brightness dull: -1, bright: 1, b.noise/tone noise: -1, tone: 1, c. dense/sparse sparse: -1, dense 1, d. wide/narrow narrow -1, wide: 1)
6. Placement (could control: a.panning/azimuth angle in degrees 90=front, b.distance in metres, c. width 0-1, d.variation 1-)
*/
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; Instrument for initializing global arrays and variables to store parameter values

		instr		Launcher
; Randomize instrument order
pyruni {{
from random import shuffle
a = [1.0,2.0,3.0,4.0]
shuffle(a)
}}
iNstr[]  init	4
iNstr[0] pyevali	"a[0]"
iNstr[1] pyevali	"a[1]"
iNstr[2] pyevali	"a[2]"
iNstr[3] pyevali	"a[3]"

isessionDur	=	8
isectDur	=	isessionDur * 0.25

event_i	"i", 10 + iNstr[0], 0, isectDur
event_i	"i", 10 + iNstr[1], isectDur, isectDur
event_i	"i", 10 + iNstr[2], isectDur*2, isectDur
event_i	"i", 10 + iNstr[3], isectDur*3, isectDur

		endin

		instr	11, 12, 13, 14
print	p1
		endin


;/////////////////////////////////////////////////////////////////////////////////////////////////
;		INCLUDE INSTRUMENTS HERE
;#include 	"Inc/GirlGeek_AChu.inc"		; instr 4
;#include	"Inc/Myo_minctracer.inc"	; instr 4
;#include	"Inc/Myo_SquineWave.inc"	; instr 5
;#include	"Inc/Myo_MultiSine.inc"		; instr 6
;#include	"Inc/Myo_WarbleSine.inc"	; instr 7
;#include	"Inc/Myo_MultiVoice.inc"	; instr 8
;#include	"Inc/NGIMU_Noizer.inc"		; instr 9
;;
;#include 	"Inc/FlexiPulzer.inc"		; instr 10
;#include	"Inc/Flexi_WarbleSine.inc"
;#include 	"Inc/GirlGeek_AChu.inc"		; instr 11
;#include	"Inc/Flexi_Flow.inc";		; instr 12
;
;#include	"Inc/PulzerTone.inc"
;/////////////////////////////////////////////////////////////////////////////////////////////////

;*******************************************************************************
;		Create spatialization for all sensors
;*******************************************************************************
;#include	"Inc/Spatialization.inc"


;*******************************************************************************
;		Mixer/route/send instrument
;*******************************************************************************
		instr		1000


outs		gaSend[0], gaSend[1]

gaSend[0]	=		0
gaSend[1]	=		0

		endin

</CsInstruments>

<CsScore>
#define	ALWAYSON	#999999#

i1		0		$ALWAYSON
i2		0		$ALWAYSON
i "Launcher"		0		$ALWAYSON
i500		0		$ALWAYSON
i1000		0		$ALWAYSON

</CsScore>

</CsoundSynthesizer>
