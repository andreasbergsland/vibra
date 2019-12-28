<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr      =			48000
0dbfs		=			1
nchnls	=			2

instr    1
SDirectory	=		"/Users/andber/Desktop/VIBRA/Teknisk/Csound/SND"
iNumberOfFile ftsamplebank SDirectory, 1, 0, 6, 1
print	iNumberOfFile

endin
</CsInstruments>
<CsScore>
i1	0	  100
</CsScore>
</CsoundSynthesizer>