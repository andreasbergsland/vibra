<CsoundSynthesizer>

<CsOptions>
-odac -b128 -B256
</CsOptions>


<CsInstruments>
0dbfs	=	1
gih	OSCinit	9999

instr	1
kval	init	0
kans	OSClisten	gih, "/accel", "f", kval
afilt	butlp	a(kval), 6
;kcps, krms 	pitchamdf	afilt, 0.5, 6, 1.2

printk2 kcps
endin
</CsInstruments>


<CsScore>
i1	0	100
</CsScore>


</CsoundSynthesizer>