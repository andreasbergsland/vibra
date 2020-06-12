/*
**************************************************************
UDO to listen to OSC streams from NGIMU sensors

Inputs: 
- Computer IP
- iPort: Receive port (usually 80##)
- iSendPort: Send port (usually 9000). WARNING! You can't send rate messages to several sensors at once.
- Array with rates for data transmission for the 7 streams (indices 0-6)
/earth
/euler
/linear
/quaternion
/sensors
/altitude
/battery

TODO:
- Could print other messages outside the listed addresses

Credits: Andreas Bergsland, 2020, andreas.bergsland@ntnu.no
**************************************************************
*/

	opcode	NGIMU, k[]k[]k[]k[]k[]kk, Siik[]O
	SComputerIP, iPort, iSendPort, kRateArr[], kPrint xin

Smess[] 	init		12 ; address + typestring + max 10 args
SAddr[] 	init		7

SAddr[0]	=	"/earth"
SAddr[1]	=	"/euler"
SAddr[2]	=	"/linear"
SAddr[3]	=	"/quaternion"
SAddr[4]	=	"/sensors"
SAddr[5]	=	"/altitude"
SAddr[6]	=	"/battery"

; Set defaults
iSendPort	=		(iSendPort == 0)? 9000: iSendPort
iIPcomp		strcmp		SComputerIP, ""
if iIPcomp == 0	then
 SComputerIP	=		"192.168.1.2"
endif
if kRateArr[0]	= -1 then
 kRateArr[] fillarray 		50, 25, 50, 25, 50, 25, 1
endif
kRateChg	changed2	kRateArr
printarray	kRateArr, kRateChg

; Send computer IP to sensor
SBroadcast	=		"255.255.255.255"
kinit		init		1
SendIP		=		"/wifi/send/ip"
		OSCsend_lo	kinit, SBroadcast, iSendPort, SendIP, "s", SComputerIP


SRateSend[]	init		7
SRate		=		"/rate"
indx		=		0
while indx < 7 do
 SRateSend[indx]	strcat		SRate, SAddr[indx] 
; prints SRateSend[indx]
 indx		+=		1
od


; Send rate information to sensor (can't use loop here because of OSCsend)
printf "Earth rate = %.1f, Euler rate = %.1f, Linear rate = %.1f, Quaternion rate = %.1f, Sensors rate = %.1f, Altitude rate = %.1f\n", \ 
		kRateChg+kinit, kRateArr[0], kRateArr[1], kRateArr[2], kRateArr[3], kRateArr[4], kRateArr[5]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[0], "f", kRateArr[0]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[1], "f", kRateArr[1]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[2], "f", kRateArr[2]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[3], "f", kRateArr[3]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[4], "f", kRateArr[4]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[5], "f", kRateArr[5]
		OSCsend_lo	kinit + kRateChg, SBroadcast, iSendPort, SRateSend[6], "i", kRateArr[6]
kinit		=		0

kEarth[]	init		3
kEuler[]	init		3
kLinear[]	init		3
kQuats[]	init		4
kSensors[]	init		10
kAltitude	init		0
kBattery	init		0
kMessInd 	init		0

top:
Smess,kmsgArgs OSCraw iPort
;printarray Smess, kmsgArgs
kn	=	0
while kn < kmsgArgs do
; Find which array to write to
 if kn == 0 then
  kMessInd = 0
  kAddrInd = 0
  until kMessInd > lenarray(SAddr)-1 do
   if strcmpk(Smess[kn],SAddr[kMessInd])== 0 then
    kAddrInd = kMessInd
   endif
   kMessInd += 1
  od

 endif
; Then write to the proper output array
 if kn >= 2 then
  Sfloat sprintfk "%s0", Smess[kn]
  if kAddrInd == 0 then
   kEarth[kn-2] strtodk Sfloat
  elseif kAddrInd == 1 then
   kEuler[kn-2] strtodk Sfloat
  elseif kAddrInd == 2 then
   kLinear[kn-2] strtodk Sfloat
  elseif kAddrInd == 3 then
   kQuats[kn-2] strtodk Sfloat
  elseif kAddrInd == 4 then
   kSensors[kn-2] strtodk Sfloat
  elseif kAddrInd == 5 then
   kAltitude strtodk Sfloat
  elseif kAddrInd == 6 && kn < 3 then	; Only read first battery value
   kBattery  strtodk Sfloat
  endif
 endif
 kn += 1
od
if kmsgArgs > 0 kgoto top

if kPrint == 1	then
 printf	"Port %i: Earth acceleration x = %f, y = %f, z = %f\n", changed2(kEarth), iPort, kEarth[0], kEarth[1], kEarth[2]
 printf	"Port %i: Euler angles x = %f, y = %f, z = %f\n", changed2(kEuler), iPort, kEuler[0], kEuler[1], kEuler[2]
 printf	"Port %i: Linear acceleration x = %f, y = %f, z = %f\n", changed2(kLinear), iPort, kLinear[0], kLinear[1], kLinear[2]
 printf	"Port %i: Quaternions w = %f, x = %f, y = %f, z = %f\n", changed2(kQuats), iPort, kQuats[0], kQuats[1], kQuats[2], kQuats[3]
 printf	"Port %i: Gyro x=%f, y=%f, z=%f\nAccel x=%f, y=%f, z=%f\nMagnetometer x=%f, y=%f, z=%f\nBarometer = %f\n", changed2(kSensors), \
 iPort, kSensors[0],kSensors[1],kSensors[2],kSensors[3],kSensors[4],kSensors[5],kSensors[6],kSensors[7],kSensors[8],kSensors[9] 
 printf "Port %i: Battery is %f percent charged\n", changed2(kBattery), iPort, kBattery
 printf "Port %i: Altitude = %f\n", changed2(kAltitude), iPort, kAltitude	
endif

xout	kEarth, kEuler, kLinear, kQuats, kSensors, kAltitude, kBattery

	endop
