<CsoundSynthesizer>

<CsOptions>
-odac0 -b128 -B256 -Ma
</CsOptions>


<CsInstruments>
0dbfs		=		1

gih		OSCinit		7000
#include	"Inc/OSClistenArray.udo"

#include	"/Users/andber/Csound/UDOs/UC44.udo"

giFun		ftgen			0, 0, 0, -1, "/Users/andber/Csound/SSDIR/N_BBC_news.wav", 0, 0, 0

instr		1
kEMG[]	init			8
kEMG		OSClistenArray	gih, "/EMG", "ffffffff"

gkCtrlArr[][][]	init		2, 10, 17
gkIndices[]		init		3	
gkCtrlArr, gkIndices	UC44			1, 1

; Turn instruments on and off with green buttons
if	trigger:k(gkCtrlArr[0][1][gkIndices[2]], 0.1, 0)==1 then
event	"i", gkIndices[2]+10, 0, 1000, gkCtrlArr[0][1][gkIndices[2]]
elseif trigger:k(gkCtrlArr[0][1][gkIndices[2]], 0.1, 1)==1 then
printf	"Turning off instr %i\n", gkIndices[2]+10, gkIndices[2]+10
turnoff2 (gkIndices[2]+10), 0, 0
endif

endin


instr		11, 12, 13, 14, 15, 16, 17, 18
printf	"Turning on instrument %i\n", p1, p1
ival		=		p4
kamp		=		port(gkCtrlArr[0][0][p1-10],0.01)
out(oscil((0.1 * kamp),cpspch(7.00+p1*0.01)))
;a2		init		0
;if iChn == 1	then
;iLen		=		ftlen(giFun)
;aAmp		=		0.2
;kTransp	=		0.9 + (p1-10)*0.1
;aSnd		lposcila	aAmp, kTransp, 0, iLen, giFun	
;out		aSnd * gkCtrlArr[0][0][p1-10]
;elseif iChn == 2	then
;iLen		=		ftlen(iFun)*0.5
;a1, a2	lposcilsa2	aAmp, kTransp, 0, iLen, giFun	
;aSnd		=		(a1 + a2) * 0.5
;endif
endin

</CsInstruments>
<CsScore>
i1	0	1000
</CsScore>


</CsoundSynthesizer>