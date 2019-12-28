<CsoundSynthesizer>
<CsOptions>
-odac0 -Q0 -m0 -iadc0 -b128 -B256
</CsOptions>
<CsInstruments>
0dbfs		=		1
sr		=		44100
nchnls	=		2
ksmps		=		32

giSine		ftgen		0, 0, 2^15, 10, 1

#include		"/Users/andber/Csound/INCDIR/Onsets.udo"
#include		"/Users/andber/Csound/UDOs/Cps2midi.udo"

gifftsize		=		1024
inumbins		=		gifftsize/2 + 1
gihopsize		=		gifftsize/4
giAmps		ftgen		0, 0, inumbins, 10, 0
giFreqs		ftgen		0, 0, inumbins, 10, 0



gkAmps[]		init		inumbins
gkFreqs[]		init		inumbins

instr		1
aout[]		init		21				; Number of indices in the audio array

ain_L, ain_R		ins		
;ain_L		 	diskin2		"N_BBC_news.wav"
;
;ain_L, ain_R		diskin2		"/Users/andber/Lydbibliotek/Instrumenter/Vokal/267475__roanian__middle-east-female-vocal-cs.wav"

idelt		=		0.008
irmsthresh	=		0.04
iNoiseThrsh	=		0.25
iDebounceTime=		0.1
kOnset, krms, kend	Onsets		ain_L, idelt, irmsthresh, iNoiseThrsh, iDebounceTime

kOnsetflag		init			0
kOnsetflag		+=			kOnset
;fin_L		pvsanal		ain_L, ifftsize, ihopsize, ifftsize, 1
ffr, fphs		pvsifd		ain_L*3, gifftsize, gihopsize, 1

imaxtracks		=			20
kminpoints		=			1		; minimum number of time points for a detected peak to make a track (1 is the minimum).
kmaxgap		=			3		; maximum gap between time-points for track continuation
ktrackthresh	=			0.05
; Track the loudest 20 partials
ftrks_in 		partials 		ffr, fphs, ktrackthresh,kminpoints,kmaxgap, imaxtracks
ftrks			binit			ftrks_in, gifftsize
kflag 		pvsftw 		ftrks, giAmps, giFreqs
; Make tables for holding sorted amps and freqs
kSortedAmps[]	init			gifftsize
kSortedFrqs[]	init			gifftsize
kSortedBins[]	init			gifftsize

kperiod		=			int(linseg(1,5, 5, 10,50, 10, 1))	; vary the rate of sorting
kskip			init			0
kskip			+=			kflag
kskipflag		=			changed:k(kskip - kskip % kperiod)
;printk2	kskipflag
; Do sorting for every new frame
if			kflag == 1	&& kskipflag==1	then
			copyf2array		kSortedAmps, k(giAmps)	; Copy ftables to arrays
			copyf2array		kSortedFrqs, k(giFreqs)
kSortIndex		=		0
sortloop:
 kndx			=		0				; Reset pointer
 kMaxAmp		=		0				; and max value
 kMaxFrq		=		0
 kMaxIndx		=		0

; Sort partials
fftloop:
  kTrackAmp		table			kndx, giAmps	; Read amps and freqs
  kTrackFrq		table			kndx, giFreqs
  if	kTrackAmp	> kMaxAmp	then	
   kMaxAmp		= 	kTrackAmp	; 
   kMaxFrq		=	kTrackFrq
   kMaxIndx		=	kndx
  endif
 loop_lt	kndx, 1, gifftsize, fftloop
 kSortedAmps[kSortIndex] = 	kMaxAmp
 kSortedFrqs[kSortIndex] = 	kMaxFrq
			tablew	0, kMaxIndx, giAmps	; Remove highest value before new iteration
; printk2	kSortedAmps[kSortIndex]
; printk2	kSortIndex, 20
 loop_lt	kSortIndex, 1, imaxtracks, sortloop
kOnsetflag		=		0

krand		rand		0.02

;iTuneTab	ftgen		0, 0, 16, -2, 0, 3, 3, 3, 5, 5, 7, 7, 10, 10, 10, 10	; Table for tuning MIDI
iTuneTab	ftgen		0, 0, 16, -2, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11

knote0	=		Cps2midi(kSortedFrqs[0], iTuneTab)
kvel0		=		int(kSortedAmps[0]*127)
if	kvel0 > 0	then
event		"i", 2, 0+krand, 0.1, knote0, kvel0, kSortedFrqs[0]
endif
knote1	=		Cps2midi(kSortedFrqs[1], iTuneTab)
kvel1		=		int(kSortedAmps[1]*127)
if	kvel1	> 0 	then
event		"i", 2, 0+krand, 0.1, knote1, kvel1, kSortedFrqs[1]
endif
knote2	=		Cps2midi(kSortedFrqs[2], iTuneTab)
kvel2		=		int(kSortedAmps[2]*127)
if	kvel2	> 0	then
event		"i", 2, 0+krand, 0.1, knote2, kvel2, kSortedFrqs[2]
endif
knote3	=		Cps2midi(kSortedFrqs[3], iTuneTab)
kvel3		=		int(kSortedAmps[3]*127)
if	kvel3 > 0	then
event		"i", 2, 0+krand, 0.1, knote3, kvel3, kSortedFrqs[3]
endif
knote4	=		Cps2midi(kSortedFrqs[4], iTuneTab)
kvel4		=		int(kSortedAmps[4]*127)
if	kvel4 > 0	then
event		"i", 2, 0+krand, 0.1, knote4, kvel4, kSortedFrqs[4]
endif
knote5	=		Cps2midi(kSortedFrqs[5], iTuneTab)
kvel5		=		int(kSortedAmps[5]*127)
if	kvel5 > 0	then
event		"i", 2, 0+krand, 0.1, knote5, kvel5, kSortedFrqs[5]
endif
knote6	=		Cps2midi(kSortedFrqs[6], iTuneTab)
kvel6		=		int(kSortedAmps[6]*127)
if	kvel6 > 0	then
event		"i", 2, 0+krand, 0.1, knote6, kvel6, kSortedFrqs[6]
endif

endif

aout[0]		oscil		kSortedAmps[0], kSortedFrqs[0]
aout[1]		oscil		kSortedAmps[1], kSortedFrqs[1]
aout[2]		oscil		kSortedAmps[2], kSortedFrqs[2]
aout[3]		oscil		kSortedAmps[3], kSortedFrqs[3]
aout[4]		oscil		kSortedAmps[4], kSortedFrqs[4]
aout[5]		oscil		kSortedAmps[5], kSortedFrqs[5]
aout[6]		oscil		kSortedAmps[6], kSortedFrqs[6]
;aout[7]		oscil		kSortedAmps[7], kSortedFrqs[7]
;aout[8]		oscil		kSortedAmps[8], kSortedFrqs[8]
;aout[9]		oscil		kSortedAmps[9], kSortedFrqs[9]
;aout[10]		oscil		kSortedAmps[10], kSortedFrqs[10]
;aout[11]		oscil		kSortedAmps[11], kSortedFrqs[11]
;aout[12]		oscil		kSortedAmps[12], kSortedFrqs[12]
;aout[13]		oscil		kSortedAmps[13], kSortedFrqs[13]
;aout[14]		oscil		kSortedAmps[14], kSortedFrqs[14]
;aout[15]		oscil		kSortedAmps[15], kSortedFrqs[15]
;aout[16]		oscil		kSortedAmps[16], kSortedFrqs[16]
;aout[17]		oscil		kSortedAmps[17], kSortedFrqs[17]
;aout[18]		oscil		kSortedAmps[18], kSortedFrqs[18]
;aout[19]		oscil		kSortedAmps[19], kSortedFrqs[19]
;aout[20]		oscil		kSortedAmps[20], kSortedFrqs[20]

aL	=		aout[0]+aout[1]+aout[2] + aout[6] + aout[7]+aout[11]+aout[12]+aout[13] + aout[14] + aout[15]
aR	=		aout[3]+aout[4]+aout[5]+aout[8]+aout[9] + aout[10]+aout[16]+aout[17]+aout[18]+aout[19]+aout[20]

;outs			aL, aR
endin

instr	2
;outs(oscil(p5*cosseg(0,0.03,1,p3,1,0.03,0)/127,p6))
noteondur	1, p4, p5, 0.1
endin

schedule(1,0,50)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>