instr		PulzerTone
acos			cosseg	1, p3, 0
iSensorInd		=		p4
iFrek			=		p5
aVCO			vco2		0.5, iFrek, 0
aOUT			=		aVCO * acos * gkAmp[iSensorInd] * gkVolume[iSensorInd]
gaSend[iSensorInd]	=	gaSend[iSensorInd] + aOUT

endin