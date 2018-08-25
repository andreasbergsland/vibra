/*
Filter values in arrays using either
port (portamento filter type 0, default), kparam = half-time of the function in seconds
tone (recursive low pass filter, type 1), kparam = the response curve's half-power point, in Hertz
lineto (glissando between values), kparam = time length of glissando in second, will add glissando (i.e. straight lines) to a stepped input signal
Input and output arrays needs to be initialized before used
*/
opcode	MultiFiltk_array, k[], k[]kOo
kArr[], kparam, kfiltype, icnt xin
if icnt >= lenarray(kArr)-1 goto body
kArr[] MultiFiltk_array kArr, kparam, kfiltype, icnt+1
body:
if	kfiltype == 0	then
kArr[icnt]	portk		kArr[icnt], kparam
elseif kfiltype == 1	then
kArr[icnt]	tonek		kArr[icnt], kparam
elseif kfiltype == 2	then
kArr[icnt]	lineto	kArr[icnt], kparam
else
kArr[icnt]	=	kArr[icnt]
endif
xout kArr
endop
