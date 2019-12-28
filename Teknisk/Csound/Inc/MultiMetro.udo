opcode	MultiMetro, k, kk
kcps, ksubdiv	xin
kmet			metro		kcps
kcnt			init		0
kcnt			=		kcnt + kmet
kcount		=		kcnt % ksubdiv
kchgd			changed	kcount
kTrig			=		(kchgd==1 && kcount == 0)? 1: 0
xout	kTrig	
endop