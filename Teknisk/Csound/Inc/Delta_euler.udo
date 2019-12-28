; Delta_euler
; udo that gives the delta (differentiatiation/rate of change) for an euler array (xyz) input
; and compensates for jumps between -180 and 180 for the euler values (phase unwrapping)
; kOut[]	Delta_euler		kArr[], kdeltime, imaxdel
opcode	Delta_euler, k[], k[]o
kArr[], icnt		xin
klast[]	init		3
if icnt >= lenarray(kArr)-1 goto body
kArr[] Delta_array kArr, icnt+1
body:	
if	changed:k(kArr[icnt]) == 1	then
 if	(kArr[icnt] - klast[icnt]) > 300	then
  kArr[icnt]		=		(kArr[icnt] - klast[icnt] - 360)
 elseif (kArr[icnt] - klast[icnt]) < -300	then
  kArr[icnt]		=		(kArr[icnt] - klast[icnt] + 360)
 else
  kArr[icnt]		=		(kArr[icnt] - klast[icnt])
 endif
 klast[icnt]		=		kArr[icnt]
endif
xout	kArr
endop