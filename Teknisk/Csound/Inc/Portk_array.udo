	opcode	Portk_array, k[], k[]ko
kArr[], khtim, icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] Portk_array kArr, khtim, icnt+1
body:
kArr[icnt]	portk	kArr[icnt], khtim
xout kArr
endop