/*
 Process_euler
 UDO that processes a euler array in different useful ways:
 1. Delta (1.derivation) - calculate everytime a new value is received or at a fixed delay time
 2. Unwrapping to prevent jumps in the value when crossing from -180 to 180 or vice versa
 3. Calculate normalized magnitude (quantity of movement in any direction)

udo that gives the delta (differentiatiation/rate of change) for an euler array (xyz) input
; and compensates for jumps between -180 and 180 for the euler values (phase unwrapping)
; kOut[]	Process_euler		kArr[], kNewMess
*/
opcode	Process_euler, k[], k[]kio
kArr[], kdeltime, imaxdel, icnt		xin
kDel[]	init		lenarray(kArr)
if icnt >= lenarray(kArr)-1 goto body
kArr[] Delta_array kArr, kdeltime, imaxdel, icnt+1

body:	
kDel[icnt]		vdel_k		kArr[icnt], kdeltime, imaxdel	; Delay
if	(kArr[icnt] - kDel[icnt]) > 300	then
kArr[icnt]		=			(kArr[icnt] - kDel[icnt] - 360)
elseif (kArr[icnt] - kDel[icnt]) < -300	then
kArr[icnt]		=			(kArr[icnt] - kDel[icnt] + 360)
else
kArr[icnt]		=			(kArr[icnt] - kDel[icnt])
endif
xout	kArr
endop