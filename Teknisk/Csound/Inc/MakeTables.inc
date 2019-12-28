;
;SLayerArray[]	init			5
;SLayer		=			"/Patch_structure/Sounds/Layered/Layer"
;SLongs		=			"/Patch_structure/Sounds/Longs"
;SLayer1		strcat		SLayer, "1"
;SLayer2		strcat		SLayer, "2"
;SLayer3		strcat		SLayer, "3"
;SLayer4		strcat		SLayer, "4"
SFiles1[]	directory	"/Users/andber/Particles/Xternal/Sets_old/SingerPhonemes/Patch_structure/Sounds/Layered/Layer1", ".aiff"
SFiles2[]	directory	"/Users/andber/Particles/Sets/7-Analog/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles3[]	directory	"/Users/andber/Particles/Xternal/Sets_old/4-ROBERT_SOLO/Patch_structure/Sounds/Layered/Layer1", ".aiff"
SFiles4[]	directory	"/Users/andber/Particles/Xternal/Sets_old/Set_Greta/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles5[]	directory	"/Users/andber/Particles/Sets/5-UHS_test/Patch_structure/Sounds/Layered/Layer1", ".aif"
SFiles6[]	directory	"/Users/andber/Particles/Sets/1-Materials/Patch_structure/Sounds/Layered/Layer1", ".aif"
giNumSets	=		6
giNumFiles[]	init		6
giNumFiles[0]	lenarray	SFiles1
giNumFiles[1]	lenarray	SFiles2
giNumFiles[2]	lenarray	SFiles3
giNumFiles[3]	lenarray	SFiles4
giNumFiles[4]	lenarray	SFiles5
giNumFiles[5]	lenarray	SFiles6
; Make array with all sound categories that needs to be made into tables
;SLayerArray		fillarray		SLongs, SLayer1, SLayer2, SLayer3, SLayer4
;giLayNums		lenarray		SLayerArray			; For now: two categories, but could expand
SFullPath[]		init			giNumSets
giMaxFiles		=			500					; Maximum number of files in each folder
giTabNums		ftgentmp		0, 0, giNumSets * giLayNums * giMaxFiles, -2, 0
giNumFiles[] 	init			giNumSets		; Array with the number of files in each bank - now inititated in instr 1

; Loop through this section for each set
;----------------------------------------------------------
iSetInd		=			0
setloop:
 iLayInd		=			0

layerloop2:
  SPath		=		SFullPath[iSetInd][iLayInd]
  print iLayInd
; Arrays needs to be reinitiated for each iteration to clear them
  SFiles[]		init		1				; clear arrays on each pass
  SFiles[]		directory	SPath, ".aif"
  iNumFiles		=		lenarray(SFiles) 		; get number of files in folder/directory	
  giNumFilesLay[iSetInd][iLayInd] = iNumFiles		; Write the numbers of files in the bank to the array
  print iNumFiles

  if iNumFiles > 1 then
; Get number part of file name and put it in an array as integers for later sorting
 igetNumber[]	init		iNumFiles
 indx1			=		0
loop1:
  ilen			=		strlen(SFiles[indx1])				; Get length of path + file name
  indx	=		0
  SNum	=		""
  iSlashMatch=		-1
  iDotMatch  =		-1
  until	iSlashMatch == 0 do
   SChar	strsub	SFiles[indx1], ilen-indx, ilen-indx-1
   iSlashMatch strcmp	SChar, "/"
   iDotMatch	strcmp	SChar, "."
    if iSlashMatch == 0 then
     iSlashInd = indx
    elseif iDotMatch == 0	then
     iDotInd = indx
    endif
   indx	+= 1
  od

 Sordinal		strsub	SFiles[indx1], ilen -iSlashInd, ilen-iDotInd-1	; Extract file name string minus path and extension
 iNumber		strtol	Sordinal
 igetNumber[indx1]	=		iNumber					; Convert to integer
 loop_lt	indx1, 1, iNumFiles, loop1
;------------

; Sort files with number array as key------------
 SortedFiles[]	init		1
 SortedFiles[]	init		iNumFiles
 iMax			maxarray	igetNumber
 indx2			=		0
loop2:
  iMin, iMinIndx	minarray	igetNumber
  SortedFiles[indx2]	=	SFiles[iMinIndx]
  igetNumber[iMinIndx]		=	iMax + 1000
 loop_lt	indx2, 1, iNumFiles, loop2
;printf_i		"\nStarting set management instrument with set %s containing %i files\n", 1, Set, iNumFiles


; Make tables with sound files, store table numbers in an array
; NB! Will crash if other file types are in the folder (e.g. .asd).

 indx3		=			0
maketables:
   if iNumFiles > 1 then
    ifn		ftgentmp		0, 0, 0, 1, SortedFiles[indx3], 0, 0, 0
    iTabIndx	=			iSetInd * giLayNums * giMaxFiles + iLayInd * giMaxFiles + indx3
			tablew		ifn, iTabIndx, giTabNums
;    giTabNums[iSetInd][iLayInd][indx3]	=	ifn
    print 	iSetInd, iLayInd, indx3, ifn, iTabIndx
    prints "--------------------------\n"
   else
    printf_i "No files in set number %i and layer number %i (5=Longs)\n", iSetInd, iLayInd
   endif
  loop_lt	indx3, 1, iNumFiles, maketables
 endif
 loop_lt	iLayInd, 1, giLayNums, layerloop2
;--------------------
loop_lt	iSetInd, 1, giNumSets, setloop