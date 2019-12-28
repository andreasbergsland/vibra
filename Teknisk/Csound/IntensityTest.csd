<CsoundSynthesizer>

<CsOptions>
-odac0 -b64	-B128
</CsOptions>


<CsInstruments>
0dbfs		=		1
ksmps		=		16

#include	"Inc/OSClistenArray.udo"

#include	"Inc/OSCsendArray.udo"

#include	"Inc/Delta_array.udo"

#include	"Inc/Accel_intensity.udo"

giPortHandle	OSCinit	1234
instr		1
SAddressIn	=	"/intensity"
STypes	=	"fff"
kArr[]	init		3
kArr		OSClistenArray	giPortHandle, SAddressIn, STypes
;kArr		Delta_array		kArr, 0.05, 0.05
kInt,kArr	Accel_intensity	kArr, 0
kTrig		changed		kArr[0]
SHost		=			""
SAddress	=			"/csound"
		OSCsend		kTrig, SHost, 1111, SAddress , "ffff", kInt, kArr[0], kArr[1], kArr[2]

aInt		=		tone(a(kInt),50)
out(oscil(0.2*aInt, 440))

endin
</CsInstruments>


<CsScore>
i1	0	1000
</CsScore>


</CsoundSynthesizer>