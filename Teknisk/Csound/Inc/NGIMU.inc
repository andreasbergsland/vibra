; &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
; Get data from NGIMU
; &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

gkNG1Eul[]	init		3
kNG1Echg, gkNG1Eul	OSClisten	giNGIMU1, "/euler", "fff"

kNG1Quats[]	init		4
kNG1Qchg, kNG1Quats	OSClisten	giNGIMU1, "/quaternion", "ffff"

kNG1Lin[]	init		3
kNG1LinChg, kNG1Lin	OSClisten	giNGIMU1, "/linear", "fff"

; Linear acceleration intensity (IRCAM algorithm)
gkNG1_Lin_d[] init		3
gkNG1_Lin_d, gkNG1_Int		IMU_intensity	kNG1Lin

kNG1LinAbs[]	init		3
kNG1LinAbs		maparray	kNG1Lin, "abs"
kNG1Lin[]		init		3
kNG1Lin		Portk_array		kNG1LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG1LinTab[]	init		3
gkNG1LinTab		Table_array	kNG1Lin, iLinTab, 1

kNG1L_int[]	init		3
kNG1L_int, gkNG1L_mags	IMU_intensity	kNG1Lin

gkNG1Q_d[]	init		4
gkNG1Q_d	Delta_array	kNG1Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG1Q_abs[]	init		4
kNG1Q_abs	maparray	gkNG1Q_d, "abs"
gkNG1Q_mag	sumarray	kNG1Q_abs




; ******************NGIMU 2**************************************
gkNG2Eul[]	init		3
kNG2chg, gkNG2Eul	OSClisten	giNGIMU2, "/euler", "fff"

gkNG2Eul_d[]	init		3
gkNG2Eul_d		Delta_array	gkNG2Eul


kNG2Quats[]	init		4
kNG2Qchg, kNG2Quats	OSClisten	giNGIMU2, "/quaternion", "ffff"

kNG2Lin[]	init		3
kNG2LinChg, kNG2Lin	OSClisten	giNGIMU2, "/linear", "fff"

; Linear acceleration intensity (IRCAM algorithm)
gkNG2_Lin_d[] init		3
gkNG2_Lin_d, gkNG2_Int		IMU_intensity	kNG2Lin

kNG2LinAbs[]	init		3
kNG2LinAbs		maparray	kNG2Lin, "abs"
kNG2Lin[]		init		3
kNG2Lin		Portk_array		kNG2LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG2LinTab[]	init		3
gkNG2LinTab		Table_array	kNG2Lin, iLinTab, 1

kNG2L_int[]	init		3
kNG2L_int, gkNG2L_mags	IMU_intensity	kNG2Lin

gkNG2Q_d[]	init		4
gkNG2Q_d	Delta_array	kNG2Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG2Q_abs[]	init		4
kNG2Q_abs	maparray	gkNG2Q_d, "abs"
gkNG2Q_mag	sumarray	kNG2Q_abs

; ******************NGIMU 3**************************************
gkNG3Eul[]	init		3
kNG3chg, gkNG3Eul	OSClisten	giNGIMU3, "/euler", "fff"
;printarray gkNG1Eul

kNG3Quats[]	init		4
kNG3Qchg, kNG3Quats	OSClisten	giNGIMU3, "/quaternion", "ffff"

kNG3Lin[]	init		3
kNG3LinChg, kNG3Lin	OSClisten	giNGIMU3, "/linear", "fff"

; Linear acceleration intensity (IRCAM algorithm)
gkNG3_Lin_d[] init		3
gkNG3_Lin_d, gkNG3_Int		IMU_intensity	kNG3Lin

kNG3LinAbs[]	init		3
kNG3LinAbs		maparray	kNG3Lin, "abs"
kNG3Lin[]		init		3
kNG3Lin		Portk_array		kNG3LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG3LinTab[]	init		3
gkNG3LinTab		Table_array	kNG3Lin, iLinTab, 1

kNG3L_int[]	init		3
kNG3L_int, gkNG3L_mags	IMU_intensity	kNG3Lin

gkNG3Q_d[]	init		4
gkNG3Q_d	Delta_array	kNG3Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG3Q_abs[]	init		4
kNG3Q_abs	maparray	gkNG3Q_d, "abs"
gkNG3Q_mag	sumarray	kNG3Q_abs

; ******************NGIMU 4**************************************
gkNG4Eul[]	init		3
kNG4chg, gkNG4Eul		OSClisten	giNGIMU4, "/euler", "fff"
;printarray gkNG1Eul

kNG4Quats[]	init		4
kNG4Qchg, kNG4Quats	OSClisten	giNGIMU4, "/quaternion", "ffff"

kNG4Lin[]	init		3
kNG4LinChg, kNG4Lin	OSClisten	giNGIMU4, "/linear", "fff"

; Linear acceleration intensity (IRCAM algorithm)
gkNG4_Lin_d[] init		3
gkNG4_Lin_d, gkNG4_Int		IMU_intensity	kNG4Lin

kNG4LinAbs[]	init		4
kNG4LinAbs		maparray	kNG4Lin, "abs"
kNG4Lin[]		init		3
kNG4Lin		Portk_array		kNG4LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG4LinTab[]	init		3
gkNG4LinTab		Table_array	kNG4Lin, iLinTab, 1

kNG4L_int[]	init		3
kNG4L_int, gkNG4L_mags	IMU_intensity	kNG4Lin

gkNG4Q_d[]	init		4
gkNG4Q_d	Delta_array	kNG4Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG4Q_abs[]	init		4
kNG4Q_abs	maparray	gkNG4Q_d, "abs"
gkNG4Q_mag	sumarray	kNG4Q_abs


; ******************NGIMU 5**************************************
gkNG5Eul[]	init		3
kNG5chg, gkNG5Eul		OSClisten	giNGIMU5, "/euler", "fff"
;printarray gkNG1Eul

kNG5Quats[]	init		4
kNG5Qchg, kNG5Quats	OSClisten	giNGIMU5, "/quaternion", "ffff"

kNG5Lin[]	init		3
kNG5LinChg, kNG5Lin	OSClisten	giNGIMU5, "/linear", "fff"

; Linear acceleration intensity (IRCAM algorithm)
gkNG5_Lin_d[] init		3
gkNG5_Lin_d, gkNG5_Int		IMU_intensity	kNG5Lin

kNG5LinAbs[]	init		4
kNG5LinAbs		maparray	kNG5Lin, "abs"
kNG5Lin[]		init		3
kNG5Lin		Portk_array		kNG5LinAbs, 0.00001
iLinTab		ftgentmp	0, 0, 1024, -7, 0, 50, 0, 974, 1
gkNG5LinTab[]	init		3
gkNG5LinTab		Table_array	kNG5Lin, iLinTab, 1

kNG5L_int[]	init		3
kNG5L_int, gkNG5L_mags	IMU_intensity	kNG5Lin

gkNG5Q_d[]	init		4
gkNG5Q_d	Delta_array	kNG5Quats

; Calculate a normalized magnitude vector for the quaternions
; This value reacts relatively slowly to movements and therefore has a tail of ca. 0.5s	
kNG5Q_abs[]	init		4
kNG5Q_abs	maparray	gkNG5Q_d, "abs"
gkN5Q_mag	sumarray	kNG5Q_abs