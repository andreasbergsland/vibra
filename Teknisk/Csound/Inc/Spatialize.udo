
; *********************************************
; Spatialize.udo
; input: statisk"iii" (azi, dist, spread), euler "fff", quaternions "ffff" (normalisert), gyro "fff"

opcode	Spatialize, kkk, kk[]k[]k[]k[]
kMethod, kStatic[], kEuler[], kQuats[], kGyro[]	xin
kStatic[]	init		3
kGyro[]	init		3
kQuats[]	init		4
kGyro[]	init		3
kSpeed[]	init		3
kAzi		=		0	
kDist		=		2
kSpread	=		1
if	kMethod == 0	then		; Static values
kAzi	=	kStatic[0]
kDist	=	kStatic[1]
kSpread=	kStatic[2]
elseif	kMethod == 1	then	; Rotation - change speed, direction + distance
kInt[],kIntSum 	Accel_intensity	kGyro
kSlowInt	port	 		kIntSum*0.000006, 1.5
kFastInt	port			kIntSum*0.00005, 0.3
kSwitch	init			1
kTrig		trigger		kFastInt, 0.01, 1
kSwitch	=			(kTrig==1)? kSwitch*-1: kSwitch
kPhas		phasor		kSlowInt * kSwitch
kAzi		=			kPhas * 360
kOsc		oscil			kSlowInt*6, kSlowInt, -1, 0.25
kDist		=			6 + kOsc
elseif kMethod == 2	then		; Avstand
kInt[],kIntSum 	Accel_intensity	kGyro
kSlowInt	=			downsamp(tone(a(kIntSum*0.00005), 0.3))
iDistab	ftgentmp		0, 0, 1024, -16, 30, 100, 0, 30, 800, -5, 2, 124, 0, 1.99
kDist		table			kSlowInt, iDistab, 1
kAziTrig	trigger		kDist, 2, 1
kIncTrig	init			0
kIncTrig	+=			kAziTrig
kAzi		port			kIncTrig*135, 4
elseif kMethod == 3	then		; Rolig rotasjon
kAzi		=	(oscil(180,0.01))
kDist		=	(oscil(2,0.05)) + 6
elseif kMethod == 4	then		; Vill
kAzi		rspline	0, 360, 0.2, 1.4
kDist		=		2
elseif kMethod == 5	then		; 
kAzi		=	(oscil(180,0.1))
elseif kMethod == 6	then		; Grupper(1)
kAzi		=	(oscil(180,0.1))
elseif kMethod == 7	then		; Grupper(2)
kAzi		=	(oscil(180,0.1))
elseif kMethod == 9	then		; Suserforbi
kAzi		=	(oscil(180,0.1))
else
kAzi		=	(oscil(180,0.1))
endif
xout	kAzi, kDist, kSpread
endop

