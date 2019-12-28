<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr      =			48000
0dbfs		=			1
nchnls	=			2
#include	"Inc/UC44.udo"

#include	"Inc/Table_array.udo"

#include	"Inc/Onsets_kArray.udo"

#include	"Inc/Schedkwhen_array.udo"

#include	"Inc/Metro_a.udo"

#include	"Inc/Upsamptrig.udo"

#include	"Inc/Delta_array.udo"

#include	"Inc/IMU_intensity.udo"

#include	"Inc/Portk_array.udo"

giNGIMU1	OSCinit	8034

instr    1
gkNG1Eul[]	init		3
kNG1Echg, gkNG1Eul	OSClisten	giNGIMU1, "/euler", "fff"
kNG1LinAbs[]	init		3
kNG1LinAbs		maparray	gkNG1Eul, "abs"
kNG1Lin[]		init		3
kNG1Lin		Portk_array		gkNG1Eul, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG1LinTab[]	init		3
gkNG1LinTab		Table_array	kNG1Lin, iLinTab, 1
printarray	gkNG1LinTab


endin
</CsInstruments>
<CsScore>
i1	0	  100
</CsScore>
</CsoundSynthesizer>