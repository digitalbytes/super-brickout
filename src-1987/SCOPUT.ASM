** WIDTH
** 6
SCODAT	FCB	$F0
	FCB	$E3
	FCB	$C7
	FCB	$07
	FCB	$83
	FCB	$FF
	FCB	$EE
	FCB	$DD
	FCB	$BB
	FCB	$BB
	FCB	$DB
	FCB	$FF
	FCB	$EF
	FCB	$DF
	FCB	$BB
	FCB	$BB
	FCB	$DF
	FCB	$FF
	FCB	$F3
	FCB	$DF
	FCB	$BB
	FCB	$BB
	FCB	$C7
	FCB	$BF
	FCB	$FD
	FCB	$DF
	FCB	$BB
	FCB	$87
	FCB	$DF
	FCB	$FF
	FCB	$FE
	FCB	$DF
	FCB	$BB
	FCB	$AF
	FCB	$DF
	FCB	$FF
	FCB	$EE
	FCB	$DD
	FCB	$BB
	FCB	$B7
	FCB	$DB
	FCB	$FF
	FCB	$E1
	FCB	$E3
	FCB	$C7
	FCB	$19
	FCB	$83
	FCB	$BF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
SCOART	LDX	#SCODAT
	LDY	#8393
	LDB	#6
SCOLOP	LDA	,X+
	CMPX	#SCOART
	BEQ	SCORET
	STA	,Y+
	DECB
	BNE	SCOLOP
	LDB	#6
	LEAY	+26,Y
	BRA	SCOLOP
SCORET	RTS
