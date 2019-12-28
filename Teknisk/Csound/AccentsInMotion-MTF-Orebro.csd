/*
**************************************************************************************************
		Particles for MotionComposer 3.0
		Copyright (C) 2019  Andreas Bergsland
		Correspondence: andreas.bergsland@ntnu.no
**************************************************************************************************
*/
<CsoundSynthesizer>
<CsOptions>
; uncomment/comment to choose appropriate options, be sure to set the path where /particles is located
; options for OSX (dev):
-odac1 --omacro:Path=/Users/andber/Desktop/VIBRA/Teknisk/Csound/particlesVIBRA/ -B256 -b128 -m0 -Ma
; options for Xubuntu 18.04 LTS on FusionSystems PC:
;-+rtaudio=alsa -odac hw:0,0 --omacro:Path=/home/fusionsystems/Dokumente/particles/ -B256 -b128  -m0
</CsOptions>
<CsInstruments>
;***************************************************************************************'***********
sr		=		48000	; Sample rate matches sound files
ksmps		=		64	; Samples per control period - gives a kr period of 1.33ms
nchnls	=		4	; 4 chn
0dbfs		=		1	; Maximum 0dB reference level
;**************************************************************************************************
;		INITIATE GLOBAL VARIABLES AND CHANNELS, FTABLES AND GUI
;**************************************************************************************************

giNGIMU1	OSCinit		8034
giNGIMU2	OSCinit		8035
giNGIMU3	OSCinit		8036
giNGIMU4	OSCinit		8037
giNGIMU5	OSCinit		8038

#define	ALWAYSON		# 999999 #

#include	"Inc/UC44.udo"

#include	"Inc/Table_array.udo"

#include	"Inc/Onsets_kArray.udo"

#include	"Inc/Schedkwhen_array.udo"

#include	"Inc/Metro_a.udo"

#include	"Inc/Upsamptrig.udo"

#include	"Inc/Delta_array.udo"

#include	"Inc/IMU_intensity.udo"

#include	"Inc/Portk_array.udo"

#include	"Inc/NGIMU.inc"

#include	"RiOT_2D.inc"

$RIOT2D(5'8001)


</CsInstruments>


<CsScore>

</CsScore>


</CsoundSynthesizer>