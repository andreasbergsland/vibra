<CsoundSynthesizer>
<CsOptions>
-odac1 -b128 -B256 -m0 -d -M3 ;--realtime
</CsOptions>

<CsInstruments>

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
;#include		"Inc/MaxSndChnls.inc"

; Set to 0 when running whole VIBRA setup, for testing with single sensors, set to 1
gkTesting		init			0


; Initiate python
		pyinit

/*_____________________________________________________________________________________________
 INITIATE OSC PORTS FOR COMMUNICATION WITH CONTROL (CM) MODULES
*/
giMainPort	=			7000
giCMserver	OSCinit		giMainPort
giCMserver2	OSCinit		5432			; Port for sending data from 4th armband to Sigurd
giMyoTest	OSCinit		5431
giMax		OSCinit		3000			; From Max

giNGIMU4	OSCinit		8001

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
;#include "/Users/andber/Particles/MC3.0/Inc/Udo/GetFolderNames.udo"

;#include "/Users/andber/Particles/MC3.0/Inc/Udo/ReadAndSortFiles.udo"

#include "/Users/andber/Particles/MC3.0/Inc/Udo/Metro_a.udo"

#include "Inc/Onsets_k.udo"

#include "Inc/OSClistenArray.udo"

#include "Inc/Portk_array.udo"

#include "Inc/MapTab_array.udo"

#include "Inc/EMGwarbler_array.udo"

#include "Inc/Accel_intensity.udo"

#include "Inc/Spatialize.udo"

#include "Inc/Delta_array.udo"

#include "Inc/MultiMetro.udo"

#include "Inc/MultiFiltk_array.udo"

		seed		0

giSine	ftgen		0, 0, 2^18, 10, 1
giFadePart  ftgen		0, 0, 1024, 5, 1, 400, 0.05, 624, 0.000001
giMaxAmps	ftgen		0, 0, 256, -7, 0
giMaxFrqs	ftgen		0, 0, 256, -7, 0

giIR_maxlen	=	8192*4	; Just over a second
giIR_record 	ftgen 	0, 0, giIR_maxlen, 2, 1, 0

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
SFiles[]	directory	"/Users/andber/Desktop/VIBRA/Teknisk/Test", ".wav"
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
;giCategories[][]	init			iNumCats, 30	; Use 7 categories: Kunst, Musikk, Nyheter, rePortasje, Reklame, Show og Utenriks
;									; each with space for 30 ftable numbers
;indxcat			=		0
;indxftnums			=		1
;indx2				=		0	; Index to iterate through the array
;SLastCat			strcpy		""			; initiate as empty string
;countmembers:
;    SCategory		strsub		SFiles[indx2], 58, 59
;    iCompare		strcmp		SCategory, SLastCat
;    if	indx2 == giNumFiles-1		then
;        giCategories[indxcat][0]=		indxftnums
;    elseif	iCompare 	!= 0	&& indx2 != 0	then		; When current is different from last...
;        giCategories[indxcat][0]=		indxftnums-1      ; write the number of members in the category to the first index
;        indxcat		+=			1			; change category....
;        indxftnums	=			1			; and reset index for ftable numbers
;    endif
;    giCategories[indxcat][indxftnums] =	giTabNums[indx2]
;;    print indxcat, indxftnums, giTabNums[indx2]
;    SLastCat		strcpy		SCategory
;    indxftnums		+=			1
;loop_lt	indx2, 1, giNumFiles, countmembers
;
;if	gkTesting == 1	goto contin
; Send message to connect to server
;kTrig		init		1
;		OSCsend	kTrig, "192.168.1.39", 32000, "/vibra/connect", "si", "192.168.1.40", giMainPort
;kTrig		=		0
;-------------------------------------------------------------------------------
contin:
endin

	instr 	2

; Get volum controls from Max
iStartVol		=			-15
gkVolumMyo1		init			iStartVol
gkVolumMyo2		init			iStartVol
gkVolumMyo3		init			iStartVol
gkVolumMyo4		init			iStartVol
gkVolumNGIMU1	init			iStartVol
gkVolumNGIMU2	init			iStartVol
gkVolumNGIMU3	init			iStartVol
gkVolumNGIMU4	init			iStartVol

kans			OSClisten		giMax, "/myo/1/volume", "f", gkVolumMyo1
kans			OSClisten		giMax, "/myo/2/volume", "f", gkVolumMyo2
kans			OSClisten		giMax, "/myo/3/volume", "f", gkVolumMyo3
kans			OSClisten		giMax, "/myo/4/volume", "f", gkVolumMyo4
kans			OSClisten		giMax, "/ngimu/1/volume", "f", gkVolumNGIMU1
kans			OSClisten		giMax, "/ngimu/2/volume", "f", gkVolumNGIMU2
kans			OSClisten		giMax, "/ngimu/3/volume", "f", gkVolumNGIMU3
kans			OSClisten		giMax, "/ngimu/4/volume", "f", gkVolumNGIMU4

gkVolume[]		init			8
gkVolume[0]		=			ampdb(gkVolumMyo1)
gkVolume[1]		=			ampdb(gkVolumMyo2)
gkVolume[2]		=			ampdb(gkVolumMyo3)
gkVolume[3]		=			ampdb(gkVolumMyo4)
gkVolume[4]		=			ampdb(gkVolumNGIMU1)
gkVolume[5]		=			ampdb(gkVolumNGIMU2)
gkVolume[6]		=			ampdb(gkVolumNGIMU3)
gkVolume[7]		=			ampdb(gkVolumNGIMU4)

; Myo armbands - raw IMU data-----------------------------------------------------
gkMyo1_EMG[]	init			8
gkMyo1_EMG		OSClistenArray	giMax, "/myo/1/emg/bfilt", "ffffffff"
gkMyo1_EMG_port[]	init			8
gkMyo1_EMG_port	MultiFiltk_array	gkMyo1_EMG, 0.12

gkMyo1_IMU[]	init			10
gkMyo1_IMU		OSClistenArray	giMax, "/myo/1/imu/raw", "ffffffffff"


gkMyo2_EMG[]	init			8
gkMyo2_EMG		OSClistenArray	giMax, "/myo/2/emg/bfilt", "ffffffff"
gkMyo2_EMG_port[]	init			8
gkMyo2_EMG_port	MultiFiltk_array	gkMyo2_EMG, 0.12


gkMyo2_IMU[]	init			10
gkMyo2_IMU		OSClistenArray	giMax, "/myo/2/imu/raw", "ffffffffff"


; Myo armbands - relative data-------------------------------------------------------------
;; Angular difference - when armbands turn different ways => positive, opposite ways => negative
;gkMyo1_2_ang_diff	init		0
;kan			OSClisten		giCMserver, "/myo/1_2/euler/ang_diff", "f", gkMyo1_2_ang_diff
;
;gkMyo3_4_ang_diff	init		0
;kan			OSClisten		giCMserver, "/myo/1_2/euler/ang_diff", "f", gkMyo3_4_ang_diff
;
;; Angular sum - when armbands turn same ways left => high positive values, same ways right => high negative values
;gkMyo1_2_ang_sum	init		0
;kan			OSClisten		giCMserver, "/myo/3_4/euler/ang_sum", "f", gkMyo1_2_ang_sum
;
;gkMyo3_4_ang_sum	init		0
;kan			OSClisten		giCMserver, "/myo/3_4/euler/ang_sum", "f", gkMyo3_4_ang_sum
;

; NGIMU sensors Euler angles --------------------------------------
gkNGIMU1_Eul[]	init		3
gkNGIMU1_Eul	OSClistenArray	giMax, "/NGIMU1/Euler", "fff"

gkNGIMU2_Eul[]	init		3
gkNGIMU2_Eul	OSClistenArray	giMax, "/NGIMU2/Euler", "fff"

gkNGIMU3_Eul[]	init		3
gkNGIMU3_Eul	OSClistenArray	giMax, "/NGIMU3/Euler", "fff"



; NGIMU quaternions
gkNGIMU1_Quats[]	init		4
gkNGIMU1_Quats	OSClistenArray	giMax, "/NGIMU1/Quats", "ffff"

gkNGIMU2_Quats[]	init		4
gkNGIMU2_Quats	OSClistenArray	giMax, "/NGIMU2/Quats", "ffff"

gkNGIMU3_Quats[]	init		4
gkNGIMU3_Quats	OSClistenArray	giMax, "/NGIMU3/Quats", "ffff"



gkNGIMU1_DQuats[]	init		4
gkNGIMU1_DQuats	OSClistenArray	giMax, "/NGIMU1/DeltaQuat", "fffff"

gkNGIMU2_DQuats[]	init		4
gkNGIMU2_DQuats	OSClistenArray	giMax, "/NGIMU2/DeltaQuat", "fffff"

gkNGIMU3_DQuats[]	init		4
gkNGIMU3_DQuats	OSClistenArray	giMax, "/NGIMU3/DeltaQuat", "fffff"

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

; NGIMU sensors IMU data--------------------------------------
;gkNGIMU1_IMU[]	init		10
;gkNGIMU1_IMU	OSClistenArray	giCMserver, "/ngimu/1/sensors", "ffffffffff"
;gkNGIMU1_gyro[]	init		3
;gkNGIMU1_gyro[]	slicearray	gkNGIMU1_IMU, 0, 2
;gkNGIMU1_mags[]	OSClistenArray	giCMserver, "/ngimu/1/magnitudes", "fff"
;gkNGIMU1_acc[]	init		3
;gkNGIMU1_acc[]	slicearray	gkNGIMU1_IMU, 3, 5
;gkNGIMU1_aInts[]	init		3
;gkNGIMU1_aInts, gkNGIMU1_aInt	Accel_intensity	gkNGIMU1_acc
;
;
;gkNGIMU2_IMU[]	init		10
;gkNGIMU2_IMU	OSClistenArray	giCMserver, "/ngimu/2/sensors", "ffffffffff"
;gkNGIMU2_gyro[]	init		3
;gkNGIMU2_gyro[]	slicearray	gkNGIMU2_IMU, 0, 2
;gkNGIMU2_mags[]	OSClistenArray	giCMserver, "/ngimu/2/magnitudes", "fff"
;gkNGIMU2_acc[]	init		3
;gkNGIMU2_acc[]	slicearray	gkNGIMU2_IMU, 3, 5
;gkNGIMU2_aInts[]	init		3
;gkNGIMU2_aInts, gkNGIMU2_aInt	Accel_intensity	gkNGIMU2_acc
;
;gkNGIMU3_IMU[]	init		10
;gkNGIMU3_IMU	OSClistenArray	giCMserver, "/ngimu/3/sensors", "ffffffffff"
;gkNGIMU3_gyro[]	init		3
;gkNGIMU3_gyro[]	slicearray	gkNGIMU3_IMU, 0, 2
;gkNGIMU3_mags[]	OSClistenArray	giCMserver, "/ngimu/3/magnitudes", "fff"
;gkNGIMU3_acc[]	init		3
;gkNGIMU3_acc[]	slicearray	gkNGIMU3_IMU, 3, 5
;gkNGIMU3_aInts[]	init		3
;gkNGIMU3_aInts, gkNGIMU3_aInt	Accel_intensity	gkNGIMU3_acc
;
;gkNGIMU4_IMU[]	init		10
;if gkTesting	==	1	then
;gkNGIMU4_IMU	OSClistenArray	giNGIMU4, "/sensors", "ffffffffff"
;else
;gkNGIMU4_IMU	OSClistenArray	giCMserver, "/ngimu/4/sensors", "ffffffffff"
;endif
;gkNGIMU4_gyro[]	init		3
;gkNGIMU4_gyro[]	slicearray	gkNGIMU4_IMU, 0, 2
;gkNGIMU4_mags[]	OSClistenArray	giCMserver, "/ngimu/4/magnitudes", "fff"
;gkNGIMU4_acc[]	init		3
;gkNGIMU4_acc[]	slicearray	gkNGIMU4_IMU, 3, 5
;gkNGIMU4_aInts[]	init		3
;gkNGIMU4_aInts, gkNGIMU4_aInt	Accel_intensity	gkNGIMU4_acc

;if	gkTesting == 1	then
;gkNGIMU4_mags[]	OSClistenArray	giNGIMU4, "/magnitudes", "fff"
;endif
;printk	0.25, gkNGIMU4_mags[0]

;gkNGIMU4_acc[]	init		3
;gkNGIMU4_acc	slicearray	gkNGIMU4_IMU, 3, 5
;gkNGIMU4_ints[]	init		3
;gkNGIMU4_ints, gkNGIMU4_int	Accel_intensity	gkNGIMU4_acc


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
prints	"Launcher launched\n"

; Control messages from VIBRA mixer in Max running locally------------------------
kp1,kp3, kVariant	init		1
kSensor		init		1
kXfade		init		3
k_instrig		OSClisten		giMax, "/instrument", "iifif", kSensor, kp1, kp3,kVariant, kXfade
kInsnum		=		kp1 + 4 + 0.1*kSensor


kTrigStart		ctrl7		2, 32, 0, 1
schedkwhen	kTrigStart, 0, 1, 20, 0, 3600, 0

if	trigger:k(kTrigStart,0.5,1)==1	then
turnoff2	20, 0, 1
event	"i", 21, 0, 12
event	"i", 20, 12, 200, 1 
endif

kTrigStop		ctrl7		2, 36, 0, 1
if	changed:k(kTrigStop)==1	then
turnoff2	20, 0, 1
endif

; Control sound instruments (turn on/off)
if	k_instrig == 1 && kp3 == 1	then
; Turn them on					p4		p5	p6
event	"i", kInsnum , 0, kp3 * $ALWAYSON, kSensor, kVariant, kXfade
elseif k_instrig == 1 && kp3 == -1	then
; or turn them off
turnoff2	kInsnum, 4, 1
endif

gkMetroCps		init		32			; Init at 120 BPM
gkTempoMod		init		0
gkNudge		init		0
gkTempoMod		+=		gkNudge
kTempo		wrap		(gkMetroCps + gkTempoMod), 12, 48
gaMetro, gkMetro 	Metro_a	kTempo
gkMultiMetro[]	init		8
gkMultiMetro[0]	MultiMetro	kTempo, 32
gkMultiMetro[1]	MultiMetro	kTempo, 24
gkMultiMetro[2]	MultiMetro	kTempo, 16
gkMultiMetro[3]	MultiMetro	kTempo, 12
gkMultiMetro[4]	MultiMetro	kTempo, 8
gkMultiMetro[5]	MultiMetro	kTempo, 6
gkMultiMetro[6]	MultiMetro	kTempo, 4
gkMultiMetro[7]	MultiMetro	kTempo, 3


			endin

;/////////////////////////////////////////////////////////////////////////////////////////////////
;		INCLUDE INSTRUMENTS HERE
;#include	"Inc/Myo_minctracer.inc"	; instr 4
;#include	"Inc/Myo_SquineWave.inc"	; instr 5
;#include	"Inc/Myo_MultiSine.inc"		; instr 6
;#include	"Inc/Myo_WarbleSine.inc"	; instr 7
;#include	"Inc/Myo_MultiVoice.inc"	; instr 8
;#include	"Inc/NGIMU_Noizer.inc"		; instr 9
;;
;#include 	"Inc/FlexiPulzer.inc"		; instr 10
;;#include	"Inc/Flexi_WarbleSine.inc"
;#include 	"Inc/Flexi_BippAChu.inc"	; instr 11
;#include	"Inc/Flexi_Flow.inc";		; instr 12
;
;#include	"Inc/PulzerTone.inc"

; Section 1 instrument
instr		20
print	p1
krandrate	linseg	0, 20, 0, 60, 8
if	p4 == 0	then
kfadeout	cossegr	1, p3, 1, 1, 0
; Use this for first section
ktab1		=		1
ktab2		=		2
ktab3		=		3
ktab4		=		4
ktab5		=		5
ktab6		=		6
ktab7		=		7
ktab8		=		8
koffset1	=		0
koffset2	=		0
koffset3	=		0
koffset4	=		0
koffset5	=		0
koffset6	=		0
koffset7	=		0
koffset8	=		0
kproceed		cosseg	1, 10, 1, 10, 1.1, 10, 1.4, 10, 1.8, 10, 2.6
kfadeexp	=		1
else
; Use this for second section
kfadeexp		expsegr	1, p3, 1, 1, 5
kfadeout	=		1
ktab1		=		20
ktab2		=		22
ktab3		=		23
ktab4		=		24
ktab5		=		25
ktab6		=		26
ktab7		=		27
ktab8		=		28

ktab11	=		30
ktab12	=		31
ktab13	=		32
ktab14	=		33
ktab15	=		34
ktab16	=		35
ktab17	=		36
ktab18	=		37

koffset1	randomh	0.4, 20, 1+krandrate
koffset2	randomh	0.4, 20, 0.9 +krandrate	
koffset3	randomh	0.4, 20, 1.1	+krandrate	
koffset4	randomh	0.4, 20, 1.2	+krandrate	
koffset5	randomh	0.4, 20, 1.3	+krandrate	
koffset6	randomh	0.4, 20, 1.4	+krandrate	
koffset7	randomh	0.4, 20, 1.5	+krandrate	
koffset8	randomh	0.4, 20, 1.6	+krandrate	
kproceed		cosseg	1, 10, 1, 10, 1.1, 10, 1.4, 10, 1.8, 10, 12.6
endif



iscrubtab		ftgen		0, 0, 1024, 7, 0, 256, 0, 256, 0.5, 512, 1
kscrubseg		table		(gkNGIMU1_Eul[0]-45)/90, iscrubtab, 1

ascrub1		=		a(wrap(kscrubseg, 0, 1))

atimp1		=		koffset1+0.992 + ascrub1 * 0.076 * kproceed
atimp2		=		koffset2+0.621 + ascrub1* 0.123 * kproceed
atimp3		=		koffset3+0.672 + ascrub1 * 0.227 * kproceed
atimp4		=		koffset4+0.591 + ascrub1* 0.132 * kproceed
atimp5		=		koffset5+0.712 + ascrub1 * 0.121 * kproceed
atimp6		=		koffset6+1.210 + ascrub1 * 0.148 * kproceed
atimp7		=		koffset7+1.100 + ascrub1 * 0.143 * kproceed
atimp8		=		koffset8+0.762 + ascrub1* 0.089 * kproceed

ascrub2		=		a(gkNGIMU2_Eul[0]-45)/90

atimp11		=		koffset1+0.0900 + ascrub2 * 0.175 * kproceed
atimp12		=		koffset2+0.911 + ascrub2 * 0.177 * kproceed
atimp13		=		koffset3+0.822 + ascrub2 * 0.126 * kproceed
atimp14		=		koffset4+0.882 + ascrub2 * 0.157 * kproceed
atimp15		=		koffset5+0.876 + ascrub2* 0.232 * kproceed; Albanian 5
atimp16		=		koffset6+0.712 + ascrub2 * 0.193 * kproceed; Albanian 6
atimp17		=		koffset7+0.882 + ascrub2 * 0.212 * kproceed
atimp18		=		koffset8+1.270 + ascrub2 * 0.189 * kproceed

kPitch1		rspline	0.998, 1.002, 2, 5
kPitch2		rspline	0.999, 1.001, 2.1, 4.9

kfade1		cosseg	0, 4, 0, 4, 1
kfade2		cosseg	0, 8, 0, 4, 1
kfade3		cosseg	0, 12, 0, 4, 1
kfade4		cosseg	0, 16, 0, 4, 1
kfade5		cosseg	0, 20, 0, 4, 1
kfade6		cosseg	0, 24, 0, 4, 1
kfade7		cosseg	0, 30, 0, 4, 1

aVowel0		mincer	atimp1, gkMyo1_EMG_port[0], kPitch1, giTabNums[0], 1
aVowel1		mincer	atimp2, gkMyo1_EMG_port[1]*kfade1, kPitch1, giTabNums[ktab1], 1
aVowel2		mincer	atimp3, gkMyo1_EMG_port[2]*kfade2, kPitch2, giTabNums[ktab2], 1
aVowel3		mincer	atimp4, gkMyo1_EMG_port[3]*kfade3, kPitch2, giTabNums[ktab3], 1
aVowel4		mincer	atimp5, gkMyo1_EMG_port[4]*kfade4, kPitch1, giTabNums[ktab4], 1
aVowel5		mincer	atimp6, gkMyo1_EMG_port[5]*kfade5, kPitch1, giTabNums[ktab5], 1
aVowel6		mincer	atimp7, gkMyo1_EMG_port[6]*kfade6, kPitch2, giTabNums[ktab6], 1
aVowel7		mincer	atimp8, gkMyo1_EMG_port[7]*kfade7, kPitch2, giTabNums[ktab7], 1

aVowel10		mincer	atimp11, gkMyo2_EMG_port[0], kPitch1, giTabNums[ktab11], 1
aVowel11		mincer	atimp12, gkMyo2_EMG_port[1]*kfade1, kPitch1, giTabNums[ktab12], 1
aVowel12		mincer	atimp13, gkMyo2_EMG_port[2]*kfade2, kPitch2, giTabNums[ktab13], 1
aVowel13		mincer	atimp14, gkMyo2_EMG_port[3]*kfade3, kPitch2, giTabNums[ktab14], 1
aVowel14		mincer	atimp15, gkMyo2_EMG_port[4]*kfade4, kPitch1, giTabNums[ktab15], 1
aVowel15		mincer	atimp16, gkMyo2_EMG_port[5]*kfade5, kPitch1, giTabNums[ktab16], 1
aVowel16		mincer	atimp17, gkMyo2_EMG_port[6]*kfade6, kPitch2, giTabNums[ktab17], 1
aVowel17		mincer	atimp18, gkMyo2_EMG_port[7]*kfade7, kPitch2, giTabNums[ktab18], 1

aChordL		sum	aVowel0,  aVowel1,  aVowel2,  aVowel3, aVowel4, aVowel5, aVowel6, aVowel7
aChordR		sum	aVowel10, aVowel11, aVowel12, aVowel13, aVowel14, aVowel15, aVowel16, aVowel17

;acombL	comb		aChordL, 1, 0.2
;acombR	comb		aChordR, 1, 0.21





arevL, arevR	reverbsc	aChordL*kfadeout, aChordR*kfadeout, 0.88, 9000, sr, 1.4
outch(1, aChordL*0.5*kfadeout*kfadeexp+arevL*0.25*kfadeout*kfadeexp) 
outch(2, aChordR*0.5*kfadeout*kfadeexp+arevR*0.25*kfadeout*kfadeexp) 

endin

;********************************************
instr		21
print	p1
kproceed		=		1	;cosseg	1, 10, 1, 10, 1.1, 10, 1.4, 10, 1.8, 10, 2.6

;iscrubtab		ftgen		0, 0, 1024, 7, 0, 256, 0, 256, 0.5, 512, 1
;kscrubseg		table		(gkNGIMU1_DQuat[0]+gkNGIMU1_DQuat[1]+gkNGIMU1_DQuat[2])*0.00001
;printk2	kscrubseg

;kIntensity1		=		

kscrub1		init		0
kscrub1		linseg	-0.25, 1.6, 1.3		;+=		(abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[2])) * 0.003
ascrub1		=		a(kscrub1)
kamp1			=	abs((gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[2]))* 5
kamp1			port		kamp1, 0.25
;kamp1			linseg	0.4, 1.6,0.4, .1, 0

kscrub2		init		0
kscrub2		linseg	-0.23, 1.6, -0.23, 1.4, 1
;kscrub2		+=		(abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[2])) * 0.003
ascrub2		=		a(kscrub2)
kamp2			=		1.8 * abs((gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[2]))* 5
kamp2			port			kamp2, 0.25
;printk2	kscrub2

ascrub1,ascrub2	init		0

atimp1		=		0.992 + ascrub1 * 0.076 * kproceed
atimp2		=		0.621 + ascrub1* 0.123 * kproceed
atimp3		=		0.672 + ascrub1 * 0.227 * kproceed
atimp4		=		0.591 + ascrub1* 0.132 * kproceed
atimp5		=		0.712 + ascrub1 * 0.121 * kproceed
atimp6		=		1.210 + ascrub1 * 0.148 * kproceed
atimp7		=		1.100 + ascrub1 * 0.143 * kproceed
atimp8		=		0.762 + ascrub1* 0.089 * kproceed

;ascrub2		=		a(gkNGIMU2_Eul[0]-45)/90

atimp11		=		1.000 + ascrub2 * 0.175 * kproceed
atimp12		=		1.011 + ascrub2 * 0.177 * kproceed
atimp13		=		0.922 + ascrub2 * 0.126 * kproceed
atimp14		=		0.982 + ascrub2 * 0.157 * kproceed
atimp15		=		0.976 + ascrub2* 0.232 * kproceed; Albanian 5
atimp16		=		0.812 + ascrub2 * 0.193 * kproceed; Albanian 6
atimp17		=		0.982 + ascrub2 * 0.212 * kproceed
atimp18		=		1.370 + ascrub2 * 0.189 * kproceed

kPitch1		rspline	0.998, 1.002, 2, 5
kPitch2		rspline	0.999, 1.001, 2.1, 4.9

kfade1		=		1;cosseg	0, 4, 0, 4, 1
kfade2		=		1;cosseg	0, 8, 0, 4, 1
kfade3		=		1;cosseg	0, 12, 0, 4, 1
kfade4		=		1;cosseg	0, 16, 0, 4, 1
kfade5		=		1;cosseg	0, 20, 0, 4, 1
kfade6		=		1;cosseg	0, 24, 0, 4, 1
kfade7		=		1;cosseg	0, 30, 0, 4, 1

aVowel0		mincer	atimp1, kamp1, kPitch1, giTabNums[0], 1
aVowel1		mincer	atimp2, kamp1, kPitch1, giTabNums[1], 1
aVowel2		mincer	atimp3, kamp1, kPitch2*0.88, giTabNums[2], 1
aVowel3		mincer	atimp4, kamp1, kPitch2*0.88, giTabNums[3], 1
aVowel4		mincer	atimp5, kamp1, kPitch1*0.92, giTabNums[4], 1
aVowel5		mincer	atimp6, kamp1, kPitch1*0.92, giTabNums[5], 1
aVowel6		mincer	atimp7, kamp1, kPitch2*1.12, giTabNums[6], 1
aVowel7		mincer	atimp8, kamp1, kPitch2*1.12, giTabNums[7], 1

aVowel10		mincer	atimp11, kamp2, kPitch1, giTabNums[8], 1
aVowel11		mincer	atimp12, kamp2, kPitch1, giTabNums[9], 1
aVowel12		mincer	atimp13, kamp2, kPitch2, giTabNums[10], 1
aVowel13		mincer	atimp14, kamp2, kPitch2, giTabNums[11], 1
aVowel14		mincer	atimp15, kamp2, kPitch1, giTabNums[12], 1
aVowel15		mincer	atimp16, kamp2, kPitch1, giTabNums[13], 1
aVowel16		mincer	atimp17, kamp2, kPitch2, giTabNums[14], 1
aVowel17		mincer	atimp18, kamp2, kPitch2, giTabNums[15], 1

aChordL		sum	aVowel0,  aVowel1,  aVowel2,  aVowel3, aVowel4, aVowel5, aVowel6, aVowel7
aChordR		sum	aVowel10, aVowel11, aVowel12, aVowel13, aVowel14, aVowel15, aVowel16, aVowel17

kfadeout		cosseg	1, p3-2, 1, 2, 0

arevL, arevR	reverbsc	aChordL*kfadeout, aChordR*kfadeout, 0.88, 9000, sr, 1.4
outch(1, aChordL*0.75*kfadeout+arevL*0.25*kfadeout)
outch(2, aChordR*0.75*kfadeout +arevR*0.25*kfadeout)

endin
;/////////////////////////////////////////////////////////////////////////////////////////////////

instr		22
print	p1
kproceed		cosseg	1, 10, 1, 10, 1.1, 10, 1.4, 10, 1.8, 10, 2.6

;iscrubtab		ftgen		0, 0, 1024, 7, 0, 256, 0, 256, 0.5, 512, 1
;kscrubseg		table		(gkNGIMU1_DQuat[0]+gkNGIMU1_DQuat[1]+gkNGIMU1_DQuat[2])*0.00001
;printk2	kscrubseg

;kIntensity1		=		

kscrub1		init		0
kscrub1		+=		(abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[2])) * 0.003
ascrub1		=		a(kscrub1)
kamp1			=		abs((gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[1])+abs(gkNGIMU1_DQuats[2]))* 5
;kamp1			linseg	0.4, 1.6,0.4, .1, 0


kscrub2		init		0
;kscrub2		linseg	-0.23, 1.6, -0.23, 1.4, 1
kscrub2		+=		(abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[2])) * 0.003
ascrub2		=		a(kscrub2)
kamp2			=		abs((gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[1])+abs(gkNGIMU2_DQuats[2]))* 5
;kamp2			linseg	0,1.6,0,.1,1,1.4,1
;printk2	kscrub2

kminrate		linseg	0, 60, 2
kmaxrate		linseg	4, 60, 13

kproceedArr[]	init		16
krandindx		=		int(rspline(0, 16.99, kminrate, kmaxrate))
imax			=		giNumFiles - 1
krandm		random	0, imax
kproceedArr[krandindx]	=		int(krandm)

atimp1		=		0.992 + ascrub1 * 0.076 + kproceedArr[0]
atimp2		=		0.621 + ascrub1* 0.123 + kproceedArr[1]
atimp3		=		0.672 + ascrub1 * 0.227 + kproceedArr[2]
atimp4		=		0.591 + ascrub1* 0.132 + kproceedArr[3]
atimp5		=		0.712 + ascrub1 * 0.121 + kproceedArr[4]
atimp6		=		1.210 + ascrub1 * 0.148 + kproceedArr[5]
atimp7		=		1.100 + ascrub1 * 0.143 + kproceedArr[6]
atimp8		=		0.762 + ascrub1* 0.089 + kproceedArr[7]

;ascrub2		=		a(gkNGIMU2_Eul[0]-45)/90

atimp11		=		1.000 + ascrub2 * 0.175 + kproceedArr[8]
atimp12		=		1.011 + ascrub2 * 0.177 + kproceedArr[9]
atimp13		=		0.922 + ascrub2 * 0.126 + kproceedArr[10]
atimp14		=		0.982 + ascrub2 * 0.157 + kproceedArr[11]
atimp15		=		0.976 + ascrub2* 0.232 + kproceedArr[12] 
atimp16		=		0.812 + ascrub2 * 0.193 + kproceedArr[13]
atimp17		=		0.982 + ascrub2 * 0.212 + kproceedArr[14]
atimp18		=		1.370 + ascrub2 * 0.189 + kproceedArr[15]

kPitch1		rspline	0.998, 1.002, 2, 5
kPitch2		rspline	0.999, 1.001, 2.1, 4.9

kfade1		=		1;cosseg	0, 4, 0, 4, 1
kfade2		=		1;cosseg	0, 8, 0, 4, 1
kfade3		=		1;cosseg	0, 12, 0, 4, 1
kfade4		=		1;cosseg	0, 16, 0, 4, 1
kfade5		=		1;cosseg	0, 20, 0, 4, 1
kfade6		=		1;cosseg	0, 24, 0, 4, 1
kfade7		=		1;cosseg	0, 30, 0, 4, 1

krand[]		init		16



krandindx		=		int(rspline(0, 16.99, kminrate, kmaxrate))
imax			=		giNumFiles - 1
krandm		random	0, imax
krand[krandindx]	=		int(krandm)

kind1			=		krand[0]
kind2			=		krand[1]
kind3			=		krand[2]
kind4			=		krand[3]
kind5			=		krand[4]
kind6			=		krand[5]
kind7			=		krand[6]
kind8			=		krand[7]
kind9			=		krand[8]
kind10			=		krand[9]
kind11			=		krand[10]
kind12			=		krand[11]
kind13			=		krand[12]
kind14			=		krand[13]
kind15			=		krand[14]
kind16			=		krand[15]

if	gkTesting == 1	then
gkMyo1_EMG_port[]	fillarray	0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2 
gkMyo2_EMG_port[]	fillarray	0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2
endif

krandfile		=		int(random:k(0, 150))

ktrig1		metro		5
schedkwhen		ktrig1, 0, 40, 23, 0, 0.5, krandfile
;aVowel0		mincer	atimp1, gkMyo1_EMG_port[0], kPitch1,      giTabNums[21], 1
;aVowel1		mincer	atimp2, gkMyo1_EMG_port[1], kPitch1,      giTabNums[22], 1
;aVowel2		mincer	atimp3, gkMyo1_EMG_port[2], kPitch2*0.88, giTabNums[23], 1
;aVowel3		mincer	atimp4, gkMyo1_EMG_port[3], kPitch2*0.88, giTabNums[24], 1
;aVowel4		mincer	atimp5, gkMyo1_EMG_port[4], kPitch1*0.92, giTabNums[25], 1
;aVowel5		mincer	atimp6, gkMyo1_EMG_port[5], kPitch1*0.92, giTabNums[26], 1
;aVowel6		mincer	atimp7, gkMyo1_EMG_port[6], kPitch2*1.12, giTabNums[27], 1
;aVowel7		mincer	atimp8, gkMyo1_EMG_port[7], kPitch2*1.12, giTabNums[28], 1

;aVowel10		lposcila	a(gkMyo1_EMG_port[0]),
;aVowel10		mincer	atimp11, gkMyo2_EMG_port[0], kPitch1, giTabNums[29], 1
;aVowel11		mincer	atimp12, gkMyo2_EMG_port[1], kPitch1, giTabNums[30], 1
;aVowel12		mincer	atimp13, gkMyo2_EMG_port[2], kPitch2, giTabNums[31], 1
;aVowel13		mincer	atimp14, gkMyo2_EMG_port[3], kPitch2, giTabNums[32], 1
;aVowel14		mincer	atimp15, gkMyo2_EMG_port[4], kPitch1, giTabNums[33], 1
;aVowel15		mincer	atimp16, gkMyo2_EMG_port[5], kPitch1, giTabNums[34], 1
;aVowel16		mincer	atimp17, gkMyo2_EMG_port[6], kPitch2, giTabNums[35], 1
;aVowel17		mincer	atimp18, gkMyo2_EMG_port[7], kPitch2, giTabNums[36], 1

;aChordL		sum	aVowel0;,  aVowel1,  aVowel2,  aVowel3, aVowel4, aVowel5;, aVowel6, aVowel7
;aChordR		sum	aVowel10;, aVowel11, aVowel12, aVowel13, aVowel14, aVowel15;, aVowel16, aVowel17
;
;kfadeexp		expsegr	1, p3, 1, 1, 5
;
;kglobalenv		linseg	0.05, 70, 1.5
;if	gkTesting == 1	then
;kglobalenv		=	1
;endif
;
;arevL, arevR	reverbsc	aChordL, aChordR, 0.8, 9000, sr, 1.4
;outch(1, aChordL*kfadeexp*kglobalenv+arevL*0.1*kglobalenv)
;outch(2, aChordR*kfadeexp*kglobalenv+arevR*0.1*kglobalenv)
endin





;*******************************************************************************
;		Create spatialization for all sensors
;*******************************************************************************
;#include	"Inc/Spatialization.inc"


;*******************************************************************************
;		Mixer/route/send instrument
;*******************************************************************************
		instr		1000



chnset	gkAzi[0], "azi1"
chnset	gkAzi[1], "azi2"
chnset	gkAzi[2], "azi3"
chnset	gkAzi[3], "azi4"
chnset	gkAzi[4], "azi5"
chnset	gkAzi[5], "azi6"
chnset	gkAzi[6], "azi7"
chnset	gkAzi[7], "azi8"
;
chnset	gkDist[0], "distance1"
chnset	gkDist[1], "distance2"
chnset	gkDist[2], "distance3"
chnset	gkDist[3], "distance4"
chnset	gkDist[4], "distance5"
chnset	gkDist[5], "distance6"
chnset	gkDist[6], "distance7"
chnset	gkDist[7], "distance8"
;
chnset	gkSpread[0], "spread1"
chnset	gkSpread[1], "spread2"
chnset	gkSpread[2], "spread3"
chnset	gkSpread[3], "spread4"
chnset	gkSpread[4], "spread5"
chnset	gkSpread[5], "spread6"
chnset	gkSpread[6], "spread7"
chnset	gkSpread[7], "spread8"

;outo		gaSend[0], gaSend[1], gaSend[2], gaSend[3], gaSend[4], gaSend[5], gaSend[6], gaSend[7] 

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
;i22		0		60
;i500		0		$ALWAYSON
;i1000		0		$ALWAYSON

</CsScore>

</CsoundSynthesizer>
