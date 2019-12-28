prints		"Starting particles light\n"
; Map to control parameters------------------------------------------
ibank			=		p4
kVolume		=		kParams[0]
kActNorm		=		kParams[1]
kposition		=		kParams[2]
iadTab		ftgentmp	0, 0, 1024, -7, 0, 512, 0, 512, 0.9
ienvTab		ftgentmp	0, 0, 1024, -7, 0.85, 512, 0, 512, 0
ka_d_ratio		table		kParams[3], iadTab, 1					; balance between attack time and decay time, 0.0 = zero attack time and full decay time
kenv2amt		table		kParams[3], ienvTab, 1 	
kTranspInd		=  		kParams[4]							; (= transposition factor)	
gkRndDev		rand		kParams[5]
kDur			=		kParams[6]
kPan			=		kParams[7]
kFineTransp		=		kParams[8]
;kprint		metro		10
;			printarray	kParams, kprint
;--------------------------------------------------------------------

; Choice of layers (default)
giLayers		ftgentmp	0, 0, 4, -2, 1, 2, 3, 4
gkLayer1		table		0, giLayers
gkLayer2		table		1, giLayers
gkLayer3		table		2, giLayers
gkLayer4		table		3, giLayers


;-----------------------------------------------------------
; Table that maps activity (index) to triggering frequency
itabsize		=		8193					; Table size for envelope (linseg fashion)
ithreshpct		=		0.25					; Factor/ratio of initial slope
ithresh		=		round(ithreshpct * itabsize)
ibegslope		=		0 					; Negative yields convex curve
iendslope		=		2					; Positive yields concave curve
imedfreq		=		12					; Mid-way triggering frequency
gimaxfreq		=		150					; Maximal triggering frequency
giActMap		ftgentmp	0, 0, itabsize, -16, 0, ithresh, ibegslope, imedfreq, itabsize-ithresh, iendslope, gimaxfreq
giActMapNG		ftgentmp	0, 0, 1024, -7, 0, 1024, 80
;-------------------------------------------------------------

; Random deviation of files (default settings) ; Table to vary random deviation according to triggering frequency
girnd_dev_tab1	ftgentmp	0, 0, 256, -7, 6, 10, 3, 20 , 2.5, 10, 2.4, 10, 2 , 226, 1.5
; Mapping of gain according to activity (default )
giboost_tab		ftgentmp	0, 0, 512, -7, -18, 512, 0

;---------------Panning -------------------------------------------------------
girandpantab	ftgentmp	0, 0, 256, -7, 0.15, 20, 0.15, 60, 0.2, 100, 0.4, 40, 0.5, 36, 0

;---------------Transposition -------------------------------------------------------
; Allow for 4 separate transposition layers per player instrument
; player 1 => index 1, dim1, player 2 => index 2, dim1
; voice 1 = index 1, dim2, voice 2 => index 2, dim2, etc.
; gkTranspArr[][]	init		3, 5
;gkTranspArr		Fill2DArray	gkTranspArr, 1		; Init all voices for both players with 1

; Set index (first set = 0) - should this be k-rate so as to enable changing sets on the fly
iPlayer		=		frac(p1)*10
inplace		=		p4 				; In space = 0, in space = 1
iActInd		=		p5
iDiscInd		=		p6
iPosInd		=		p7
;iTranspInd		=		1
igainmasks		=		p9
ichannelmasks	=		p10

;-----------------Activity and discretes---------------------
if kSwitch == -1	then
kTrigFreq		tablei  	kActNorm, giActMap, 1
elseif kSwitch == 1	then
kTrigFreq		tablei  	kActNorm, giActMapNG, 1
endif
atrig, ktrig	Metro_a	kTrigFreq ;* (1 - gkRhythm)		; Set frequency to 0 when rhythms play
aDiscr		Upsamptrig	gkMovData[iPlayer][iDiscInd]
kDiscr		=		gkMovData[iPlayer][iDiscInd]
async			=		atrig + aDiscr


;-----------------Random sweep-------------------------------
kSweepRndAmp	=		0.2
kSweeprand		randh		kSweepRndAmp, 10, 0.87
if			kDiscr == 1	then
 kStartsweep	=		kSweeprand + 1			; Makes the sweeps symmetrical around 1
 kEndsweep		=		kSweeprand * (-1) + 1		; Check if this value applies grain by grain!
else
 kStartsweep	=		1
 kEndsweep		=		1
endif

;-----------------File chooser w/random deviation--------------------
; Choose sound bank
if	changed:k(gkSndBank) == 1	then
 reinit	startover
endif

;----------------------------------------------------------------------
; Reinitiate if sound bank changes
startover:
 ibank		=		i(gkSndBank)
 iNumFiles		=		giNumFiles[ibank]
 print	ibank, iNumFiles

kSetInd		=		gkSndBank1 - 1

kNumFiles1		=		iNumFiles
kNumFiles2		=		iNumFiles
kNumFiles3		=		iNumFiles
kNumFiles4		=		iNumFiles

;kRndDev_fact	table		kTrigFreq/gimaxfreq, girnd_dev_tab1, 1
;gkRndDev		randh		kRndDev_fact, kTrigFreq, 0.5				; Scale amplitude of random deviation with factor from table


kSndInd1		=		limit(int(kposition*kNumFiles1*0.9999 + gkRndDev), 0, kNumFiles1-1)
;kSndInd2		=		kNumFiles2>1? limit(int(kposition*kNumFiles2*0.9999 + gkRndDev), 0, kNumFiles2-1) : kSndInd1
;kSndInd3		=		kNumFiles3>1? limit(int(kposition*kNumFiles3*0.9999 + gkRndDev), 0, kNumFiles3-1) : kSndInd1
;kSndInd4		=		kNumFiles4>1? limit(int(kposition*kNumFiles4*0.9999 + gkRndDev), 0, kNumFiles4-1) : kSndInd1

kSndLayer1		= 		giTabNums[ibank][kSndInd1]
kSndLayer2		= 		kSndLayer1
kSndLayer3		= 		kSndLayer1
kSndLayer4		= 		kSndLayer1

kfilen1		tableng	kSndLayer1		; get length of the first source waveform
kfilen2		tableng	kSndLayer2		; get length of the first source waveform
kfilen3		tableng	kSndLayer3		; get length of the first source waveform
kfilen4		tableng	kSndLayer4		; get length of the first source waveform

kfildur1		= 		kfilen1 / sr		; length in seconds, for the first source waveform
kfildur2		= 		kfilen2 / sr		; length in seconds, for the first source waveform
kfildur3		= 		kfilen3 / sr		; length in seconds, for the first source waveform
kfildur4		= 		kfilen4 / sr		; length in seconds, for the first source waveform
kfildurMax		max		kfildur1, kfildur2, kfildur3, kfildur4
rireturn

;----------------------------------------------------------------------
;printk2	kSndLayer1
;printf		" %i	 %i   %i   %i \n", kSndInd1+kSndInd2+kSndInd3+kSndInd4, kSndLayer1, kSndLayer2, kSndLayer3, kSndLayer4


;---------------- Layer mappings-----------------------------
; Break point table for mapping intensity of layer 1 to centerX
giLay1_map		ftgentmp		0, 0, 128, -7, 1.0, 128, 1.0
; Break point table for mapping  intensity of layer 2 to centerX 
giLay2_map		ftgentmp		0, 0, 128, -7, 0.0,128, 0
; Break point table for mapping  intensity of layer 3 to centerX
giLay3_map		ftgentmp		0, 0, 128, -7, 0.0,128, 0
; Break point table for mapping  intensity of layer 4 to centerX
giLay4_map		ftgentmp		0, 0, 128, -7, 0.0,128, 0

kLayer1Mix		tableikt 	kposition, giLay1_map, 1
kLayer2Mix		tableikt 	kposition, giLay2_map, 1
kLayer3Mix		tableikt 	kposition, giLay3_map, 1
kLayer4Mix		tableikt 	kposition, giLay4_map, 1

;---------------- Gain---------------------------------------
iboost_tab		ftgentmp	0, 0, 512, -7, -10, 512, 0
kboostTab		=		iboost_tab
iboostDiscr		=		3				; Give discretes a little boost
if kDiscr	== 1	then
kboost_dB		tablekt	iboostDiscr, kboostTab, 1
else
kboost_dB		tablekt	kActNorm, kboostTab, 1	; Should _boost_tab be set with a k-rate var?
										; to enable switching between mapping files?
endif
			tablew	ampdb(kboost_dB), 2, giGainMasks

;-----------------Panning------------------------------------
krandpanamp		tablekt	(kTrigFreq/gimaxfreq), girandpantab, 1; Same as giboost_tab, should be set with tablekt
krand			randh		krandpanamp, kTrigFreq
kpan			=		limit((kPan + krand), 0, 1)
			tablew	kpan, 2, giChnmasks

;-----------------Transposition------------------------------
itranspTab		ftgentmp	0, 0, 1024, -7, -24, 1024, 24
ifineTab		ftgentmp	0, 0, 1024, -7, -2, 1024, 2
kTransp		table		kTranspInd, itranspTab, 1
kFine			table		kFineTransp, ifineTab, 1
ktranspose		=		semitone(kFine + kTransp)


; Single layer transpose (not currently in use)
ktransp1		=		1/kfildur1
ktransp2		= 		1/kfildur1
ktransp3		= 		1/kfildur1
ktransp4		= 		1/kfildur1
;kwavekeymax		max		ktransp1, ktransp2, ktransp3, ktransp4 ; Get highest transposition value


;kTimeRate		= 		1				; time pointer rate
asamplepos		=		0				; Start at the beginning of the samples
kGrainRate		=		0				; Not used as rate is controlled by gaSyncTrig1/2

;-----------------Grain rate FM-----------------------------
kGrFmFreq		= 		kGrainRate/4				; FM freq for modulating the grainrate
kGrFmIndex		= 		0.0						; FM index for modulating the grainrate (normally kept in a 0.0 to 1.0 range)
iGrFmWave		= 		giSine					; FM waveform, for modulating the grainrate
aGrFmSig		oscil 	kGrFmIndex, kGrFmFreq, iGrFmWave	; audio signal for frequency modulation of grain rate
agrainrate		= 		kGrainRate + (aGrFmSig*kGrainRate)	; add the modulator signal to the grain rate signal

kdistribution	= 		0						; 0 = periodic,grain random distribution in time
idisttab		ftgentmp	0, 0, 1024, 21, 1, 1			; type level

kGrainDur		= 		kDur * kfildurMax * 1000		; length of each grain relative to grain rate: 1=one grain at a time, 0.5=
										; 1/2 sound, 1/2 silence in between, 2=100% grain overlap
ienv_attack		= 		giSigmoRise 			; grain attack shape (from table)
ienv_decay		= 		giSigmoFall 			; grain decay shape (from table)
ksustain_amount	= 		0.0					; balance between enveloped time(attack+decay) and sustain level time, 0.0 = no time at sustain level

					; amount of secondary enveloping per grain (e.g. for fof synthesis)
ienv2tab		= 		giExpFall 				; secondary grain shape (from table), enveloping the whole grain if used

; Grain pitch (transpose, or "playback speed")

; Pitch sweep
ksweepshape		= 		0.5				; grain wave pitch sweep shape (sweep speed), 0.5 is linear sweep
iwavfreqstarttab 	ftgentmp	0, 0, 16, -2, 0, 0, 1	; start freq scalers, per grain
iwavfreqendtab	ftgentmp	0, 0, 16, -2, 0, 0, 1	; end freq scalers, per grain
			tablew	kStartsweep, 2, iwavfreqstarttab
			tablew	kEndsweep, 2, iwavfreqendtab
; FM of grain pitch (playback speed)
kPtchFmFreq		= 		0				; FM freq, modulating waveform pitch
kPtchFmIndex	= 		0.0				; FM index, modulating waveform pitch
iPtchFmWave		= 		giSine				; FM waveform, modulating waveform pitch
ifmamptab		ftgentmp	0, 0, 16, -2, 0, 0,   1				; FM index scalers, per grain
ifmenv		= 		giTriangleWin 					; FM index envelope, over each grain (from table)
kPtchFmIndex	= 		kPtchFmIndex + (kPtchFmIndex*kPtchFmFreq*0.00001) 	; FM index scaling formula
awavfm		oscil		kPtchFmIndex, kPtchFmFreq, iPtchFmWave		; Modulator signal for frequency modulation inside grain

; trainlet parameters - not in use, but still required for partikkel
kTrainCps		= 		kGrainRate		; set cps equal to grain freq, creating a single cycle of a trainlet inside each grain
knumpartials	= 		1			; number of partials in trainlet
kchroma		= 		3			; chroma, falloff of partial amplitude towards sr/2

; random masking (muting) of individual grains
krandommask		= 		0

; Wave mix masking. Set gain per source waveform per grain,
; in groups of 5 amp values, reflecting source1, source2, source3, source4, and the 5th slot is for trainlet amplitude.
iwaveamptab		ftgentmp	0, 0, 8, -2, 0, 0, 1, 0, 0, 0
			tablew	kLayer1Mix, 2, iwaveamptab
			tablew	kLayer2Mix, 3, iwaveamptab
			tablew	kLayer3Mix, 4, iwaveamptab
			tablew	kLayer4Mix, 5, iwaveamptab

; system parameter
imax_grains		= 		100				; max number of grains per k-period

; Temporarly setting these variables for testing
kamp			=		ampdb(-7)

a1, a2, a3, a4, a5, a6, a7, a8	partikkel \					;
		  kGrainRate, kdistribution, idisttab, async, \
		  kenv2amt, ienv2tab, ienv_attack, ienv_decay, \
		  ksustain_amount, ka_d_ratio, kGrainDur, \
		  kamp, giGainMasks, ktranspose, \
		  ksweepshape, iwavfreqstarttab, iwavfreqendtab, \	; grain pith sweeps
		  awavfm, ifmamptab, ifmenv, \
		  giCosine, kTrainCps, knumpartials, kchroma, \
		  giChnmasks, krandommask, \
		  kSndLayer1, kSndLayer1, kSndLayer1, kSndLayer1, \		; set source waveforms
		  iwaveamptab, \							; mix source waveforms
		  asamplepos, asamplepos, asamplepos, asamplepos, \	; read position for source waves
              ktransp1, ktransp1, ktransp1, ktransp1, \		; individual transpose for each source
		  imax_grains							; system parameter

kfadeout	linsegr		0.5, p3, 1, 2, 0
