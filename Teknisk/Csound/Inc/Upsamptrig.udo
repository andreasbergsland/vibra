; Opcode to convert a k-rate trigger to a single sample a-rate trigger
opcode	Upsamptrig, a, k
kTrig		xin
aTrig		upsamp	kTrig
aDel		delay1	aTrig
aPulse1	=		aTrig - aDel
aOut		=		0.5 * (aPulse1 + abs(aPulse1))
xout		aOut
endop
