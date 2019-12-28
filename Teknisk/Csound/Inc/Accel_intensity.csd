<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>


<CsInstruments>
gih	OSCinit	1234

;opcode	Accel_intensity, k[],k[]oo
;kArr[], iSwitch, icnt		xin
;if	iSwitch == 0	then
;; When 0, use values for accelerometer
;ia	=	0.8
;ib	=	0.1
;else
;; Else, use values for gyro
;ia	=	0.9
;ib	=	1
;endif
;kx1[]	init	lenarray(kArr)
;kx2[]	init	lenarray(kArr)
;kdx[]	init	lenarray(kArr)
;ky[]	init	lenarray(kArr)
;
;
;if icnt >= lenarray(kArr)-1 goto body
;kArr[] Accel_intensity kArr, iSwitch, icnt+1
;body:
;
;if	kArr[icnt] != kx1[icnt]	then
;ky[icnt]	=	kdx[icnt] + ky[icnt]*ia		; Step based low pass filter (time independent)
;kx2[icnt]	=	kx1[icnt]
;kx1[icnt]	=	kArr[icnt]
;kdx[icnt]	=	abs(kx2[icnt] - kArr[icnt])		; Delta with three points (changed values)
;endif
;kArr[icnt]	=	(ky[icnt]*ib)^2
;xout	kArr
;endop
#include "Inc/Accel_intensity.udo"

instr	1
; Using the algorithm of RiOT intensity (IRCAM)
; Delta (3 points = 3ms or 3 data points?)
; Absolute value
; IIR low pass filter
; Multiply by 0.1
; Square

	kx	init	0
	kx1	init	0
	kdx	init	0
	ky	init	0
	kans	OSClisten	gih, "/intensity", "f", kx

if	changed:k(kx) == 1	then
ky	=	kdx + ky*0.8		; Step based low pass filter (time independent)
kx2	=	kx1
kx1	=	kx
kdx	=	abs(kx2 - kx)		; Delta with three points (changed values)
endif
kout	=	(ky*0.1)^2
printk2	kout

endin
</CsInstruments>


<CsScore>
i1	0	100
</CsScore>


</CsoundSynthesizer>