/*
UDO for doing follow2 envelope following with attack and release
on an array of control signals (k-rate)
*/
opcode Follow2_array ,k[],k[]kko
kArr[], kAtt, kRel, icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] Follow2_array kArr, kAtt, kRel, icnt+1
body:
aSignal	=		a(kArr[icnt])
aFollow	follow2	aSignal, kAtt, kRel
kArr[icnt]	downsamp	aFollow
xout kArr
endop
