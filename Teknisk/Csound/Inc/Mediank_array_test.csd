<CsoundSynthesizer>

<CsOptions>
-odac0
</CsOptions>


<CsInstruments>
seed	0

0dbfs	=	1
#include "/Users/andber/Desktop/VIBRA/Teknisk/Csound/Inc/OSClistenArray.udo"

opcode Mediank_array ,k[],k[]kio
kArr[], kSize, iMaxSize, icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] Mediank_array kArr, kSize, iMaxSize, icnt+1
body:
kArr[icnt]	mediank	kArr[icnt], kSize, iMaxSize
xout kArr
endop

gih	OSCinit	12345

instr       1
kEMG[] init 8
kFilt[] init 8

kEMG	OSClistenArray	gih, "/emg", "ffffffff"
kFilt	Mediank_array	kEMG, 50, 100

;out(oscil(kFilt[0], 330))

;kTrig	changed 	kFilt[6]
;	OSCsend	kTrig, "localhost", 54321, "/myo", "ffffffff", kFilt[0], kFilt[1], kFilt[2], kFilt[3], kFilt[4], kFilt[5], kFilt[6], kFilt[7]
;	printk2	kFilt[1]
;	printk2	kFilt[6], 20
endin
</CsInstruments>
	

<CsScore>
i1	0	10
</CsScore>


</CsoundSynthesizer>