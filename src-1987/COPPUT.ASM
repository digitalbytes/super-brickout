** WIDTH
** 16 
COPDAT	FCB	$F1
	FCB	$E3
	FCB	$83
	FCB	$88
	FCB	$C1
	FCB	$E3
	FCB	$8F
	FCB	$11
	FCB	$83
	FCB	$FF
	FCB	$71
	FCB	$DF
	FCB	$FD
	FCB	$E3
	FCB	$C7
	FCB	$07
	FCB	$EE
	FCB	$DD
	FCB	$DD
	FCB	$DD
	FCB	$EE
	FCB	$F7
	FCB	$77
	FCB	$BB
	FCB	$AB
	FCB	$FE
	FCB	$EE
	FCB	$EF
	FCB	$F9
	FCB	$DD
	FCB	$BB
	FCB	$77
	FCB	$EF
	FCB	$DD
	FCB	$DD
	FCB	$EB
	FCB	$EE
	FCB	$F7
	FCB	$7F
	FCB	$BB
	FCB	$EF
	FCB	$FE
	FCB	$EF
	FCB	$EF
	FCB	$FD
	FCB	$DD
	FCB	$BB
	FCB	$F7
	FCB	$EF
	FCB	$DD
	FCB	$DD
	FCB	$EB
	FCB	$EE
	FCB	$F7
	FCB	$7F
	FCB	$83
	FCB	$EF
	FCB	$FD
	FCB	$EF
	FCB	$F7
	FCB	$FD
	FCB	$DD
	FCB	$C7
	FCB	$EF
	FCB	$EF
	FCB	$DD
	FCB	$C3
	FCB	$F7
	FCB	$E1
	FCB	$F7
	FCB	$63
	FCB	$BB
	FCB	$EF
	FCB	$FD
	FCB	$EF
	FCB	$F7
	FCB	$FD
	FCB	$E1
	FCB	$BB
	FCB	$EF
	FCB	$EF
	FCB	$DD
	FCB	$DF
	FCB	$F7
	FCB	$EB
	FCB	$F7
	FCB	$77
	FCB	$BB
	FCB	$EF
	FCB	$FD
	FCB	$EF
	FCB	$F7
	FCB	$FD
	FCB	$FD
	FCB	$BB
	FCB	$DF
	FCB	$EE
	FCB	$DD
	FCB	$DF
	FCB	$F7
	FCB	$ED
	FCB	$F7
	FCB	$77
	FCB	$BB
	FCB	$EF
	FCB	$FD
	FCB	$EE
	FCB	$F7
	FCB	$FD
	FCB	$FB
	FCB	$BB
	FCB	$DF
	FCB	$F1
	FCB	$E3
	FCB	$8F
	FCB	$E3
	FCB	$C6
	FCB	$63
	FCB	$8F
	FCB	$11
	FCB	$C7
	FCB	$FE
	FCB	$F1
	FCB	$EF
	FCB	$F8
	FCB	$E7
	FCB	$C7
	FCB	$DF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FE
	FCB	$FF
	FCB	$EF
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
	FCB	$FF
	FCB	$FF
	FCB	$7F
	FCB	$DF
	FCB	$FF
	FCB	$FF
	FCB	$FF
	FCB	$FF
COPART	LDX	#COPDAT
	LDY	#6089
	LDB	#16
COPLOP	LDA	,X+
	CMPX	#COPART
	BEQ	COPRET
	STA	,Y+
	DECB
	BNE	COPLOP
	LDB	#16
	LEAY	+16,Y
	BRA	COPLOP
COPRET	RTS
