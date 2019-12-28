opcode Mediank_array ,k[],k[]kio
kArr[], kSize, iMaxSize, icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] Mediank_array kArr, kSize, iMaxSize, icnt+1
body:
kArr[icnt]	mediank	kArr[icnt], kSize, iMaxSize ;500, 501
xout kArr
endop