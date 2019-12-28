<CsoundSynthesizer>
<CsOptions>
-odac1 -b256 -B512 -m0 -d ;--realtime
</CsOptions>

<CsInstruments>
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
giCMserver	OSCinit		54321
;giTMserver	OSCinit		16000

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



giSine	ftgen		0, 0, 2^18, 10, 1
giFadePart  ftgen		0, 0, 1024, 5, 1, 400, 0.05, 624, 0.000001
giMaxAmps	ftgen		0, 0, 256, -7, 0
giMaxFrqs	ftgen		0, 0, 256, -7, 0
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
SFiles[]	directory	"/Users/andber/Particles/Xternal/Particles_Pieces/FM/Longs", ".wav"
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
;-------------------------------------------------------------------------------

endin

	instr 	2
; Myo armbands - raw IMU data-----------------------------------------------------
gkMyo1_Imu[]	init		10
gkMyo1_Imu	OSClistenArray	giCMserver, "/myo/1/imu/raw", "ffffffffff"

gkMyo2_Imu[]	init		10
gkMyo2_Imu	OSClistenArray	giCMserver, "/myo/2/imu/raw", "ffffffffff"

gkMyo3_Imu[]	init		10
gkMyo3_Imu	OSClistenArray	giCMserver, "/myo/3/imu/raw", "ffffffffff"

gkMyo4_Imu[]	init		10
gkMyo4_Imu	OSClistenArray	giCMserver, "/myo/4/imu/raw", "ffffffffff"

; Myo armbands - IMU-based intensity----------------------------------------------
gkMyo1_Imu_int	int	0
kan			OSClisten		giCMserver, "/myo/1/imu/int", "f", gkMyo1_Imu_int
kMyo1_Imu_int	port			gkMyo1_Imu_int, 0.1

gkMyo2_Imu_int	int	0
kan			OSClisten		giCMserver, "/myo/2/imu/int", "f", gkMyo2_Imu_int

gkMyo3_Imu_int	int	0
kan			OSClisten		giCMserver, "/myo/3/imu/int", "f", gkMyo3_Imu_int
kMyo3_Imu_int	port			gkMyo3_Imu_int, 0.1

gkMyo4_Imu_int	int	0
kan			OSClisten		giCMserver, "/myo/4/imu/int", "f", gkMyo4_Imu_int

; Myo armbands - IMU-based euler calculations---------------------------------------
gkMyo1_euler[]	init		3
gkMyo1_euler	OSClistenArray	giCMserver, "/myo/1/imu/euler", "fff"

gkMyo2_euler[]	init		3
gkMyo2_euler	OSClistenArray	giCMserver, "/myo/2/imu/euler", "fff"

gkMyo3_euler[]	init		3
gkMyo3_euler	OSClistenArray	giCMserver, "/myo/3/imu/euler", "fff"

gkMyo4_euler[]	init		3
gkMyo4_euler	OSClistenArray	giCMserver, "/myo/4/imu/euler", "fff"

; Myo armbands - filtered EMG data--------------------------------------------
gkMyo1_EMG_bf[]	init		8
gkMyo1_EMG_bf	OSClistenArray	giCMserver, "/myo/1/emg/bfilt", "ffffffff"

gkMyo2_EMG_bf[]	init		8
gkMyo2_EMG_bf	OSClistenArray	giCMserver, "/myo/2/emg/bfilt", "ffffffff"

gkMyo3_EMG_bf[]	init		8
gkMyo3_EMG_bf	OSClistenArray	giCMserver, "/myo/3/emg/bfilt", "ffffffff"

gkMyo4_EMG_bf[]	init		8
gkMyo4_EMG_bf	OSClistenArray	giCMserver, "/myo/4/emg/bfilt", "ffffffff"

; Myo armbands - sum of filtered EMG data-------------------------------------
gkMyo1_EMG_sum	init		0
kan			OSClisten		giCMserver, "/myo/1/emg/bfilt/sum", "f", gkMyo1_EMG_sum
kMyo1_EMG_sum	port		gkMyo1_EMG_sum, 0.02

gkMyo2_EMG_sum	init		0
kan			OSClisten		giCMserver, "/myo/2/emg/bfilt/sum", "f", gkMyo2_EMG_sum

gkMyo3_EMG_sum	init		0
kan			OSClisten		giCMserver, "/myo/3/emg/bfilt/sum", "f", gkMyo3_EMG_sum
kMyo3_EMG_sum	port		gkMyo3_EMG_sum, 0.02

gkMyo4_EMG_sum	init		0
kan			OSClisten		giCMserver, "/myo/4/emg/bfilt/sum", "f", gkMyo4_EMG_sum

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
gkNGIMU1_IMU[]	init		9
gkNGIMU1_IMU	OSClistenArray	giCMserver, "/ngimu/1/imu/raw", "fffffffff"


gkNGIMU2_IMU[]	init		9
gkNGIMU2_IMU	OSClistenArray	giCMserver, "/ngimu/2/imu/raw", "fffffffff"

gkNGIMU3_IMU[]	init		9
gkNGIMU3_IMU	OSClistenArray	giCMserver, "/ngimu/3/imu/raw", "fffffffff"

; NGIMU sensors acceleration intensity--------------------------
gkNGIMU1_Int	init		0
kans			OSClisten		giCMserver, "/ngimu/1/imu/int", "f", gkNGIMU1_Int

gkNGIMU2_Int	init		0
kans			OSClisten		giCMserver, "/ngimu/2/imu/int", "f", gkNGIMU2_Int

gkNGIMU3_Int	init		0
kans			OSClisten		giCMserver, "/ngimu/3/imu/int", "f", gkNGIMU3_Int

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
One instrument establishes a mapping between one/two sensors and one instrument

Parameters for the sound playing instruments are general:
1. Energy articulation (intensity).
2. Sound variation (choice of sound segment: could control a. file index and b. skip time)
3. Modulation (could control, in decreasing order dependent on importance : a. rate, b. depth, 
							c. skew/dur of "grain", d.attack/decay factor, e.shape)
4. Pitch/transposition
5. Timbre (could control: a. brightness, b.noise/tone, c. dense/sparse, d. wide/narrow)
6. Placement (could control: a.panning/azimuth angle, b.distance, c. width, d.variation)
*/
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; Instrument for initializing global arrays and variables to store parameter values

			instr		10

gkIntensity		init		0
gkVariation[]	fillarray	0, 0
gkModulation[]	fillarray	0, 0, 0, 0, 0
gkTransp		init		1
gkTimbre[]		fillarray	0, 0, 0, 0
gkPlacement[]	fillarray	90, 0, 1, 0

			endin


;/////////////////////////////////////////////////////////////////////////////////////////////////
;			
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		11




			endin


			
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;		Sound playing instruments
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instr		3
iSnd		=	1
kSnd		=	16
iLen		=	giTabLengths[iSnd]
iFun		=	giTabNums[iSnd]
kFun		=	giTabNums[kSnd]
amp		=	0.2
kcps		=	1
kloop		=	4 * sr
kcps		=	1
;asnD		lposcila	amp, kcps, kloop, iLen, iFun

;klock		=	1
;ktimp		init		0
;ktimp		+=		0.6/kr
;atimp		=		a(ktimp)
;kamp		=		0.2
;asnd		mincer	atimp, kamp, kcps, kFun, klock


ifftsize	=		1024
ktimscal	=		0.5
fsig		pvstanal	ktimscal, 0.2, 1, kFun
iArrLen	=		ifftsize + 2
kSndArr[]	init		iArrLen

kMaxNum	=		10
kSndDur	=		0.5

kflag    	pvs2array 	kSndArr, fsig ;export data to array	

;if kflag has reported a new write action ...
knewflag 	changed   	kflag


;schedkwhen	kwrite, 0, 0, 4, 0, kSndDur

;aenv		follow2	a(kenvtrig), 0.001, 1
;kenv		downsamp	aenv

;ares 		adsynt2 	kenv, 1, iSine,  giMaxFrqs, giMaxAmps, 20
;		out 		ares , ares

;fres     pvsfromarray kSndArr ;read modified data back to fres
ftrace	pvstrace	fsig, 10
aout     	pvsynth   	ftrace	;and resynth
	outs		aout, aout
endin



</CsInstruments>

<CsScore>
i1		0		120
i2		0		120
i3		0		120
i10		0		$ALWAYSON
</CsScore>

</CsoundSynthesizer>