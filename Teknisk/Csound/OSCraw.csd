<CsoundSynthesizer>
<CsOptions>
-odac0	-b128 -B256
</CsOptions>
<CsInstruments>
instr	1
Smess[] init 30
top:
Smess,ka OSCraw 6160
kn = 0
while kn < ka do
  printf ": %s ", kn+1, Smess[kn]
  kn += 1
od
printf "%d items\n", ka, kn
if ka > 0 kgoto top
endin
</CsInstruments>
<CsScore>
i1	0	100
</CsScore>


</CsoundSynthesizer>