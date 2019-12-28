	opcode	OSClistenArray, k[], iSS
iPortHandle, SAddress, STypes	xin
k1	init		0
k2	init		0
k3	init		0
k4	init		0
k5	init		0
k6	init		0
k7	init		0
k8	init		0
k9	init		0
k10	init		0
iArrSize 	strlen	STypes
kArrSize 	init		iArrSize
kArr[] 	init		iArrSize
if		iArrSize == 1	goto onevar
if		iArrSize == 2	goto twovars
if		iArrSize == 3	goto threevars
if		iArrSize == 4	goto fourvars
if		iArrSize == 5	goto fivevars
if		iArrSize == 6	goto sixvars
if		iArrSize == 7	goto sevenvars
if		iArrSize == 8	goto eightvars
if		iArrSize == 9	goto ninevars
if		iArrSize == 10	goto tenvars	


tenvars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10
goto		contin
ninevars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5, k6, k7, k8, k9
goto		contin
eightvars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5, k6, k7, k8
goto		contin
sevenvars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5, k6, k7
goto		contin
sixvars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5, k6
goto		contin
fivevars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4, k5
goto		contin
fourvars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3, k4
goto		contin
threevars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2, k3
goto		contin
twovars:
kans		OSClisten	iPortHandle, SAddress, STypes, k1, k2
goto		contin
onevar:
kans		OSClisten	iPortHandle, SAddress, STypes, k1

contin:

kndx	=		0
iter:
if	kArrSize >= kndx+1	then
 if     kndx == 0	then
   kval =  k1
 elseif kndx == 1 then
   kval = k2
 elseif kndx == 2 then
   kval = k3
 elseif kndx == 3 then
   kval = k4
 elseif kndx == 4 then
   kval = k5
 elseif kndx == 5 then
   kval = k6
 elseif kndx == 6 then
   kval = k7
 elseif kndx == 7 then
   kval = k8
 elseif kndx == 8 then
   kval = k9
 elseif kndx == 9 then
   kval = k10
 endif
kArr[kndx] =	kval
endif
loop_lt	kndx, 1, kArrSize, iter
xout kArr
endop