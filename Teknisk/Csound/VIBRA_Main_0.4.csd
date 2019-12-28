

<CsoundSynthesizer>
<CsOptions>
-odac1 -b128 -B256 -m0 -d ;--realtime
</CsOptions>

<CsInstruments>
; This version was used in the VIBRA workshop March 16 2018 at DansIT, Svartlamoen
;**************************************************************************************************
sr		=		44100	; Sample rate matches sound files
ksmps		=		16	; Samples per control period - gives a kr period of 1.33ms
nchnls	=		2	; Stereo
0dbfs		=		1	; Maximum 0dB reference level
;**************************************************************************************************
;		INITIATE GLOBAL VARIABLES AND CHANNELS, FTABLES AND GUI
;**************************************************************************************************
#define	ALWAYSON		#9999999#


; Initiate python
		pyinit

/*_____________________________________________________________________________________________
 INITIATE OSC PORTS FOR COMMUNICATION WITH CONTROL (CM) AND TRACKING (TM) MODULES
*/
giMainPort	=			5434
giCMserver	OSCinit		giMainPort
giCMserver2	OSCinit		5432			; Port for sending data from 4th armband to Sigurd
giMax		OSCinit		3000

;_____________________________________________________________________________________________

;==========================================================================================
;==========================================================================================
;==========================================================================================
; 	INCLUDE UDOs SECTION
;==========================================================================================
;==========================================================================================
;==========================================================================================
#include "/Users/andber/Particles/MC3.0/Inc/Udo/Debounce.udo"

; UDO that lists the names of the folders in a folder, here the set names
#include "/Users/andber/Particles/MC3.0/Inc/Udo/GetFolderNames.udo"

#include "/Users/andber/Particles/MC3.0/Inc/Udo/ReadAndSortFiles.udo"

#include "/Users/andber/Particles/MC3.0/Inc/Udo/Metro_a.udo"

#include "Inc/Onsets_k.udo"

#include "Inc/OSClistenArray.udo"

#include "Inc/Portk_array.udo"

#include "Inc/MapTab_array.udo"

#include "Inc/EMGwarbler_array.udo"

		seed		0

giSine	ftgen		0, 0, 2^18, 10, 1
giFadePart  ftgen		0, 0, 1024, 5, 1, 400, 0.05, 624, 0.000001
giMaxAmps	ftgen		0, 0, 256, -7, 0
giMaxFrqs	ftgen		0, 0, 256, -7, 0

gaSend[]	init		8
gkAzi[]	init		8
gkDist[]	init		8
gkSpread[]	init		8

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

; Send message to connect to server
kTrig		init		1
		OSCsend	kTrig, "192.168.1.33", 32000, "/vibra/connect", "si", "192.168.1.38", giMainPort
kTrig		=		0
;-------------------------------------------------------------------------------

endin

	instr 	2
; Get volum controls from Max
gkVolumMincTracer	init			0.5
gkVolumSquineWave	init			0.5
gkVolumFlexiPulzer init			0.5
gkVolumWarbleSine	init			0.5
gkVolumNoizer	init			0.5
gkVolumMultiSine	init			0.5

kans			OSClisten		giMax, "/volum/minctracer", "f", gkVolumMincTracer
kans			OSClisten		giMax, "/volum/SquineWave", "f", gkVolumSquineWave
kans			OSClisten		giMax, "/volum/FlexiPulzer", "f", gkVolumFlexiPulzer
kans			OSClisten		giMax, "/volum/WarbleSine", "f", gkVolumWarbleSine
kans			OSClisten		giMax, "/volum/Noizer", "f", gkVolumNoizer
kans			OSClisten		giMax, "/volum/MultiSine", "f", gkVolumMultiSine


; Myo armbands - raw IMU data-----------------------------------------------------
; AccelsXYZ
gkMyo1_Accel[]	init		3
gkMyo1_Accel	OSClistenArray	giCMserver, "/myo/1/acceleration/scaled", "fff"


gkMyo2_Accel[]	init		3
gkMyo2_Accel	OSClistenArray	giCMserver, "/myo/2/acceleration/scaled", "fff"
;printk2		gkMyo2_Accel[0]

gkMyo3_Accel[]	init		3
gkMyo3_Accel	OSClistenArray	giCMserver, "/myo/3/acceleration/scaled", "fff"
;printk2		gkMyo3_Accel[0]

gkMyo4_Accel[]	init		3
gkMyo4_Accel	OSClistenArray	giCMserver, "/myo/4/acceleration/scaled", "fff"
;printk2		gkMyo4_Accel[0]
; GyroXYZ
gkMyo1_Gyro[]	init		3
gkMyo1_Gyro	OSClistenArray	giCMserver, "/myo/1/gyro/scaled", "fff"

gkMyo2_Gyro[]	init		3
gkMyo2_Gyro	OSClistenArray	giCMserver, "/myo/2/gyro/scaled", "fff"

gkMyo3_Gyro[]	init		3
gkMyo3_Gyro	OSClistenArray	giCMserver, "/myo/3/gyro/scaled", "fff"

; Use this line when connected to vibra.speed
gkMyo4_Gyro[]	init		3
gkMyo4_Gyro	OSClistenArray	giCMserver, "/myo/4/gyro/scaled", "fff"
; Use this line for testing on local mac
;gkMyo4_Gyro[]	init		3
;gkMyo4_Gyro	OSClistenArray	giCMserver, "/myo1/gyro/scaled", "fff"

; Myo armbands - IMU-based intensity----------------------------------------------
gkMyo1_Acc_delta[] init		3
gkMyo1_Acc_delta	OSClistenArray	giCMserver, "/myo/1/acceleration/scaled", "fff"
kMyo1_Acc_Abs[]	init		3
kMyo1_Acc_Abs	maparray	gkMyo1_Acc_delta, "abs"
gkMyo1_Acc_int	sumarray	kMyo1_Acc_Abs

gkMyo2_Acc_delta[] init		3
gkMyo2_Acc_delta	OSClistenArray	giCMserver, "/myo/2/acceleration/scaled", "fff"
kMyo2_Acc_Abs[]	init		3
kMyo2_Acc_Abs	maparray	gkMyo2_Acc_delta, "abs"
gkMyo2_Acc_int	sumarray	kMyo2_Acc_Abs

gkMyo3_Acc_delta[] init		3
gkMyo3_Acc_delta	OSClistenArray	giCMserver, "/myo/3/acceleration/scaled", "fff"
kMyo3_Acc_Abs[]	init		3
kMyo3_Acc_Abs	maparray	gkMyo3_Acc_delta, "abs"
gkMyo3_Acc_int	sumarray	kMyo3_Acc_Abs

gkMyo4_Acc_delta[] init			3
gkMyo4_Acc_delta	OSClistenArray	giCMserver, "/myo/4/acceleration/scaled", "fff"
kMyo4_Acc_Abs[]	init		3
kMyo4_Acc_Abs	maparray	gkMyo4_Acc_delta, "abs"
gkMyo4_Acc_int	sumarray	kMyo4_Acc_Abs


; Use when not hooked up to vibra.speed/Sigurd
;gkMyo4_Acc_delta	OSClistenArray	giCMserver, "/myo1/acceleration/scaled", "fff"
;kMyo4_Acc_Abs[]	init		3
;kMyo4_Acc_Abs	maparray	gkMyo4_Acc_delta, "abs"
;gkMyo4_Acc_int	sumarray	kMyo4_Acc_Abs


; Use this line for testing
;gkMyo2NGIMU[]	init		4
;gkMyo2NGIMU		OSClistenArray	giCMserver, "/myo1/orientation/quaternion", "ffff"



;gkMyo1_Imu_int	int	0
;kan			OSClisten		giCMserver, "/myo/1/imu/int", "f", gkMyo1_Imu_int
;
;gkMyo2_Imu_int	int	0
;kan			OSClisten		giCMserver, "/myo/2/imu/int", "f", gkMyo2_Imu_int
;
;gkMyo3_Imu_int	int	0
;kan			OSClisten		giCMserver, "/myo/3/imu/int", "f", gkMyo3_Imu_int
;kMyo3_Imu_int	port			gkMyo3_Imu_int, 0.1
;
;gkMyo4_Imu_int	int	0
;kan			OSClisten		giCMserver, "/myo/4/imu/int", "f", gkMyo4_Imu_int
;
; Myo armbands - IMU-based euler calculations---------------------------------------
gkMyo1_euler[]	init		3
gkMyo1_euler	OSClistenArray	giCMserver, "/myo/1/orientation/raw", "fff"

gkMyo2_euler[]	init		3
gkMyo2_euler	OSClistenArray	giCMserver, "/myo/2/orientation/raw", "fff"

gkMyo3_euler[]	init		3
gkMyo3_euler	OSClistenArray	giCMserver, "/myo/3/orientation/raw", "fff"

gkMyo4_euler[]	init		3
gkMyo4_euler	OSClistenArray	giCMserver, "/myo/4/orientation/raw", "fff"


; Myo armbands - filtered EMG data--------------------------------------------
gkMyo1_EMG_bf[]	init		8
gkMyo1_EMG_bf	OSClistenArray	giCMserver, "/myo/1/EMG/scaledAbs", "ffffffff"

gkMyo2_EMG_bf[]	init		8
gkMyo2_EMG_bf	OSClistenArray	giCMserver, "/myo/2/EMG/scaledAbs", "ffffffff"

gkMyo3_EMG_bf[]	init		8
gkMyo3_EMG_bf	OSClistenArray	giCMserver, "/myo/3/EMG/scaledAbs", "ffffffff"

; This is the EMG that is connected to my machine ID: Myo1
gkMyo4_EMG_bf[]	init		8
gkMyo4_EMG_bf	OSClistenArray	giCMserver, "/myo/4/emg/scaled/abs", "ffffffff"

; Use these lines for testing away from Vibra.speed, testing with Myo Mapper 3
;gkMyo4_EMG_bf[]	init		8
;gkMyo4_EMG_bf	OSClistenArray	giCMserver, "/myo1/emg/scaled/abs", "ffffffff"


;printk2		gkMyo4_EMG_bf[0]
; Myo armbands - sum of filtered EMG data-------------------------------------
;gkMyo1_EMG_sum	init		0
;kans			OSClisten		giCMserver, "/myo/1/emg/bfilt/sum", "f", gkMyo1_EMG_sum
;gkMyo1_EMG_sum	port		gkMyo1_EMG_sum, 0.02
kMyo1_EMG_sum	sumarray		gkMyo1_EMG_bf				
gkMyo1_EMG_sum	=			kMyo1_EMG_sum * 0.125			; Calculate normalized sum of array

;gkMyo2_EMG_sum	init		0
;gkans			OSClisten		giCMserver, "/myo/2/emg/bfilt/sum", "f", gkMyo2_EMG_sum
;gkMyo2_EMG_sum	port		gkMyo2_EMG_sum, 0.02
kMyo2_EMG_sum	sumarray		gkMyo2_EMG_bf				
gkMyo2_EMG_sum	=			kMyo2_EMG_sum * 0.125			; Calculate normalized sum of array

;gkMyo3_EMG_sum	init		0
;kans			OSClisten		giCMserver, "/myo/3/emg/bfilt/sum", "f", gkMyo3_EMG_sum
kMyo3_EMG_sum	sumarray		gkMyo3_EMG_bf				
gkMyo3_EMG_sum	=			kMyo3_EMG_sum * 0.125			; Calculate normalized sum of array

;gkMyo4_EMG_sum	init		0
;kans			OSClisten		giCMserver, "/myo/4/emg/bfilt/sum", "f", gkMyo4_EMG_sum
kMyo4_EMG_sum	sumarray		gkMyo4_EMG_bf				
gkMyo4_EMG_sum	=			kMyo4_EMG_sum * 0.125			; Calculate normalized sum of array
;gkMyo4_EMG_sum	port			gkMyo4_EMG_sum, 0.02

; Myo armbands - relative data-------------------------------------------------------------
; Angular difference - when armbands turn different ways => positive, opposite ways => negative
gkMyo1_2_ang_diff	init		0
kan			OSClisten		giCMserver, "/myo/1_2/euler/ang_diff", "f", gkMyo1_2_ang_diff

gkMyo3_4_ang_diff	init		0
kan			OSClisten		giCMserver, "/myo/1_2/euler/ang_diff", "f", gkMyo3_4_ang_diff

; Angular sum - when armbands turn same ways left => high positive values, same ways right => high negative values
gkMyo1_2_ang_sum	init		0
kan			OSClisten		giCMserver, "/myo/3_4/euler/ang_sum", "f", gkMyo1_2_ang_sum

gkMyo3_4_ang_sum	init		0
kan			OSClisten		giCMserver, "/myo/3_4/euler/ang_sum", "f", gkMyo3_4_ang_sum

; NGIMU sensors Euler angles --------------------------------------
gkNGIMU1_Eul[]	init		3
gkNGIMU1_Eul	OSClistenArray	giCMserver, "/ngimu/1/euler", "fff"

gkNGIMU2_Eul[]	init		3
gkNGIMU2_Eul	OSClistenArray	giCMserver, "/ngimu/2/euler", "fff"

gkNGIMU3_Eul[]	init		3
gkNGIMU3_Eul	OSClistenArray	giCMserver, "/ngimu/3/euler", "fff"

; NGIMU sensors IMU data--------------------------------------
gkNGIMU1_IMU[]	init		10
gkNGIMU1_IMU	OSClistenArray	giCMserver, "/ngimu/1/sensors", "ffffffffff"
gkNGIMU1_gyro[]	init		3
gkNGIMU1_gyro[]	slicearray	gkNGIMU1_IMU, 0, 2
gkNGIMU1_mags[]	OSClistenArray	giCMserver, "/ngimu/1/magnitudes", "fff"

gkNGIMU2_IMU[]	init		10
gkNGIMU2_IMU	OSClistenArray	giCMserver, "/ngimu/2/sensors", "ffffffffff"
gkNGIMU2_gyro[]	init		3
gkNGIMU2_gyro[]	slicearray	gkNGIMU2_IMU, 0, 2
gkNGIMU2_mags[]	OSClistenArray	giCMserver, "/ngimu/2/magnitudes", "fff"
;gkNGIMU2_Acc_int	=	gkNGIMU2_mags[1]

gkNGIMU3_IMU[]	init		10
gkNGIMU3_IMU	OSClistenArray	giCMserver, "/ngimu/3/sensors", "ffffffffff"
gkNGIMU3_gyro[]	init		3
gkNGIMU3_gyro[]	slicearray	gkNGIMU3_IMU, 0, 2
gkNGIMU3_mags[]	OSClistenArray	giCMserver, "/ngimu/3/magnitudes", "fff"

; NGIMU sensors gyro based intensity--------------------------
;gkNGIMU1_Int	init		0
;kans			OSClisten		giCMserver, "/ngimu/1/imu/int", "f", gkNGIMU1_Int
;
;gkNGIMU2_Int	init		0
;kans			OSClisten		giCMserver, "/ngimu/2/imu/int", "f", gkNGIMU2_Int
;
;gkNGIMU3_Int	init		0
;kans			OSClisten		giCMserver, "/ngimu/3/imu/int", "f", gkNGIMU3_Int

;printk2		gkNGIMU3_Int

iArrLen	lenarray	gkMyo1_EMG_bf

; Do filtering on EMG array
kHalfTime	=		0.02
kMyo_EMG_po[]	Portk_array		gkMyo1_EMG_bf, kHalfTime


endin

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
			MAPPING SECTION
Sensor 0: MC/EC
Sensor 1: Myo 1
Sensor 2: Myo 2
Sensor 3: Myo 3
Sensor 4: Myo 4
Sensor 5: NGIMU 1
Sensor 6: NGIMU 2
Sensor 7: NGIMU 3

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

;gkIntensity		init		0
;gkVariation[]	fillarray	0, 0
;gkModulation[]	fillarray	0, 0, 0, 0.5, 0
;gkTransp		init		1
;gkTimbre[]		fillarray	0, 0, 0, 1
;gkPlacement[]	fillarray	90, 0, 1, 0

gkMetroCps		init		32			; Init at 120 BPM
gkTempoMod		init		0
gkNudge		init		0
gkTempoMod		+=		gkNudge
kTempo		wrap		(gkMetroCps + gkTempoMod), 12, 48
gkMetro		metro		kTempo

;gkSensor_Sounds[][]	init		7, 16
; NB: Will segfault if using a higher sound number than what is in the folder

;; 									Myo	oct	pch1	obj	relT
;event_i		"i", "Myo_MultiSine", 0, $ALWAYSON, 1, 	5,	0,	0,	4	; Tone
;event_i		"i", "Myo_MultiSine", 0, $ALWAYSON, 4, 	7,	0,	1,	4	; Elen

;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 3, 	5,	2,	0,	4	; Luis
;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 2, 	6,	7,	1,	4	; Arnhild

;									Myo	Snd	Pan	Obj					
event_i		"i", "Myo_minctracer", 0, $ALWAYSON, 3, 	2, 	0.1, 	1	; Elen
event_i		"i", "Myo_minctracer", 0, $ALWAYSON, 2, 	1, 	0.9,  1	; Tone
event_i		"i", "Myo_minctracer", 0, $ALWAYSON, 1, 	0, 	0.1, 	1	; Arnhild

;event_i		"i", "Myo_MultiSine", 0, $ALWAYSON, 2, 	6,	0,	0,	4	; Tone	
;event_i		"i", "Myo_MultiSine", 0, $ALWAYSON, 3, 	6,	5,	1,	4	; Arnhild
;event_i		"i", "Myo_MultiSine", 0, $ALWAYSON, 1, 	6,	5,	1,	4	; Tone

; 									Snsr	oct	pch	plz1	plz2		AmpFltHP 	plz=pulse(subdiv)
event_i		"i", "Flexi_Pulzer", 0, $ALWAYSON, 	7, 	8,	2,	6,	7,		0.5		; 
; 									Snsr
event_i		"i", "NGIMU_Noizer", 0, $ALWAYSON, 	5
event_i		"i", "NGIMU_Noizer", 0, $ALWAYSON, 	6


;									Myo	oct	pch1	pch2	Obj	AmpFltHP
;event_i		"i", "Myo_SquineWave", 0, $ALWAYSON, 3, 	6,	0,	0,	0,	5		; Arnhild
;event_i		"i", "Myo_SquineWave", 0, $ALWAYSON, 1, 	6,	7,	12,	1,	20
;event_i		"i", "Myo_SquineWave", 0, $ALWAYSON, 2, 	7,	2,	11,	0,	5		; Arnhild
;event_i		"i", "Myo_SquineWave", 0, $ALWAYSON, 4, 	6,	8,	9,	1,	2



;; 									Myo	oct	pch1	obj	relT
;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 3, 	5,	0,	0,	4	; Arnhild
;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 1, 	6,	7,	1,	4	; Elen
;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 3, 	5,	0,	0,	4	; Luis	
;event_i		"i", "Myo_WarbleSine", 0, $ALWAYSON, 2, 	6,	0,	1,	4	; Tone
;event_i		"i", "FlexiWarbleSine", 0, $ALWAYSON, 2, 	6,	0,	1,	4	; Tone

; 									Snsr	oct	pch	plz1	plz2		AmpFltHP 	plz=pulse(subdiv)
;event_i		"i", "Flexi_Pulzer", 0, $ALWAYSON, 	5, 	8,	2,	6,	7,		0.5

; 									Snsr
;event_i		"i", "NGIMU_Noizer", 0, $ALWAYSON, 	6
;event_i		"i", "NGIMU_Noizer", 0, $ALWAYSON, 	7

; 									Snsr	obj	AmpFltHP
;event_i		"i", "Myo_MultiVoice", 0, $ALWAYSON, 4

			endin

;/////////////////////////////////////////////////////////////////////////////////////////////////
;		INCLUDE INSTRUMENTS HERE
#include	"Inc/Myo_minctracer.inc"
#include	"Inc/Myo_SquineWave.inc"
#include	"Inc/Myo_MultiSine.inc"
#include	"Inc/Myo_WarbleSine.inc"
#include	"Inc/Flexi_Pulzer.inc"
;#include	"Inc/Flexi_WarbleSine.inc"
#include	"Inc/Myo_MultiVoice.inc"
#include	"Inc/NGIMU_Noizer.inc"
;/////////////////////////////////////////////////////////////////////////////////////////////////

;*******************************************************************************
;		Mixer/route/send instrument
;*******************************************************************************
		instr		1000
;chnset	gaSend[0], "Object1"
;chnset	gaSend[1], "Object2"
;chnset	gaSend[2], "Object3"
;chnset	gaSend[3], "Object4"
;chnset	gaSend[4], "Object5"
;chnset	gaSend[5], "Object6"
;chnset	gaSend[6], "Object7"
;chnset	gaSend[7], "Object8"
;
;chnset	gkAzi[0], "Azi1"
;chnset	gkAzi[1], "Azi2"
;chnset	gkAzi[2], "Azi3"
;chnset	gkAzi[3], "Azi4"
;chnset	gkAzi[4], "Azi5"
;chnset	gkAzi[5], "Azi6"
;chnset	gkAzi[6], "Azi7"
;chnset	gkAzi[7], "Azi8"
;
;chnset	gkDist[0], "Dist1"
;chnset	gkDist[1], "Dist2"
;chnset	gkDist[2], "Dist3"
;chnset	gkDist[3], "Dist4"
;chnset	gkDist[4], "Dist5"
;chnset	gkDist[5], "Dist6"
;chnset	gkDist[6], "Dist7"
;chnset	gkDist[7], "Dist8"
;
;chnset	gkSpread[0], "Spread1"
;chnset	gkSpread[1], "Spread2"
;chnset	gkSpread[2], "Spread3"
;chnset	gkSpread[3], "Spread4"
;chnset	gkSpread[4], "Spread5"
;chnset	gkSpread[5], "Spread6"
;chnset	gkSpread[6], "Spread7"
;chnset	gkSpread[7], "Spread8"
;
;outs(oscil(0.1,440),(oscil(0.1,330)))
iRevMix		=		0.33
arevL, arevR	reverbsc	gaSend[0], gaSend[1], 0.85, 11000, 44100, 1.5
iDryMix		=		1 - iRevMix

aMixL			=		gaSend[0] * iDryMix + arevL * iRevMix
aMixR			=		gaSend[1] * iDryMix + arevR * iRevMix

			outs		aMixL , aMixR

gaSend[0]	=		0
gaSend[1]	=		0
gaSend[2]	=		0
gaSend[3]	=		0
gaSend[4]	=		0
gaSend[5]	=		0
gaSend[6]	=		0
gaSend[7]	=		0

		endin





</CsInstruments>

<CsScore>
#define	ALWAYSON	#999999#

i1		0		$ALWAYSON
i2		0		$ALWAYSON

i "Launcher"		0		$ALWAYSON

i1000		0		$ALWAYSON
;i3		0		120


</CsScore>

</CsoundSynthesizer>
;[winxound_bookmarks,124,176,209]