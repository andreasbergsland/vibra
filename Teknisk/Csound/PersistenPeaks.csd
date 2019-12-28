<CsoundSynthesizer>

<CsOptions>
-iadc2 -odac0 -b128 -B256
</CsOptions>
<CsInstruments>
nchnls	=	2
0dbfs		=	1
ksmps		=	16

;gifn1		ftgen		0, 0, 32768, 10, 0
;gifn2		ftgen		0, 0, 32768, 10, 0

; spectral subtraction
; compare frames of the fft, only the ones above a threshold will play
; also add smoothing

instr	1

;a1, a2	inch	1, 2
a1,a2		diskin2	"Cello.wav", 1

ifftsize 	=         		1024 	
f1     	pvsanal  	a1, ifftsize, 256, ifftsize, 0 
;f2     	pvsanal  	a2, ifftsize, 256, ifftsize, 0

kArr1[]   	init      	ifftsize+2 ;create array for bin data, sound 1
kArr2[]   	init      	ifftsize+2 ;create array for bin data, sound 2
kArr3[]   	init      	ifftsize+2 ;create array for bin data, sound 2
kArr4[]   	init      	ifftsize+2 ;create array for bin data, sound 2
kArr5[]   	init      	ifftsize+2 ;create array for bin data, sound 2

kRes[]		init		ifftsize+2 ;create array for bin data
kflag    		pvs2array 	kArr1, f1 ;export data to array	
;kflag2    		pvs2array 	kArr2, f2 ;export data to array


;if kflag has reported a new write action ...
if 		changed:k(kflag) == 1 	then
 kndx     	=         	0 ;even array index = bin amplitude
 kstep    	=         	2
 kmax     	=         	ifftsize+1

loop:
 kmean =  (kArr1[kndx]+kArr2[kndx]+kArr3[kndx]+kArr4[kndx]+kArr5[kndx])*0.2
 kstdev = sqrt(((kArr1[kndx]-kmean)^2 + (kArr2[kndx]-kmean)^2 + (kArr3[kndx]-kmean)^2 +\
		(kArr4[kndx]-kmean)^2+ (kArr5[kndx]-kmean)^2)*0.2)
 if kstdev != 0	then
 kSNR		=  kmean/kstdev
 else
 kSNR		=  80
 endif

; SNR = mean/st.dev
 if	kSNR  < 5	then
  kRes[kndx]	=	kArr1[kndx]
 else
  kRes[kndx]	=	0	
 endif
 loop_le   	kndx, kstep, kmax, loop
 kArr5		=		kArr4
 kArr4 		=		kArr3 
 kArr3		=		kArr2
 kArr2		=		kArr1
 
endif

fres     	pvsfromarray 	kRes ;read modified data back to fres
fsmooth	pvsblur		f1, 0.01, 0.01
aout     	pvsynth   		fres
outs		aout, aout
;fscal1	pvscale	f1, 0.5
;fscal2	pvscale	f2, 0.5
;fscal3	pvscale	f1, 0.25
;fscal4	pvscale	f2, 0.25
;fscal5	pvscale	f1, 0.25
;fscal6	pvscale	f2, 0.25
;fscal7	pvscale	f1, 3.8
;fscal8	pvscale	f2, 4
;
;ar1		pvsynth	fscal1
;ar2		pvsynth	fscal2
;ar3		pvsynth	fscal3
;ar4		pvsynth	fscal4
;ar5		pvsynth	fscal5
;ar6		pvsynth	fscal6
;ar7		pvsynth	fscal7
;ar8		pvsynth	fscal8
;
;aL		=		ar5*0.6	+ar7* 0.2
;aR		=		ar6*0.6	+ar8* 0.2
;outs		aL, aR

;temposcal	atimp, 0.1, 0.5, 
;	fout	"Radio.wav", 2, a1, a2

endin
</CsInstruments>


<CsScore>
i1	0	30
</CsScore>


</CsoundSynthesizer>