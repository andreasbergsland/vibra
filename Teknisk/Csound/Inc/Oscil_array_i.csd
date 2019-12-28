<CsoundSynthesizer>

<CsOptions>
-odac0
</CsOptions>


<CsInstruments>
;Oscil_array_i
0dbfs		=		1

opcode SumOsc,a,i[]i[]ijo
 iam[],ifr[],iN,ifn,icnt xin
 if icnt >= iN-1 goto syn
  asig SumOsc iam,ifr,iN,ifn,icnt+1
 syn:
   xout asig + oscili(iam[icnt],ifr[icnt],ifn)
endop

gifn ftgen 1,0,16384,10,1
instr 1
 ifr[] fillarray 320,398,434,584,948    
 iam[] fillarray 1,0.5,0.5,0.5,0.5
 a1 SumOsc iam,ifr,lenarray(iam),gifn
 out a1*p4/lenarray(iam) * transeg:k(1,p3,-3,0)
endin
schedule(1,0,3,0dbfs/2,440)
</CsInstruments>


<CsScore>

</CsScore>


</CsoundSynthesizer>