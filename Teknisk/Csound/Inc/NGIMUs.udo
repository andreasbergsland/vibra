/*
UDO to listen to OSC streams from NGIMU sensors
Inputs: 
Array with initiated OSC ports (i-rate array, OSCinit used to initate ports)
Data streams to read: String with a sequence of different strings representing the available streams:
e	=	/euler
l	=	/linear acceleration
q	=	/quaternion
r	=	/earth
b	=	/battery
s	=	/sensors
a	=	/altitude
h	=	/humidity
t	=	/temperature
Sizes of string length and port array must match

Hmmm. Dette er vanskelig fordi man må først splitte opp en 1d-array i enkeltverdier før man skriver til en 2d
*/
/*
Include file for NGIMU sensors (up to 15)

This include has to be initiated as one macro def and instantiation in instr 0, 
with number of NGIMUs and start ports and one macro in the instrument section:

$NGIMU_init(5'8001) in the init section (instr 0) and then
$NGIMU_instr in the instrument section

Macro arguments (NumberofSensors'StartPort)
The ports of the NGIMUs need to be in numeric order

Dependencies:
Delta_array.udo
IMU_intensity.udo

It gives the following data streams:
gkNGIMU_Acc[][]	- acceleration
gkNGIMU_Gyro[][]	  gyro
gkNGIMU_Magn[][]	  magnetometer
gkNGIMU_Quat[][]	  quaternions
gkNGIMU_Quat_d[][]  delta quaternions
gkNGIMU_Eul[][]	  euler angles
gkNGIMU_Eul_d[][]	  delta euler angles
gkNGIMU_Qnorm[]	  normalized quaternion magnitude value (intensity)
gkNGIMU_Jerk[][]	  jerk - delta acceleration
*/

#define	NGIMU_init(NumSensors'StartPort)

#
giNGIMUHandles[]	init	15 + 1		; Make array so that dim 1 equals NGIMU number
giNumPorts		=		$NumSensors
giStartPort		=		$StartPort

; Initiate the necessary number of OSC ports and give them a handle stored in giNGIMUHandles[]

if giNumPorts < 15 igoto contin15
 giNGIMUHandles[15]	OSCinit	$StartPort + 14
contin15:
if giNumPorts < 14 igoto contin14
 giNGIMUHandles[14]	OSCinit	$StartPort + 13
contin14:
if giNumPorts < 13 igoto contin13
 giNGIMUHandles[13]	OSCinit	$StartPort + 12
contin13:
if giNumPorts < 12 igoto contin12
 giNGIMUHandles[12]	OSCinit	$StartPort + 11
contin12:
if giNumPorts < 11 igoto contin11
giNGIMUHandles[11]	OSCinit	$StartPort + 10
contin11:
if giNumPorts < 10 igoto contin10
giNGIMUHandles[10]	OSCinit	$StartPort + 9
contin10:
if giNumPorts < 9 igoto contin9
giNGIMUHandles[9]	OSCinit	$StartPort + 8
contin9:
if giNumPorts < 8 igoto contin8
giNGIMUHandles[8]	OSCinit	$StartPort + 7
contin8:
if giNumPorts < 7 igoto contin7
giNGIMUHandles[7]	OSCinit	$StartPort + 6
contin7:
if giNumPorts < 6 igoto contin6
giNGIMUHandles[6]	OSCinit	$StartPort + 5
contin6:
if giNumPorts < 5 igoto contin5
giNGIMUHandles[5]	OSCinit	$StartPort + 4
contin5:
if giNumPorts < 4 igoto contin4
giNGIMUHandles[4]	OSCinit	$StartPort + 3
contin4:
if giNumPorts < 3 igoto contin3
giNGIMUHandles[3]	OSCinit	$StartPort + 2
contin3:
if giNumPorts < 2 igoto contin2
giNGIMUHandles[2]	OSCinit	$StartPort + 1
contin2:
giNGIMUHandles[1]	OSCinit	$StartPort


	opcode	NGIMUs, k[],i[]S
	iPorts[], Streams xin
idim1			lenarray	iPorts, 1
idim2			strlen	Streams
SAddresses[]	init		idim2
STypes[]		init		idim2
indx		=	0
strloop:
 SAbbr		strsub	Streams, indx, indx + 1
 if	strcmp("e",SAbbr) == 0	then
  SAddresses[indx]	=	"/euler"
  STypes[indx]		=	"fff"
 elseif	strcmp("l",SAbbr) == 0	then
  SAddresses[indx]	=	"/linear"
  STypes[indx]		=	"fff"
 elseif	strcmp("q",SAbbr) == 0	then
  SAddresses[indx]	=	"/quaternion"
  STypes[indx]		=	"ffff"
 elseif	strcmp("s",SAbbr) == 0	then
  SAddresses[indx]	=	"/sensors"
  STypes[indx]		=	"ffffffffff"
 elseif	strcmp("r",SAbbr) == 0	then
  SAddresses[indx]	=	"/earth"
  STypes[indx]		=	"fff"
 elseif	strcmp("b",SAbbr) == 0	then
  SAddresses[indx]	=	"/battery"
  STypes[indx]		=	"fffff"
 elseif	strcmp("a",SAbbr) == 0	then
  SAddresses[indx]	=	"/altitude"
  STypes[indx]		=	"a"
 elseif	strcmp("h",SAbbr) == 0	then
  SAddresses[indx]	=	"/humidity"
  STypes[indx]		=	"f"
 elseif	strcmp("t",SAbbr) == 0	then
  SAddresses[indx]	=	"/temperature"
  STypes[indx]		=	"fff"
endif
loop_lt	indx, 1, idim2, strloop

kDataOut[][]	init		idim1, idim2
kData[]		init		idim1

indx1		=		0
dim1loop:
 indx2		=		0
dim2loop:
  kChg, kData			OSClisten	iPorts[indx1], SAddresses[indx2], STypes[indx2]
  indx3		=		0
   dim3loop: 
   loop_lt	
;  kChgOut[indxdim1][indxdim2]		=		kChg
 loop_lt	indx2, 1, idim2, dim2loop
loop_lt	indx1, 1, idim1, dim1loop

; 

;indx2		=		0
;printloop:
; prints	SAddresses[indx2]
;loop_lt	indx2, 1, idim2, printloop


xout	kDataOut

	endop

#