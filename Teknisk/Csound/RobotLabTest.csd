<CsoundSynthesizer>
<CsOptions>
-odac	-B256 -b128 -m0 -Ma
</CsOptions>

<CsInstruments>
0dbfs	=	1

gihandle	OSCinit	9000

giNGIMU1		OSCinit	8033
giNGIMU2		OSCinit	8035	
giNGIMU3		OSCinit	8036	; Lilian
giNGIMU4		OSCinit	8037	
giNGIMU5		OSCinit	8034	; Kirsi

#include	"Inc/Delta_array.udo"

#include	"Inc/IMU_intensity.udo"

#include	"Inc/Portk_array.udo"

#include	"Inc/Table_array.udo"

#include	"Inc/UC44.udo"

#include	"Inc/NGIMU.inc"

nchnls	=		2

		seed		0
	
git2		ftgen	0, 0, 1024, -7, 0, 24, 0, 1000, 1
git3		ftgen	0, 0, 1024, -7, 0, 64, 0, 940, 1
git4		ftgen	0, 0, 1024, -7, 0, 84, 0, 920, 1
git4		ftgen	0, 0, 1024, -7, 0, 124, 0, 900, 1
git5		ftgen	0, 0, 1024, -7, 0, 144, 0, 860, 1

instr		1

; Get MIDI control data from UC44---------
gkCtrl[][]		init		10, 17
; dim1: widget group (0 = sliders, 1 = green buttons, 2 = grey buttons, 3-10 encoders)
; dim2: strip/controller number
gkCtrl		UC44		1, 0
;-----------------------------------------

#include	"Inc/NGIMU.inc"

SFiles[]	directory	"/Users/andber/Lydbibliotek/DAMP_Intonation_Dataset/W", ".wav"
giNumFiles	lenarray	SFiles
print		giNumFiles
;
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



kX1, kY1, kX2, kY2, kCount	init	0
kdata[]		init		31
kans, kdata		OSClisten gihandle, "/data", "fffffffffffffffffffffffffffffff"

kNumber		=		kdata[0]
gkDistance	=		sqrt((kdata[3]-kdata[1])^2 + (kdata[4]-kdata[2])^2)

gkP1		=		kdata[2]== 0? 0: 1
gkP2		=		kdata[4]== 0? 0: 1
gkP3		=		kdata[6]== 0? 0: 1
gkP4		=		kdata[8]== 0? 0: 1
gkP5		=		kdata[10]== 0? 0: 1
gkP6		=		kdata[12]== 0? 0: 1
gkP7		=		kdata[14]== 0? 0: 1
gkP8		=		kdata[16]== 0? 0: 1
gkP9		=		kdata[18]== 0? 0: 1
gkP10		=		kdata[20]== 0? 0: 1
gkP11		=		kdata[22]== 0? 0: 1
gkP12		=		kdata[24]== 0? 0: 1
gkP14		=		kdata[26]== 0? 0: 1
gkP15		=		kdata[28]== 0? 0: 1

;printk2	

gkDistance	port		gkDistance, 0.1

itrig1	ftgentmp	0, 0, 1024, -7, 0.4, 120, 0.4,0,0.8,100,0.8,0, 1.6,100, 1.6, 0, 3.2, 200, 6, 804, 25
;itrig2	ftgentmp	0, 0, 1024, -7, 0.4, 120, 0.4,0,0.8,100, 200, 6, 804, 25

krndfrek1	table		gkDistance*40, itrig1
krndfrek2	table		gkDistance*40, itrig1

krandtrig2	metro		krndfrek1
krandtrig1	metro		krndfrek2

;printk2	krndfrek1

kfrek		=		gkDistance + rspline(gkDistance*0.9, gkDistance*1.1, 2, 3)
krandtab	=		int(random:k(1, 44))
ktab1		=		krandtrig1 == 1? krandtab: ktab1
ktab2		=		krandtrig2 == 1? krandtab: ktab2
;ktab3		=		krandtrig3 == 1? krandtab: ktab3
;ktab4		=		krandtrig4 == 1? krandtab: ktab4
;ktab5		=		krandtrig5 == 1? krandtab: ktab5
;ktab6		=		krandtrig6 == 1? krandtab: ktab6
kdur		=		gkDistance != 0? (2/gkDistance) : 1
;printk	0.5, gkDistance

kmetro	metro		gkDistance
koffset	=		phasor(0.5) * 2
;		schedkwhen	kmetro*gkP1, 0, 0, 2, 0, kdur, ktab1, koffset, 1
;		schedkwhen	kmetro*gkP2, 0, 0, 3, 0, kdur, ktab2, koffset, 0

;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab3, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab4, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab5, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab6, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab7, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab8, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab9, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab10, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab11, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab12, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab13, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab14, koffset
;		schedkwhen	kmetro, 0, 0, 2, 0, kdur, ktab15, koffset
;printk2	kX1, 50
gaSendL	init		0
gaSendR	init		0
;out(vco2(0.03,100 + 20 * kX2))
endin

		instr		2, 3

ktime		timeinsts
ioffset	=		p5
kpan		=		p6
if p1 == 2	then
ktab		=		giTabNums[int(gkCtrl[0][7]*44) + 1]
elseif p1 == 3 then
ktab		=		giTabNums[int(gkCtrl[0][8]*44) + 1]
endif

krand		rspline	0.015, 0.02, 1, 2
apointer	=		phasor(0.003) +  ioffset + a(krand)
;kstart	=		ioffset
atimp		=		apointer
kamp		=		0.1
kpitch	=		1
iLen		=		giTabLengths[p4] /sr


kstart	=		0
kend		=		iLen
;aout		mincer	kamp, kpitch, kstart, kend, 0.1, itab
a1		mincer	atimp, kpitch, kpitch, ktab, 1
a2		mincer	atimp, kpitch, semitone(2), ktab, 1
a3		mincer	atimp, kpitch, semitone(-2), ktab, 1
a4		mincer	atimp, kpitch, semitone(3), ktab, 1
a5		mincer	atimp, kpitch, semitone(7), ktab, 1


if	p1 == 2	then
kvol	=	gkNG3Q_mag
kpan	=	0
elseif p1 == 3	then
kpan	=	1
kvol	=	gkN5Q_mag
endif

;a1		=		a1 * port(kvol, 0.33)
;a2		=		a2 * port(kvol,0.3); (table(port(gkNG4Q_mag, 0.3),git2))
;a3		=		a3 * port(kvol, 0.27); (table(port(gkNG4Q_mag, 0.3),git2))
;a4		=		a4 * port(kvol, 0.22); (table(port(gkNG4Q_mag, 0.3),git2))
;a5		=		a5 * port(kvol, 0.18); (table(port(gkNG4Q_mag, 0.3),git2))
;

a1		=		a1 * port(kvol, 0.33)
a2		=		a2 * (table(port(kvol, 0.3),git2,1))
a3		=		a3 * (table(port(kvol, 0.3),git3,1))
a4		=		a4 * (table(port(kvol, 0.3),git4,1))
a5		=		a5 * (table(port(kvol, 0.3),git5,1))

;if ktime > iLen	then
; turnoff
;endif


aL, aR	pan2		(a1+a2+a3+a4+a5) , kpan

gaSendL	+=		aL
gaSendR	+=		aR
endin


; **************MIxer

instr		10

;printk2	gkDistance


kmix			=		0.52

ivoltab		ftgentmp	0, 0, 1024, -7, 1, 200, 0.01, 8024, 0.00001
kDistvol		table		gkDistance/25, ivoltab

;if gkCtrl[1][16]	=	0	then
;kVolume	=	gkDistance
;else
;kVolume	=	1
;endif

awetL, awetR	reverbsc	gaSendL, gaSendR, 0.85, 12000, sr, 1.5
amixL			ntrpol	gaSendL, awetL, kmix
amixR			ntrpol	gaSendR, awetR, kmix	
adistL		limit		amixL, -0.001, 0.001
adistR		limit		amixR, -0.001, 0.001

adistmixL		ntrpol	amixL, adistL*20, gkCtrl[0][1]
adistmixR		ntrpol	amixR, adistR*20, gkCtrl[0][1]

		outs			adistmixL*gkCtrl[0][16]*2, adistmixR*gkCtrl[0][16]*2

gaSendL	=		0
gaSendR	=		0

endin





</CsInstruments>
<CsScore>
i1	0	10000
i2	 0	 10000	 	3 	0
i3	 0	 10000	 	4 	0
i10	0	10000
</CsScore>


</CsoundSynthesizer>