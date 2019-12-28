;/////////////////////////////////////////////////////////////////////////////////////////////////
;			MAPPING 1
; 			MYO 1  => MYO MINCER/TRACER
;/////////////////////////////////////////////////////////////////////////////////////////////////
			instr		Myo_MultiVoice

kMyoNum		=		p4
iOct			=		p5
iPitch1		=		p6
iObj			=		p7
iRelTime		=		p8
; Intensity of accels => sound intensity
iHalfPw		=		0.02
kEMG[]		init		8
if			kMyoNum == 1	then
kIntensity		=		gkMyo1_Acc_int
kAmp			=		gkMyo1_EMG_sum
kGyroX		=		gkMyo1_Gyro[0]
kEMG			=		gkMyo1_EMG_bf
kEMG_1		=		gkMyo1_EMG_bf[0]
kEMG_2		=		gkMyo1_EMG_bf[1]
kEMG_3		=		gkMyo1_EMG_bf[2]
kEMG_4		=		gkMyo1_EMG_bf[3]
kEMG_5		=		gkMyo1_EMG_bf[4]
kEMG_6		=		gkMyo1_EMG_bf[5]
kEMG_7		=		gkMyo1_EMG_bf[6]
kEMG_8		=		gkMyo1_EMG_bf[7]
kEMG_sum		=		gkMyo1_EMG_sum
elseif		kMyoNum == 2	then
kIntensity		=		gkMyo2_Acc_int
kAmp			=		gkMyo2_EMG_sum
kGyroX		=		gkMyo2_Gyro[0]
kEMG			=		gkMyo2_EMG_bf
kEMG_1		=		gkMyo2_EMG_bf[0]
kEMG_2		=		gkMyo2_EMG_bf[1]
kEMG_3		=		gkMyo2_EMG_bf[2]
kEMG_4		=		gkMyo2_EMG_bf[3]
kEMG_5		=		gkMyo2_EMG_bf[4]
kEMG_6		=		gkMyo2_EMG_bf[5]
kEMG_7		=		gkMyo2_EMG_bf[6]
kEMG_8		=		gkMyo2_EMG_bf[7]
kEMG_sum		=		gkMyo2_EMG_sum
elseif		kMyoNum == 3	then
kIntensity		=		gkMyo3_Acc_int
kAmp			=		gkMyo3_EMG_sum
kGyroX		=		gkMyo3_Gyro[0]
kEMG			=		gkMyo3_EMG_bf
kEMG_1		=		gkMyo3_EMG_bf[0]
kEMG_2		=		gkMyo3_EMG_bf[1]
kEMG_3		=		gkMyo3_EMG_bf[2]
kEMG_4		=		gkMyo3_EMG_bf[3]
kEMG_5		=		gkMyo3_EMG_bf[4]
kEMG_6		=		gkMyo3_EMG_bf[5]
kEMG_7		=		gkMyo3_EMG_bf[6]
kEMG_8		=		gkMyo3_EMG_bf[7]
kEMG_sum		=		gkMyo3_EMG_sum
elseif		kMyoNum == 4	then
kIntensity		=		gkMyo4_Acc_int
kAmp			=		gkMyo4_EMG_sum
kGyroX		=		gkMyo4_Gyro[0]
kEMG			=		gkMyo4_EMG_bf
kEMG_1		=		gkMyo4_EMG_bf[0]
kEMG_2		=		gkMyo4_EMG_bf[1]
kEMG_3		=		gkMyo4_EMG_bf[2]
kEMG_4		=		gkMyo4_EMG_bf[3]
kEMG_5		=		gkMyo4_EMG_bf[4]
kEMG_6		=		gkMyo4_EMG_bf[5]
kEMG_7		=		gkMyo4_EMG_bf[6]
kEMG_8		=		gkMyo4_EMG_bf[7]
kEMG_sum		=		gkMyo4_EMG_sum
endif

;iGateFun		ftgentmp	0, 0, 1024, -7, 0.0, 40, 0.001, 984, 0.5
;kAmpGated		table		kAmp, iGateFun, 1
;aAmp			=		a(kAmpGated)
;aFiltAmp		tone		aAmp, 3

idelt		=		0.02
irmsthresh	=		0.06
iNoiseThrsh	=		0.001
iDebounceTime=		0.25

kEMG1_onset, krms1, kend1	Onsets_k	kEMG_1, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG2_onset, krms2, kend2	Onsets_k	kEMG_2, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG3_onset, krms3, kend3	Onsets_k	kEMG_3, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG4_onset, krms4, kend4	Onsets_k	kEMG_4, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG5_onset, krms5, kend5	Onsets_k	kEMG_5, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG6_onset, krms6, kend6	Onsets_k	kEMG_6, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG7_onset, krms7, kend7	Onsets_k	kEMG_7, idelt, irmsthresh, iNoiseThrsh, iDebounceTime
kEMG8_onset, krms8, kend8	Onsets_k	kEMG_8, idelt, irmsthresh, iNoiseThrsh, iDebounceTime

kPeak1		init		0
kPeak2		init		0
kPeak3		init		0
kPeak4		init		0
kPeak5		init		0
kPeak6		init		0
kPeak7		init		0
kPeak8		init		0

kPeak1		=		(kEMG1_onset == 1)? krms1*10: kPeak1
kPeak2		=		(kEMG2_onset == 1)? krms2*10: kPeak2
kPeak3		=		(kEMG3_onset == 1)? krms3*10: kPeak3
kPeak4		=		(kEMG4_onset == 1)? krms4*10: kPeak4
kPeak5		=		(kEMG5_onset == 1)? krms5*10: kPeak5
kPeak6		=		(kEMG6_onset == 1)? krms6*10: kPeak6
kPeak7		=		(kEMG7_onset == 1)? krms7*10: kPeak7
kPeak8		=		(kEMG8_onset == 1)? krms8*10: kPeak8

schedkwhen kEMG1_onset, 2, 1, 50, 0, 2, 1, iObj, kMyoNum
schedkwhen kEMG2_onset, 2.1, 1, 51, 0, 2, 2, iObj, kMyoNum
schedkwhen kEMG3_onset, 2.2, 1, 52, 0, 2, 3, iObj, kMyoNum
schedkwhen kEMG4_onset, 2.3, 1, 53, 0, 2, 4, iObj, kMyoNum
schedkwhen kEMG5_onset, 2.1, 1, 54, 0, 2, 5, iObj, kMyoNum
schedkwhen kEMG6_onset, 2.2, 1, 55, 0, 2, 6, iObj, kMyoNum
schedkwhen kEMG7_onset, 2.3, 1, 56, 0, 2, 7, iObj, kMyoNum
schedkwhen kEMG8_onset, 2, 1, 57, 0, 2, 8, iObj, kMyoNum

endin

		instr	50, 51, 52, 53, 54, 55, 56, 57
aAmp		=		0.5
kTransp	=		1
iFun		=		giTabNums[p4 + 20]
iChn		=		ftchnls(iFun)
iObj		=		p5
iSensorNum	=		p6


a2		init		0
if iChn == 1	then
iLen		=		ftlen(iFun)
aSnd		lposcila	aAmp, kTransp, 0, iLen, iFun	
elseif iChn == 2	then
iLen		=		ftlen(iFun)*0.5
a1, a2	lposcilsa2	aAmp, kTransp, 0, iLen, iFun	
aSnd		=		(a1 + a2) * 0.5
endif

; Mix to audio array
gaSend[iObj]	=		gaSend[iObj] + aSnd * gkVolume[iSensorNum-1];aFiltAmp
;
;; Set spatialization parameters
;gkAzi[iObj]		=		90
;gkDist[iObj]	=		1
;gkSpread[iObj]	=		10

			endin
