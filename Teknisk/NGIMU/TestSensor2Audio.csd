<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>


<CsInstruments>
nchnls	=		2
0dbfs		=		1

giCircles 	ftgen		0, 0, 0, 23, "/Users/andber/Desktop/VIBRA/Teknisk/NGIMU/NGIMU_recordings/NGIMU_take2_circles.txt"
giWavTab	ftgen		0, 0, 32768, 10, 0
giSine		ftgen	0, 0, 65537, 10, 1
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90

#include	"/Users/andber/Desktop/VIBRA/Teknisk/Csound/Inc/Metro_a.udo"


instr		1
iLen	=	ftlen(giCircles)

indx		=	1
indx2 	= 	0
Loop:
ival		table		indx, giCircles
		tablew 	ival*0.2, indx2, giWavTab
indx2		+=	1
loop_lt	indx, 3, iLen-1, Loop

icps		=		1
aphas		phasor	icps
ioffset	=		0.12
isize		=		0.83
aphas		=		aphas * isize + ioffset
		
a1		table		aphas, giWavTab, 1
;a1		table		aphas, giWavTab, 1

async, ksync		Metro_a	2, 0

kgrainfreq	= 		0	; 4 grains per second
kdistribution	= 0.8			; periodic grain distribution
idisttab	= -1			; (default) flat distribution used for grain distribution
;async		= 0			; no sync input
kenv2amt	= 0			; no secondary enveloping
ienv2tab	= -1			; default secondary envelope (flat)
ienv_attack	= -1 ;			; default attack envelope (flat)
ienv_decay	= -1 ;			; default decay envelope (flat)
ksustain_amount	= 0.5			; time (in fraction of grain dur) at sustain level for each grain
ka_d_ratio	= 0.5 			; balance between attack and decay time
kduration	= 800	; set grain duration relative to grain rate
kamp		= 1			; amp
igainmasks	= -1			; (default) no gain masking
kwavfreq	= 20			; fundamental frequency of source waveform
ksweepshape	= 0			; shape of frequency sweep (0=no sweep)
iwavfreqstarttab = -1			; default frequency sweep start (value in table = 1, which give no frequency modification)
iwavfreqendtab	= -1			; default frequency sweep end (value in table = 1, which give no frequency modification)
awavfm		= 0			; no FM input
ifmamptab	= -1			; default FM scaling (=1)
kfmenv		= -1			; default FM envelope (flat)
icosine		= giCosine		; cosine ftable
kTrainCps	= kgrainfreq		; set trainlet cps equal to grain rate for single-cycle trainlet in each grain
knumpartials	= 3			; number of partials in trainlet
kchroma		= 1			; balance of partials in trainlet
ichannelmasks	= -1			; (default) no channel masking, all grains to output 1
krandommask	= 0			; no random grain masking
kwaveform1	= giWavTab		; source waveforms
kwaveform2	= giWavTab		;
kwaveform3	= giWavTab		;
kwaveform4	= giWavTab		;
iwaveamptab	= -1			; (default) equal mix of all 4 sourcve waveforms and no amp for trainlets
asamplepos1	=	a(trandom(ksync,0, 0.9))			; phase offset for reading source waveform
asamplepos2	= 0			;
asamplepos3	= 0			;
asamplepos4	= 0			;
kwavekey1	= 1			; original key for source waveform
kwavekey2	= 1			;
kwavekey3	= 1			;
kwavekey4	= 1			;
imax_grains	= 100			; max grains per k period

asig	partikkel kgrainfreq, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
               ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
               kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
               ifmamptab, kfmenv, icosine, kTrainCps, knumpartials, \
               kchroma, ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
               iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
               kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains

outs		asig, asig
endin


</CsInstruments>


<CsScore>
i1	0	10
</CsScore>


</CsoundSynthesizer>