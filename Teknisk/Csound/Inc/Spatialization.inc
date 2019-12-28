
instr		500
; Get spatmodes for all sensors
kS1, kS2, kS3, kS4, kS5, kS6, kS7, kS8	init		0
kans	OSClisten	giMax, "/spatmode", "iiiiiiii", kS1, kS2, kS3, kS4, kS5, kS6, kS7, kS8

; Sensor 1: Myo 1
kStatic1[]	fillarray	-45, 2, 1
gkAzi[0], gkDist[0], gkSpread[0]	Spatialize	kS1, kStatic1, gkMyo1_euler, gkMyo1_quats, gkMyo1_Gyro*1.5

kStatic2[]	fillarray	0, 2, 1
gkAzi[1], gkDist[1], gkSpread[1]	Spatialize	kS2, kStatic2, gkMyo2_euler, gkMyo2_quats, gkMyo2_Gyro*1.5

kStatic3[]	fillarray	45, 2, 1
gkAzi[2], gkDist[2], gkSpread[2]	Spatialize	kS3, kStatic3, gkMyo3_euler, gkMyo3_quats, gkMyo3_Gyro*1.5

kStatic4[]	fillarray	90, 2, 1
gkAzi[3], gkDist[3], gkSpread[3]	Spatialize	kS4, kStatic4, gkMyo4_euler, gkMyo4_quats, gkMyo4_Gyro*1.5

kStatic5[]	fillarray	135, 2, 1
gkAzi[4], gkDist[4], gkSpread[4]	Spatialize	kS5, kStatic5, gkNGIMU1_Eul, gkNGIMU1_Quats, gkNGIMU1_gyro

kStatic6[]	fillarray	180, 2, 1
gkAzi[5], gkDist[5], gkSpread[5]	Spatialize	kS6, kStatic6, gkNGIMU2_Eul, gkNGIMU2_Quats, gkNGIMU2_gyro

kStatic7[]	fillarray	225, 2, 1
gkAzi[6], gkDist[6], gkSpread[6]	Spatialize	kS7, kStatic7, gkNGIMU3_Eul, gkNGIMU3_Quats, gkNGIMU3_gyro

kStatic8[]	fillarray	270, 2, 1
gkAzi[7], gkDist[7], gkSpread[7]	Spatialize	kS8, kStatic8, gkNGIMU4_Eul, gkNGIMU4_Quats, gkNGIMU4_gyro


endin


