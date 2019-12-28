<CsoundSynthesizer>

<CsOptions>
-odac0 -m0 -d -b128 -B256
</CsOptions>


<CsInstruments>
sr		=			44100
ksmps		=			16
0dbfs		=			1
nchnls	=			2

giSigmoRise 	ftgen	0, 0, 8193, 19, 0.5, 1, 270, 1				; rising sigmoid
giSigmoFall 	ftgen	0, 0, 8193, 19, 0.5, 1, 90, 1				; falling sigmoid
giSigmo	 	ftgen	0, 0, 8192, 20, 2			; falling sigmoid
giExpFall		ftgen	0, 0, 8193, 5, 1, 8193, 0.00001				; exponential decay
giTriangleWin 	ftgen	0, 0, 8193, 7, 1, 4096, 0, 4096, 0			; triangular window

gih			OSCinit		7032

instr		1
;Initiate and read values from OSC---------------------------
gkcenterX		init		0
kqcenterX		init		0
gkAltEnv		init		0
kVolumeInd		init		0.5
koverhead		init		0
kdastrig		init		0
kmuteLongs		init		0
killLong		init		0
kStart		init		0
kStop			init		0
knoHeight		init		0
gktrigDrone		init		0
gkillDrone		init		0
gkSingleFile	init		0
gkIR_file		init		0
gkOperationMode	init		0
gkSet			init		1
gkheight1		init		0
gkheight2		init		0
gkactNorm1		init		0
gkactNorm2		init		0
gkactSens1		init		0
gkactSens2		init		0
gkHyper		init		0
gkwidth		init		0

kans		OSClisten	gih, "/soundbank", 	"i", gkSet		; Sound set (bank of sounds)
kans		OSClisten	gih, "/volume", 		"d", kVolumeInd		; Volume
kans		OSClisten	gih, "/start", 		"i", kStart
kans		OSClisten	gih, "/stop", 		"i", kStop
kans		OSClisten	gih, "/OperationMode",	"i", gkOperationMode

kans		OSClisten	gih, "/centerX1", 	"d", gkcenterX		; X-position

kans		OSClisten	gih, "/height1", 		"d", gkheight1		
kans		OSClisten	gih, "/height2", 		"d", gkheight2		
	
;kans		OSClisten	gih, "/armSideLeft", 	"d", gkarmL			; arm-position left
;kans		OSClisten	gih, "/armSideRight", 	"d", gkarmR			; arm-position right
kact1_trig	OSClisten	gih, "/activityNormal1","f", gkactNorm1			; Activity - higher sensitivity
kact2_trig	OSClisten	gih, "/activityNormal2","f", gkactNorm2			; Activity - higher sensitivity
ksen1_trig	OSClisten	gih, "/activitySensitive1","f", gkactSens1		; Stillness-to-activity change trigger
ksen2_trig	OSClisten	gih, "/activitySensitive2","f", gkactSens2		; Stillness-to-activity change trigger


kans		OSClisten	gih, "/activityHyper1","f", gkHyper			; Use with EyeCon

kans		OSClisten	gih, "/width1", 		"d", gkwidth		; Width tracking
kans		OSClisten	gih, "/overhead1", 	"i", koverhead		; Boolean trigger
kans		OSClisten	gih, "/dastrig1",		"i", kdastrig		; Double arm side gesture trigger



endin


instr		2

SFiles[]	directory	"/Users/andber/Desktop/VIBRA/Teknisk/Csound/SND", ".wav"
giNumFiles	lenarray	SFiles

; Make tables with sound files, store table numbers in an array
giTabNums[]		init			giNumFiles
giTabLengths[]	init			giNumFiles
indx1			=			0
maketables:
    ifn			ftgentmp		0, 0, 0, 1, SFiles[indx1], 0, 0, 0 
    giTabNums[indx1]	=			ifn
    ilen			=			ftlen(ifn)
    giTabLengths[indx1]	=			ilen		
loop_lt	indx1, 1, giNumFiles, maketables

endin


instr		3
kindex = 	int(gkactNorm2*giNumFiles)
ktab	=	giTabNums[kindex]
klock	=	1
klen	=	giTabLengths[kindex]
klen	=	klen/sr

; Table that maps activity (index) to frequency - concatenates two curves with different slopes
itabsize	=		4096					; Table size for envelope (linseg fashion)
ithreshpst	=		0.05					; Ratio of initial slope
ithresh		=		int(ithreshpst * itabsize)
ibegslope	=		-1 					; negative yields convex curve
iendslope	=		2					; positive yields concave curve
imedfreq	=		4
imax		=		14					; Maximal triggering frequency

iActMap	ftgentmp	0, 0, itabsize, -16, 0, ithresh, ibegslope, imedfreq, itabsize-ithresh, iendslope, imax
kindex	table	  	gkactNorm1, iActMap, 1
kmetro	metro		kindex

if		kmetro == 1	then
ktimp		=		0		; Metro reinits phasor
endif

;kscrub	=		klen * 0.5 + gkcenterX * klen * 0.05
;kscrublast	init		0
;if	ktimp == 0		then
;kscrub	=		klen * 0.5 + gkcenterX * klen * 0.02
;else
;kscrublast	=		kscrub
;endif

;kscrub	=		klen * 0.5 + gkcenterX * klen * 0.09
kscrub	init		0
kscrub	+=		gkactNorm1 * 0.0002

ascrub	=		a(kscrub) 

;ktimp		init		0
;ktimp		+=		ksmps/sr	; Phasor
;atimp1	=		ascrub + a(ktimp)
;atimp2	=		a(ktimp)
;atimp3	=		ascrub + atimp2 * 0.08

kamp		port		gkactNorm1, 0.12
;aEnv		table		atimp2, giTriangleWin, 1	; Window triggered by metro
kpitch	=		gkheight1
a1		mincer	ascrub, 1, kpitch, ktab, klock
;a3, a4	mincer	atimp3, kamp, kpitch + semitone(3), ktab, klock
;a5, a6	mincer	atimp3, kamp, kpitch + semitone(5), ktab, klock

fsig1		pvsanal	a1, 1024, 254, 1024, 0

kd_cX		diff		gkcenterX
kdcX		port		abs(kd_cX), 2.5
knumloudest = (int(kdcX * 2000000))+1

iblurtab	ftgentmp	0, 0, 256, -7, 0.20, 20, 0.29, 20, 0.06, 30, 0.06, 186, 0.06
kblurfact	table		int(knumloudest), iblurtab

fblurorig	pvsblur	fsig1, kblurfact, 0.3	

ftrace	pvstrace	fsig1, knumloudest
fblur		pvsblur	ftrace, 0.48, 0.5	
atrace	pvsynth	fblur
aorig		pvsynth	fblurorig

aL, aR	reverbsc	atrace, atrace, 0.7, 10000 , sr, 1.5
a1, a2	reverbsc	aorig, aorig, 0.55, 10000 , sr, 2.5

;outs		atrace, atrace
outs		a1*kamp+aL*kblurfact, a2*kamp+aR*kblurfact


endin

; Activity scrub
instr		4
kindex = 	int(gkactNorm2*giNumFiles)
ktab	=	giTabNums[kindex]
klock	=	1
klen	=	giTabLengths[kindex]/sr

; Table that maps activity (index) to frequency - concatenates two curves with different slopes
itabsize	=		4096					; Table size for envelope (linseg fashion)
ithreshpst	=		0.05					; Ratio of initial slope
ithresh		=		int(ithreshpst * itabsize)
ibegslope	=		-1 					; negative yields convex curve
iendslope	=		2					; positive yields concave curve
imedfreq	=		4
imax		=		14					; Maximal triggering frequency

iActMap	ftgentmp	0, 0, itabsize, -16, 0, ithresh, ibegslope, imedfreq, itabsize-ithresh, iendslope, imax
kindex	table	  	gkactNorm1, iActMap, 1
kmetro	metro		kindex

;if		kmetro == 1	then
;ktimp		=		0		; Metro reinits phasor
;endif

;kscrub	=		klen * 0.5 + gkcenterX * klen * 0.05
kscrub	init		0

kscrub	+=		gkactNorm1 * 0.0001
;kscrub	=		gkcenterX * klen

krand		jitter	0.005, 15, 30	
ascrub	=		a(kscrub+krand)


;ktimp		init		0
;ktimp		+=		ksmps/sr	; Phasor
;atimp1	=		ascrub + a(ktimp)
;atimp2	=		a(ktimp)
;atimp3	=		ascrub; + atimp2 * 0.08

kamp		=		0.2;port		gkactNorm1, 0.08
;aEnv		table		atimp2, giTriangleWin, 1
kpitch	=		gkheight1


a1		mincer	ascrub, kamp, kpitch, ktab, klock
;a1, a2	temposcal	(gkcenterX)-1+krand, kamp, kpitch, ktab, klock, 4096

f1		pvsanal	a1, 1024, 128, 1024, 1

fsmooth	pvsblur	f1, 0.05, 0.2

ftrace	pvstrace	f1, 10
atrace	pvsynth	ftrace
alim		limit		atrace, -0.005, 0.005
abal		balance	alim, a1

asmooth	pvsynth	fsmooth

amix		=		a1 * 0.3 + abal * 0.7
outs		asmooth, asmooth



endin

/* Manipulasjonsideer:
- Konvolusjon med seg selv, evt. med feedback
- Bygge harmonier - bedre å ha statisk pitch (type vocoder, kanskje?) enn frys for dette?
- Ulikt for stemme og andre ting?
- Frys - ha enkeltpartikler med statisk lyd: Bedre å bruke pvzfreeze enn mincer, kanskje?
- Mulig å bruke Longs-instrument fra Particles, bare med et utdrag fra FM/Longs?
- Lage en prosessering som strekker lyden samtidig som den gradvis fader ut/inn de deltonene som
er svakest. Dvs. gjør en sortering som blir progressivt smalere/bredere
- Analysere lyden med f.eks. praat (støy/tone) - bruke det til å styre f.eks. ulik spatialisering for ulik 
grader av støy/tone
*/
</CsInstruments>


<CsScore>
i1		0		72000
i2		0		72000
i3 		0		72000
</CsScore>


</CsoundSynthesizer>