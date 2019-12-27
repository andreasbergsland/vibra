<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>
sr      	=			48000
0dbfs		=			1
nchnls	=			2


		instr    		readSet
SFolder	=			"/Users/andber/Lydbibliotek/DAMP_Intonation_Dataset/vocal_tracks"
SExt		=			".wav"
gSFiles[]	directory		SFolder, SExt
giNumFiles	=			lenarray(gSFiles)
		print			giNumFiles

iFileNum	init			0
until	iFileNum > 2 do
		event_i		"i", "getInfo", 0, 99999, iFileNum
 iFileNum	+=			1
od
turnoff
		endin

		instr			getInfo

kTime		times
giTab		ftgen 		0, 0, 0, -1, gSFiles[p4], 0, 0, 0
iChn		=			ftchnls(giTab)
iSr		=			ftsr(giTab)
iSamp		=			nsamp(giTab)
iDur		=			iSr != 0? iSamp/iSr: iSamp/sr

aPhas		phasor		1/iDur
if	iChn == 1	then
aSnd		table			aPhas, giTab, 1
elseif iChn == 2	then
aL		table			aPhas, giTab, 1
aR		table			aPhas, giTab, 1
aSnd		=			(aL+aR) * 0.5
endif

; Count the occurrences of dB zones (1 per dB)
kRMS		=			int(dbamp(rms(aSnd, 24)))
kdB_Count[]	init			120
kN		init			0
kMetro	metro			24
if kMetro == 1	then
 kdB_Count[kRMS+120] =		kdB_Count[kRMS+120] + 1
 kN		+=			1
endif	
		out			aSnd

kMean[]	init			120
kndx		init			0
kAccum	init			0
if		kTime > iDur	then
 until	kndx > 120-7	do
  kIndx2	=			kndx
  kSum	=			0
  until      kIndx2 > kndx+6	do
   kSum	+=			kdB_Count[kIndx2]	
   kIndx2	+=			1
  od
  kMean[kndx]=			kSum/7
  kDiff	=			(kndx > 1)? kMean[kndx]-kMean[kndx-1]: 0
  kMeanPrcnt =			divz(kMean[kndx], kN, 1)*100
  kAccum	+=			kMeanPrcnt
;  printf	"%i dB to %idB: %f %% occurrences of dB values, diff=%f\n", kndx, kndx-120, kndx+7-120, kMeanPrcnt, kDiff	
  kndx	+=			1
 od
; Find the first peak in mean values counting from low dB values.
 kIndx3	=			0
 kMax		=			0
 kMin		=			100
 until kIndx3 > 120 - 7
  if  kMean[kIndx3] > kMax then
   kMax	=			kMean[kIndx3]
   kMaxIndex=			kIndx3
  endif
  if	kMean[kIndx3] < kMin && kAccum > 5.0 then
   kMin	=			kMean[kIndx3]
   kMaxIndex=			kIndx3
  endif
 od
 printf "Max = %f, Min = %f"
 turnoff
endif


		endin


</CsInstruments>
<CsScore>
i"readSet"	0	  100
</CsScore>
</CsoundSynthesizer>
