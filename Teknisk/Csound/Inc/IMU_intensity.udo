/*
Opcode for making a normalized intensity value
from either the acceleration or gyro sensor value
of an IMU.
Based on the Max object intensity by IRCAM
*/

opcode	IMU_intensity, k[]k,k[]oo
kArr[], iSwitch, icnt		xin
if	iSwitch == 0	then
; When 0, use values for accelerometer
ia	=	0.8
ib	=	0.1
else
; Else, use values for gyro
ia	=	0.9
ib	=	1
kArr[0] = kArr[0]*0.0027777778
kArr[1] = kArr[1]*0.0027777778
kArr[2] = kArr[2]*0.0027777778
endif
kx1[]	init	lenarray(kArr)
kx2[]	init	lenarray(kArr)
kdx[]	init	lenarray(kArr)
ky[]	init	lenarray(kArr)

if icnt >= lenarray(kArr)-1 goto body
kArr[],kSum IMU_intensity kArr, iSwitch, icnt+1
body:

if	kArr[icnt] != kx1[icnt]	then
ky[icnt]	=	kdx[icnt] + ky[icnt]*ia		; Step based low pass filter (time independent)
kx2[icnt]	=	kx1[icnt]
kx1[icnt]	=	kArr[icnt]
kdx[icnt]	=	abs(kx2[icnt] - kArr[icnt])		; Delta with three points (changed values)
endif
kArr[icnt]	=	(ky[icnt]*ib)^2
xout	kArr, sumarray(kArr)
endop