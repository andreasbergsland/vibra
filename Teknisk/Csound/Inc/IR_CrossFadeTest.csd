<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr      =			48000
0dbfs		=			1
nchnls	=			2

giIR_maxlen	=	2^17
print	giIR_maxlen/sr
giIR_rec1 ftgen 0, 0, giIR_maxlen, 2, 1, 0
giIR_rec2 ftgen 0, 0, giIR_maxlen, 2, 1, 0

;1, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/IslaMujeresCave.wav", 0, 0, 1
gi_IR1 	ftgen	1, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/ByronGlacier.wav", 0, 0, 1
gi_IR2	ftgen	2, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/CliffOfTheDawn.wav", 0, 0, 1
gi_IR3	ftgen	3, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/DevilsPunchbowl.wav", 0, 0, 1
gi_IR4	ftgen	4, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/DivorceBeach.wav", 0, 0, 1
gi_IR4	ftgen	5, 0, 0, 1, "/Users/andber/Csound/IR/EchoThiefImpulseResponseLibrary/Nature/IslaMujeresCave.wav", 0, 0, 1

		instr    	1
gaSnd[]	init		2
gaSend[]	init		4
kfadeTime	init		0
kActive	init		1
; Read input sound
gaSnd[0]	diskin2	"/Users/andber/Lydbibliotek/Diverse folk/Odeon_Anechoic_Crowd sounds/Clapping1.wav"
gaSnd[1]	=		gaSnd[0]

gkIR		init		1
gkIR		=		int(linseg(1, 20, 5))

kSwitch	init		0.5
kIR_chg	changed	gkIR
if 	kIR_chg == 1	then
kSwitch	*=		-1
kActive	=		1.5 + kSwitch
endif

		schedkwhen	kIR_chg, 0, 2, 2, 0, 999999, kActive
; If IR changes than trigger new IR instrument

		endin

; IR instrument

		instr		2
iTab		=		(p4==1)? giIR_rec1: giIR_rec2
iplen		=		2048	;  length of impulse response partitions (latency <-> CPU usage)
kupdate 	init		1
kclear	=		0
aSnd		=		(gaSnd[0] + gaSnd[1]) * 0.5

aconv		liveconv 	aSnd, giIR_rec1, iplen, kupdate, kclear

kMix		=		0.5
aL		=		(kMix * aconv * 0.25 + gaSnd[0]*(1-kMix)) 
aR		=		(kMix * aconv * 0.25 + gaSnd[0]*(1-kMix)) 
iChn		=		(p4==1)? 0: 2
gaSend[0+iChn]	=		gaSend[0+iChn] + aL
gaSend[1+iChn]	=		gaSend[1+iChn] + aR

kupdate	=		0

kndx		init		0
kndx		+=		ksmps
if		kndx>=giIR_maxlen	then
kndx		=		0
kupdate 	= 		1
endif
asamp		tablekt	a(kndx), gkIR
		tablew	asamp, a(kndx), iTab

kfade		linsegr	0, 1, 1, p3, 1, 1, 0

		outs		aconv*kfade, aconv*kfade
;		clear		gaSnd[0], gaSnd[1]
endin





</CsInstruments>
<CsScore>
i1	0	  1000
</CsScore>
</CsoundSynthesizer>