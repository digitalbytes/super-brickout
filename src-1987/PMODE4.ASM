** PMODE 4,1: SCREEN 1,1
**

PMODE4	LDX	#65472
	CLR	,X
	CLR	3,X
	CLR	5,X

	CLR	7,X
	CLR	9,X
	CLR	11,X
	CLR	12,X
	CLR	14,X
	CLR	16,X
	CLR	18,X

	LDA	#7
	ANDA	65314
	ORA	#248
	STA	65314

	RTS
