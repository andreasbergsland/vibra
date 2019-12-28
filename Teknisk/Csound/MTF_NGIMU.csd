<CsoundSynthesizer>

<CsOptions>
-odac0	-b128 -B256
</CsOptions>


<CsInstruments>
0dbfs		=		1

#include	"Inc/OSClistenArray.udo"

giFromMax	OSCinit	7777

instr	1
gkQuats[]	init	4

gkQuats	OSClistenArray	giFromMax, "/Quats", "ffff"
kIntensity	init			0
kans		OSClisten		giFromMax, "/Intensity", "f", kIntensity

schedkwhen	trigger:k(kIntensity,0.01,0), 0, 1, 2, 0, 0.02

endin

instr	2
out(a(linseg(1, 0.02, 0)))
endin


</CsInstruments>


<CsScore>
#define ALWAYSON	#999999#
i1	0	$ALWAYSON
</CsScore>


</CsoundSynthesizer>