<CsoundSynthesizer>
<CsOptions>
-odac0 -b128 -B256
</CsOptions>

<CsInstruments>
;**************************************************************************************************
sr		=		44100	; Sample rate matches sound files
ksmps		=		32	; Samples per control period - gives a kr period of 1.33ms
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



;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;		Receive OSC-data from motion tracking system, cook/prepare global parameters
;		Manage sound sets 1 and 2 for one and two player modes
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



			instr		1

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

; Find onsets in EMG array
;idelt		=		1/kr
;irmsthresh	=		0.05
;iNoiseThrsh	=		0.01
;iDebounceTime =		0.3
;;
;kMyo1_EMG_os[0], krms, kend	Onsets_k	gkMyo1_EMG_bf[0], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[1], krms, kend	Onsets_k	gkMyo1_EMG_bf[1], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[2], krms, kend	Onsets_k	gkMyo1_EMG_bf[2], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[3], krms, kend	Onsets_k	gkMyo1_EMG_bf[3], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[4], krms, kend	Onsets_k	gkMyo1_EMG_bf[4], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[5], krms, kend	Onsets_k	gkMyo1_EMG_bf[5], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[6], krms, kend	Onsets_k	gkMyo1_EMG_bf[6], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;kMyo1_EMG_os[7], krms, kend	Onsets_k	gkMyo1_EMG_bf[7], idelt, irmsthresh, iNoiseThrsh, iDebounceTime
;
;kmint		=		0
;kmaxn		=		8
;kins		=		2
;kdur		=		2
;		schedkwhen	kMyo1_EMG_os[0], kmint, kmaxn, kins, 0, kdur, 1
;		schedkwhen	kMyo1_EMG_os[1], kmint, kmaxn, kins, 0, kdur, 2
;		schedkwhen	kMyo1_EMG_os[2], kmint, kmaxn, kins, 0, kdur, 3
;		schedkwhen	kMyo1_EMG_os[3], kmint, kmaxn, kins, 0, kdur, 4
;		schedkwhen	kMyo1_EMG_os[4], kmint, kmaxn, kins, 0, kdur, 5
;		schedkwhen	kMyo1_EMG_os[5], kmint, kmaxn, kins, 0, kdur, 6
;		schedkwhen	kMyo1_EMG_os[6], kmint, kmaxn, kins, 0, kdur, 7
;		schedkwhen	kMyo1_EMG_os[7], kmint, kmaxn, kins, 0, kdur, 8
ihtf		=		0.15
ihta		=		0.05
a1		=		poscil(port(gkMyo1_EMG_bf[0],ihta), 100 + 5 * port(gkMyo1_EMG_bf[0],ihtf))
a2		=		poscil(port(gkMyo1_EMG_bf[1],ihta), 200 + 10 * port(gkMyo1_EMG_bf[1],ihtf))
a3		=		poscil(port(gkMyo1_EMG_bf[2],ihta), 300 + 15 * port(gkMyo1_EMG_bf[2],ihtf))
a4		=		poscil(port(gkMyo1_EMG_bf[3],ihta), 400 + 20 * port(gkMyo1_EMG_bf[3],ihtf))
a5		=		poscil(port(gkMyo1_EMG_bf[4],ihta), 500 + 25 * port(gkMyo1_EMG_bf[4],ihtf))
a6		=		poscil(port(gkMyo1_EMG_bf[5],ihta), 600 + 30 * port(gkMyo1_EMG_bf[5],ihtf))
a7		=		poscil(port(gkMyo1_EMG_bf[6],ihta), 700 + 35 * port(gkMyo1_EMG_bf[6],ihtf))
a8		=		poscil(port(gkMyo1_EMG_bf[7],ihta), 800 + 40 * port(gkMyo1_EMG_bf[7],ihtf))

ihtf		=		0.15
ihta		=		0.05
ifact		=		semitone(4)
aR1		=		poscil(port(gkMyo3_EMG_bf[0],ihta), 100*ifact + 5 * port(gkMyo3_EMG_bf[0],ihtf))
aR2		=		poscil(port(gkMyo3_EMG_bf[1],ihta), 200*ifact + 10 * port(gkMyo3_EMG_bf[1],ihtf))
aR3		=		poscil(port(gkMyo3_EMG_bf[2],ihta), 300*ifact + 15 * port(gkMyo3_EMG_bf[2],ihtf))
aR4		=		poscil(port(gkMyo3_EMG_bf[3],ihta), 400*ifact + 20 * port(gkMyo3_EMG_bf[3],ihtf))
aR5		=		poscil(port(gkMyo3_EMG_bf[4],ihta), 500*ifact + 25 * port(gkMyo3_EMG_bf[4],ihtf))
aR6		=		poscil(port(gkMyo3_EMG_bf[5],ihta), 600*ifact + 30 * port(gkMyo3_EMG_bf[5],ihtf))
aR7		=		poscil(port(gkMyo3_EMG_bf[6],ihta), 700*ifact + 35 * port(gkMyo3_EMG_bf[6],ihtf))
aR8		=		poscil(port(gkMyo3_EMG_bf[7],ihta), 800*ifact+ 40 * port(gkMyo3_EMG_bf[7],ihtf))
;
	outs kMyo1_Imu_int*10*(a1+a2+a3+a4+a5+a6+a7+a8), kMyo3_Imu_int*10*(aR1+ aR2+ aR3+ aR4+ aR5+ aR6+ aR7+ aR8)


a1		oscil		0.2, 150 + gkNGIMU1_Eul[0]
acps		upsamp	150 + gkNGIMU1_Eul[0]
aSkew		upsamp	(gkNGIMU1_Eul[1]/90)
aClip		upsamp	(gkNGIMU1_Eul[2]/180)

kcps		=		150 + gkNGIMU1_Eul[0]
kmod		=		((gkNGIMU1_Eul[1]/90) + 1.5) * 10
kind		=		((gkNGIMU1_Eul[2]/180)+1) * 8
;aout 		squinewave acps, aClip, aSkew
kdiffX	init		0
k2		init		0
k3		init		0
kan		OSClisten	giCMserver, "/diffX", "fff", kdiffX, k2, k3
kamp		port		(kdiffX/720), 0.1

iSine		ftgen		0, 0, 8192, 10, 1
aout		foscil	kamp, kcps, 1, kmod, kind

out		aout
;X-axis: -30 -> 150
;kacc35	=		(abs(kIMU35[0])+abs(kIMU35[1])+abs(kIMU35[2]))*0.0001
;kacc36	=		(abs(kIMU36[0])+abs(kIMU36[1])+abs(kIMU36[2]))*0.0001
;		
;acc35		upsamp	kacc35
;accfilt35	tone		acc35, 50
;
;acc36		upsamp	kacc36
;accfilt36	tone		acc36, 50
;acc		median	acc, 100,200 
;aacc		
;printk2	kacc
;printk	0.2,	kY, 50
;printk	0.2, 	kZ, 100

; Y-verdiene fra NGIMU ligger mellom +90 og -90, noe som begrenser trackinga
; Derfor antakeligvis best å ha på-knapp oppe til venstre som nullpunkt

;a1	=	(oscil(accfilt35, 400+korient[0]))
;a2	=	(oscil(accfilt36, 300+korient[0]))
;
;outs	a1, a2

endin

instr		2
aout	oscil		0.4, 100*p4
aenv	expseg	1, p3/2, 0.1, p3/2, 0.0000001
amp	upsamp	gkMyo1_EMG_bf[p4-1]
amp	tone		amp, 200
outs	aout*aenv*(0.1+amp), aout*aenv*(0.1+amp)
endin

</CsInstruments>

<CsScore>
i1		0		7200
</CsScore>

</CsoundSynthesizer>