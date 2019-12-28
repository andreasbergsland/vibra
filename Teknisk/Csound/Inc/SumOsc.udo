; UDO doing additive synthesis with an arbitrary number of oscillators
; using arrays as input for amps and freqs
opcode SumOsc,a,i[]i[]ijo
 iam[],ifr[],iN,ifn,icnt xin
 if icnt >= iN-1 goto syn
  asig SumOsc iam,ifr,iN,ifn,icnt+1
 syn:
   xout asig + oscili(iam[icnt],ifr[icnt],ifn)
endop