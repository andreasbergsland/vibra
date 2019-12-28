<CsoundSynthesizer>
<CsOptions>
-odac0	-b128 -B256
</CsOptions>
<CsInstruments>
sr	=	48000
ksmps	=	32
nchnls = 	2
0dbfs	=	1

#include	"Inc/Delta_array.udo"

#include	"Inc/OSClistenArray.udo"

#include	"Inc/Accel_intensity.udo"

gih			OSCinit	8036
gih2			OSCinit	54321
gaSend[]		init		8
gkVolume[]		fillarray	1, 1, 1, 1, 1, 1, 1, 1


giTabNums[]		init		12

gkMyo1_euler[]	init		3
gkMyo2_euler[]	init		3
gkMyo3_euler[]	init		3
gkMyo4_euler[]	init		3

gkMyo1_EMG_bf[]	init		8
gkMyo2_EMG_bf[]	init		8	
gkMyo3_EMG_bf[]	init		8
gkMyo4_EMG_bf[]	init		8



gkMyo1_Acc_int	init		0
gkMyo2_Acc_int	init		0
gkMyo3_Acc_int	init		0
gkMyo4_Acc_int	init		0

gkNGIMU1_Eul[]	init		3
gkNGIMU2_Eul[]	init		3
gkNGIMU3_Eul[]	init		3
gkNGIMU4_Eul[]	init		3

gkMyo1_Raw[]	init		10

gkMyo1_Gyro[]	init		3
gkMyo2_Gyro[]	init		3
gkMyo3_Gyro[]	init		3
gkMyo4_Gyro[]	init		3



instr		1
gkMyo1_euler	OSClistenArray	gih, "/euler", "fff"
gkMyo1_EMG_bf	OSClistenArray	gih2, "/myo/1/emg/bfilt", "ffffffff"
kans			OSClisten		gih2, "/myo/1/imu/int", "f", gkMyo1_Acc_int
gkMyo1_Raw		OSClistenArray	gih2, "/myo/1/imu/raw", "ffffffffff"
gkMyo1_Gyro[0]	=		gkMyo1_Raw[3]

gkMyo1_EMG_sum	sumarray	gkMyo1_EMG_bf
gkMyo2_EMG_sum	sumarray	gkMyo2_EMG_bf
gkMyo3_EMG_sum	sumarray	gkMyo3_EMG_bf
gkMyo4_EMG_sum	sumarray	gkMyo4_EMG_bf
	

kAcc1[]		init			3
kAcc1 		slicearray 		gkMyo1_Raw, 0, 2
kAcc1, gkMyo1_Acc_int	Accel_intensity	kAcc1
		

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

;

endin

#include	"Inc/Flexi_Flow.inc"

;#include	"Inc/Myo_minctracer.inc"


</CsInstruments>


<CsScore>
i1	0	100
i2	0.1	300	1	1	1
;i2	0	100	1	6	1

</CsScore>


</CsoundSynthesizer>