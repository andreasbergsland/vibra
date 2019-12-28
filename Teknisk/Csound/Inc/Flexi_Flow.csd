instr		FlexiFlow
iSensor		=		p4
printf_i		"Starting FlexiFlow with sensor %i and sound %i - Floooowing!\n", 1, iSensor, iSnd
iFadeOut		=		p6
xtratim		iFadeOut
kRelease		release
kTime			timeinsts

if trigger(kRelease,0.5,0) == 1	then
printf	"Fading out and turning off sensor %i with FlexiFlow\n", 1, iSensor
kEnd		=		kTime
endif
;
if	kRelease == 1	then
kFadeCount	=	int(iFadeOut - (kTime - kEnd))
printk2	kFadeCount
endif

asnd, k1		Metro_a	3
out		asnd





endin