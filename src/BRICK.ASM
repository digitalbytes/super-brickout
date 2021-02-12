	ORG	$5000
				; Title Screen Graphics Subroutines
				; INCLUDED files contain routines
				; for displaying the graphics at the 
				; correct place on the screen.
				;
	INCLUDE	TITPUT.ASM 	; "SuperB" 
	INCLUDE	TOTPUT.ASM        ; "RICKOUT"
	INCLUDE	COPPUT.ASM 	; "Copyright ..."
	INCLUDE	NAMPUT.ASM 	; "Owen Stenseth"
	INCLUDE	HIGPUT.ASM 	; "High Score"
	INCLUDE	SCOPUT.ASM        ; "Score"
	INCLUDE	BUTPUT.ASM        ; "Press Button On..."

	INCLUDE	TOPART.ASM 	; Gameplay screen top banner

	INCLUDE	PMODE4.ASM 	; Routine to switch to PMODE4
;
;  Clear the screen, switch to PMODE4 and draw the title screen. 
;
GAME	LDX	#$E00
	LDD	#$FFFF
CLEARSCN	STD	,X++
	CMPX	#$E00+(192*32)
	BLO	CLEARSCN
	JSR	PMODE4
 	JSR	TITART
	JSR	TOTART
	JSR	COPART
	JSR	NAMART
	JSR	HIGART
	JSR	SCOART
	JSR	BUTART
	BRA	BUTT

; Storage for the high score.
HSCORE	FDB	0
HSDIGITS	FCB	0,0,0,0,0

; This draws the score to the title screen and 
; decides if the score is also the new high score.
; If it is the new high score, copy the score
; and score digits to the high score.

; Why this is called BUTT I have no idea.

BUTT	LDY	#$20D3		; Position on screen for the score
	LDX	#INCSCR-1	
BUT2	LDA	,X
	JSR	PUTNUM
	LEAY	-1,Y
	LEAX	-1,X
	CMPX	#SCORE-1
	BNE	BUT2
	LDX	SCORE-2
	CMPX	HSCORE
	BLS	BUTT5
	LDX	#INCSCR-1
	LDY	#HSDIGITS+5
BUTT3	LDA	,X
	STA	,Y
	LEAX	-1,X
	CMPX	#SCORE
	BEQ	BUTT4
	LEAY	-1,Y
	BRA	BUTT3
BUTT4	LDX	SCORE-2
	STX	HSCORE
BUTT5	LDY	#$1DD8
	LDX	#BUTT-1
BUT25	LDA	,X
	JSR	PUTNUM
	LEAY	-1,Y
	LEAX	-1,X
	CMPX	#HSCORE+1
	BNE	BUT25

; Wait for user to press the Joystick button
BUTTON	LDA	$FF00
	CMPA	#$FC	* Button press on PS4 controller
*	CMPA	#126	* Is this right? Seems to not work on the emulator.
	BEQ	PRESS
	CMPA	#$FE	* Second button on the deluxe joystick?
	BNE	BUTTON

PRESS	LDX	#$E00
	LDD	#$FFFF
CLRSCR	STD	,X++
	CMPX	#$E00+(192*32)
	BNE	CLRSCR
	JSR	TOPART
	LDA	#$FC
	LDX	#$E00+(28*32)
PULINE	STA	,X 
	LEAX	+32,X
	CMPX	#$E00+(192*32)
	BLO	PULINE
 	LDA	#$3F
 	LDX	#$E00+(28*32)+31
PULIN1	STA	,X
	LEAX	+32,X
	CMPX	#$E00+(192*32)+31
	BLO	PULIN1
	CLRA	
	LDX	#$E00+(190*32)+1
BTLINE	STA	,X
	STA	+32,X
	LEAX	+1,X
	CMPX	#$E00+(191*32)-1
	BLO	BTLINE

; Game Start Setup
	LDX	#TADATA 
	STX	POINT
	LDB	#1
	STB	CATCH		; Set the ball to be caught on the paddle
	CLR	PADB+4
	LDB	#3
	STB	MEN1		; Set the players number of paddles to 3
	LDX	#$600
	CLR	65280
	LDD	#0
	STD	SCORE-2		; Score stored as a 16 bit number.
	STD	SCORE 		; Score is stored as 5 digits
	STD	SCORE+2  	; in separate bytes. This makes for
	STB	SCORE+4		; easy rollover.

	LBRA	START5
	INCLUDE	BRICKOUT.ASM