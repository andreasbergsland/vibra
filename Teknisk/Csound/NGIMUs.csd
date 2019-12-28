<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>


<CsInstruments>
#include	"Inc/NGIMUs.udo"

gi1		OSCinit	8035
gi2		OSCinit	8036

instr		1
kArr[][]	init		2, 3
iPorts[]	fillarray	gi1, gi2
SData		=		"eql"
kArr		NGIMUs	iPorts, SData

endin
</CsInstruments>
<CsScore>
i1	0	10
</CsScore>


</CsoundSynthesizer>