	opcode	OSCsendArray, i, k[]kSiSS
kArr[], kTrig, SHost, iPortHandle, SAddress, STypes	xin

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
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4], kArr[5], kArr[6], kArr[7], kArr[8], kArr[9]
goto		contin
ninevars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4], kArr[5], kArr[6], kArr[7], kArr[8]
goto		contin
eightvars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4], kArr[5], kArr[6], kArr[7]
goto		contin
sevenvars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4], kArr[5], kArr[6]
goto		contin
sixvars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4], kArr[5]
goto		contin
fivevars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3], kArr[4]
goto		contin
fourvars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2], kArr[3]
goto		contin
threevars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1], kArr[2]
goto		contin
twovars:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0], kArr[1]
goto		contin
onevar:
OSCsend	kTrig, SHost, iPortHandle, SAddress, STypes, kArr[0]
contin:
xout 		iPortHandle
endop