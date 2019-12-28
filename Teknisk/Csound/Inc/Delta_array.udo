; Delta_array
; udo that gives the delta (differentiatiation/rate of change) for an array input
; kOut[]	Delta_array	kArr[], kdeltime, imaxdel
; kOut[]	Delta_euler		kArr[], kdeltime, imaxdel
opcode	Delta_array, k[], k[]o
kArr[], icnt		xin
iLen		lenarray	kArr
klast[]	init		iLen
kdelta[]	init		iLen
if icnt >= iLen-1 goto body
kArr[] 	Delta_array	kArr, icnt+1
body:	
if	changed:k(kArr[icnt]) == 1	then
 kdelta[icnt]	=			kArr[icnt] - klast[icnt]
 klast[icnt]		=		kArr[icnt]
endif
kArr[icnt]			=		kdelta[icnt]
xout	kArr
endop