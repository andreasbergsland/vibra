<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>


<CsInstruments>
	opcode	Mediank_array, k[], k[]kio
kArr_in[], kwinsize, imaxsize, icnt	xin
iLen		lenarray	kArr_in
kArr[]	init		iLen
kDum[]	init		iLen
if icnt >=	iLen-1 igoto cont
kDum		Mediank_array	kArr_in, kwinsize, imaxsize, icnt+1
cont:
kArr[icnt]		mediank	kArr_in[icnt], kwinsize, imaxsize
print	icnt
xout	kArr
endop

instr	1
kArr_in[]		init			2
kArr_in[0]		lfo			1, 2, 1
kArr_in[1]		lfo			-1, 2, 1
kArr_out[]		init			(lenarray(kArr_in))
kArr_out		Mediank_array	kArr_in, 5, 10
endin


</CsInstruments>


<CsScore>
i1	0	5
</CsScore>


</CsoundSynthesizer>