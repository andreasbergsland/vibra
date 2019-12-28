<CsoundSynthesizer>

<CsOptions>
-iadc2 -odac1 -b128 -B256
</CsOptions>
<CsInstruments>
nchnls	=	2
0dbfs		=	1
ksmps		=	16
sr		=	44100

;gifn1		ftgen		0, 0, 32768, 10, 0
;gifn2		ftgen		0, 0, 32768, 10, 0

/*
     ERB(f) = 24.7 * (4.37 f / 1000 + 1),
where the ERB is in Hz and f is the centre frequency in Hz. 
Algorithm could look for e.g. the 20 loudest peaks in the spectrum over the last
2-3 pitch periods minimum (at 40Hz => 75-100 ms 20 frames (giving a delay of hopsize * 20 = 5120 samples = 34ms). 
Find peaks:
1. Find smoothed spectrum envelope
2. Peak has to be a certain amount of dBs above smoothed envelope (6dB?)
 - get all peaks (value for which the adjacent values are lower)
 - check if peaks are 6dBs above smoothed spectrum

1. Sort FFT, keep 20 loudest - make sure no values are too close (within +/- 1 ERB), if they are, use mean
2. Store into 20 x 20 array
3. Do a fuzzy comparison of all numbers - within +/- 1 ERB
 - take each number in the column and compare it with each number in the other columns
4. 
*/

instr	1

;a1, a2	inch	1, 2
;a1,a2		diskin2	"Radio.wav", 1
;a1, a2	diskin2	"/Users/andber/Lydbibliotek/Instrumenter/Vokal/267475__roanian__middle-east-female-vocal-cs.wav", 1
a1, a2	ins

ifftsize 	=         		1024 	
ihopsize	=			ifftsize/4
f1     	pvsanal  	a1, ifftsize, ihopsize, ifftsize, 0 
;f2     	pvsanal  	a2, ifftsize, 256, ifftsize, 0
kArr1[]	init		ifftsize+2	
kSmooth[]	init		ifftsize + 2 ;create array for bin data
kSmooth	=		kArr1
kPeaks[]	init		ifftsize + 2

ispecspan	=		0.25		; proportion of spectrum to span for the peak calculation (saves CPU)
kskipframes	=		1		; 1 = no skip, 2 = every 2nd frame, etc., should in theory save CPU
kPeaks2D[][] init		10, ifftsize * ispecspan + 2
kmax     	=         	ifftsize * ispecspan +1
ksmpnts 	= 		20		; Number of bins over which to smooth, minimum = 1 (no smooth)
kdBthresh	=		6		; Threshold for detecting peaks (peak amp - smoothed amp)

kflag    	pvs2array 	kArr1, f1 ;export data to array
kdocalc	=		kflag % kskipframes  ; only do calculation every Nth frame to save CPU
;if kflag has reported a new write action ...
if 		changed:k(kflag) == 1 && kdocalc == 0	then
 kndx     	=         	0 	;even array index = bin amplitude

; Calculate spectral mean
 until kndx >= kmax	do
  ksmndx	=		0
  kSum	=		0
  until ksmndx >= 	ksmpnts*2 || (kndx+ksmndx) >= kmax do
   kSum	+= 		kArr1[kndx + ksmndx]
   ksmndx 	+=		2
  od
  kMean	=		kSum/ksmpnts		; Calculate mean for smoothing window
  kSmooth[kndx]=		kMean
  kndx	+=	2
 od

; Calculate peaks
 kndx2	=		0
 until kndx2 >= kmax	do
  kpkndx	=		0
  until kpkndx >= kmax-6 do
   if kArr1[kpkndx+2] > ampdb(kdBthresh) * kSmooth[kpkndx+2] && \
    (kArr1[kpkndx+2] > kArr1[kpkndx] && kArr1[kpkndx+2] > kArr1[kpkndx+6])	then
    kPeaks[kpkndx+2] = kArr1[kpkndx+2]
    kPeaks[kpkndx+1] = kArr1[kpkndx+1]	; Write frequency values to peak array
   else
    kPeaks[kpkndx+2] = 0
   endif
   kpkndx	+=		2		
  od
  kndx2	+=		2
 od

; Check which peaks that form tracks
; Choice: fft array or compact, track-based
; kndx3	=		0
; until kndx3 >= kmaxpeaks do
;  
; od

 
endif

fres     	pvsfromarray 	kPeaks ;read modified data back to fres
fblur		pvsblur		fres, 0.1, 0.1
;fsc1		pvscale		fblur, 0.5, 0.25
;fsc2		pvscale		fblur, 0.25, 0, 0.5
;fsc3		pvscale		fblur, 0.125, 0, 0.8
;fm1		pvsmix		fblur, fsc1
;fm2		pvsmix		fsc2, fsc3
;fmix		pvsmix		fm1, fm2
aout     	pvsynth   		fres
outs		aout, aout
;fout		"SpectralSmooth1.wav", 2, aout

endin
</CsInstruments>


<CsScore>
i1	0	50
</CsScore>


</CsoundSynthesizer>