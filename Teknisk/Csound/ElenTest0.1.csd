<CsoundSynthesizer>

<CsOptions>
-odac2 -b128 -B256
</CsOptions>


<CsInstruments>
0dbfs	=		1
nchnls =		2
gih	OSCinit	8034

instr 1
kX, kY, kZ	init		0
kans		OSClisten	gih, "/linear", "fff", kX, kY, kZ
;kans		OSClisten	gih, "/euler", "fff", k

klastX	init		0
kJerk		=		kX-klastX

ktrig		trigger	kJerk, 0.22, 0

klastX	=		kX
schedkwhen(ktrig, 0.2, 1, 2, 0, 0.1)

endin

instr		2
a1,a2		diskin2	"Cello.wav", 1, 0.2
outs		a1, a2
endin
</CsInstruments>

<CsScore>
i1	0	10
;i2	0	10
</CsScore>

</CsoundSynthesizer>