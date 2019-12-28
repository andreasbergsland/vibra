<CsoundSynthesizer>

<CsOptions>
-odac0
</CsOptions>

<CsInstruments>
0dbfs		=		1

gih		OSCinit	54321

instr		1

kact		init		0
kcentX	init		0
kheight	init		0
kwidth	init		0
ksens		init		0
koh		init		0
kans		OSClisten	gih, "/MC", "ffffii", kact, kcentX, kheight, kwidth, ksens, koh
printk	0.1,	kcentX
out(oscil(port(kact*0.4,0.03), 200+kcentX*400))

endin

</CsInstruments>


<CsScore>
i1		0	100
</CsScore>


</CsoundSynthesizer>