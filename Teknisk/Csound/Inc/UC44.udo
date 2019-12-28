; Udo to use with the UC44 controller
; Gives a 2D array with
; dim1: widget group (0 = sliders, 1 = green buttons, 2 = grey buttons, 3-10 encoders)
; dim2: strip/controller number
; Right now only programmed with the controller's default setup 1

opcode	UC44, k[], PO
kSetup, kPrint xin	
kCtrlArr[][]	init		10, 17
kIndices[]		init		2
kstatus, kchan, kdata1, kdata2  midiin
; For MIDI cc messages
if	kstatus == 176	then
 if	kchan == 1	then
  kind1		=	(kdata1 % 8) + 3
  kind2		=	int(kdata1 / 8) + 1
 elseif kchan == 2	then
   if   kdata1 >= 64	then
    kind1		=	int((kdata1- 64) / 16)  	; row
   else
    kind1		=	int((kdata1) / 16) - 1	; row
   endif
    kind2		=	(kdata1 % 16) + 1		; strip/chan
  endif
; Write to control array
kCtrlArr[kind1][kind2]	=	kdata2/127	;Normalize
kIndices[0] = kind1
kIndices[1] = kind2
endif

if	kPrint == 1	then
printf	"widget group=%i, strip # =%i, data=%i\n", (changed:k(kstatus+kchan+kdata1+kdata2)), kind1, kind2, kdata2
elseif kPrint == 2 then
printf	"status=%i, chan=%i, data1=%i, data2=%i\n", (changed:k(kstatus+kchan+kdata1+kdata2)), kstatus, kchan, kdata1, kdata2
endif

xout	kCtrlArr;, kIndices
endop