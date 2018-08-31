; UDO to convert from cps to midi note number

opcode	Cps2midi, k, k
kcps		xin
kpch		=		pchoct(octcps(kcps))
koct		=		(int(kpch))
kmidioct	=		koct*12 - 36
ktunedpch 	= 		(int((kpch-koct)*100))
knotenum	=		kmidioct + ktunedpch
		xout		knotenum
endop
