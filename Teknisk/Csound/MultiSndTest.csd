<CsoundSynthesizer>

<CsOptions>
-odac0
</CsOptions>


<CsInstruments>
0dbfs	=	1
nchnls=	2

opcode	MultiSnd, a[], a[]k[]kiio
arr[], kPitch[], kLoopstart, iSndTab, iNumSnds, icnt	xin
iLen	=		ftlen(iSndTab)
kPitch[]	init	iNumSnds
arr[]	init		iNumSnds
if icnt >= iNumSnds-1 goto body
arr[]	MultiSnd	arr, kPitch, kLoopstart, iSndTab, iNumSnds, icnt+1
body:
arr[icnt]	lposcil	0.1, kPitch[icnt], kLoopstart, sr, iSndTab
xout arr
endop

giSnd		ftgen		0, 0, 0, 1, "Radio/M_EnSangTe.wav", 0, 0, 0

instr	1
arr[]	init	8
ktrig	metro	1
kLoopstart	=		int(trandom(ktrig, 0, ftlen(giSnd)))
printk2	kLoopstart
kPitch[] fillarray	1.001, 1.002, 1.004, 1.006, 0.998, 0.991, 0.994, 0.992
kLoopstart	=	0
arr[]	MultiSnd	arr, kPitch, kLoopstart, giSnd, 8

outs	arr[0]+arr[1]+arr[2]+arr[3], arr[4]+arr[5]+arr[6]+arr[7]

endin
</CsInstruments>


<CsScore>
i1	0	100
</CsScore>


</CsoundSynthesizer>