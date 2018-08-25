; Udo to use with the UC44 controller
; Gives a 3D array with
; dim1: 2nd function (0 = off, 1 = on)
; dim2: widget group (0 = sliders, 1 = green buttons, 2 = grey buttons, 3-10 encoders)
; dim3: strip/controller number
; Right now only programmed with the controller's default setup 1

opcode	UC44, k[]k[], kO
kSetup, kPrint xin	
kCtrlArr[][][]	init		2, 10, 16
kIndices[]		init		3
kstatus, kchan, kdata1, kdata2  midiin
; For MIDI cc messages
if	kstatus == 176	then
 if	kchan == 1	then
  kind1		=	0
  kind2		=	(kdata1 % 8)+ 3
  kind3		=	int(kdata1 / 8)+1
 elseif kchan == 2	then
   if   kdata1 >= 64	then
    kind1		=	1
    kind2		=	int((kdata1- 64) / 16)  	; row
   else
    kind1		=	0
    kind2		=	int((kdata1) / 16) - 1	; row
   endif
  
  kind3		=	(kdata1 % 16) + 1		; strip/chan
  
 endif
; Write to control array
kCtrlArr[kind1][kind2][kind3]	=	kdata2
kIndices[0] = kind1
kIndices[1] = kind2
kIndices[2] = kind3
endif

if	kPrint == 1	then
;printf	"status=%i, chan=%i, data1=%i, data2=%i\n", (changed:k(kstatus+kchan+kdata1+kdata2)), kstatus, kchan, kdata1, kdata2
printf	"2nd fun  =%i, widget group=%i, strip # =%i, data=%i\n", (changed:k(kstatus+kchan+kdata1+kdata2)), kind1, kind2, kind3, kdata2
endif

xout	kCtrlArr, kIndices
endop
