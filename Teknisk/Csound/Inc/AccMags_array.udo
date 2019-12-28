	opcode	AccMags_array, k, k[]o
kArr[], icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] AccMags_array kArr, icnt+1
body:
kSumSqared	=	kOut + kArr[icnt]^2
xout sqrt(kSumSqared)
endop