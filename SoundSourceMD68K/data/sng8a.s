;=======================================================;
;			*$$SNG8A.S	(Song Data)						;
;						ORG. MDSNG11A.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S8A

;		list off
;		include	mdEQ11.LIB
;		include	mdMCR11.LIB
;		include	mdTB11.LIB
;		list on

		even

;===============================================;
;												;
;					 ASSIGN						;
;												;
;===============================================;
;=====< S8A CHANNEL TOTAL >=====;
FM8A	EQU		6				; FM Channel Total
PSG8A	EQU		3				; PSG Channel Total
;=========< S8A TEMPO >=========;
TP8A	EQU		2				; Tempo
DL8A	EQU		5				; Delay
;==========< S8A BIAS >=========;
FB8A0	EQU		0				; FM 0ch
FB8A1	EQU		0				; FM 1ch
FB8A2	EQU		0				; FM 2ch
FB8A4	EQU		0				; FM 4ch
FB8A5	EQU		0				; FM 5ch
FB8A6	EQU		0				; FM 6ch (if don't use PCM drum)
PB8A8	EQU		0				; PSG 80ch
PB8AA	EQU		0				; PSG A0ch
PB8AC	EQU		0				; PSG C0ch
;==========< S8A VOLM >=========;
FA8A0	EQU		10H				; FM 0ch
FA8A1	EQU		10H				; FM 1ch
FA8A2	EQU		10H				; FM 2ch
FA8A4	EQU		10H				; FM 4ch
FA8A5	EQU		10H				; FM 5ch
FA8A6	EQU		10H				; FM 6ch (if don't use PCM drum)
PA8A8	EQU		08H				; PSG 80ch
PA8AA	EQU		08H				; PSG A0ch
PA8AC	EQU		08H				; PSG C0ch
;==========< S8A ENVE >=========;
PE8A8	EQU		0				; PSG 80ch
PE8AA	EQU		0				; PSG A0ch
PE8AC	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S8A:
		TDW		TIMB8A,S8A				; Voice Top Address
		DC.B	FM8A,PSG8A,TP8A,DL8A	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB8AD,S8A				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB8A0,S8A				; FM 0ch Table Pointer
		DC.B	FB8A0,FA8A0				; Bias,Volm

		TDW		TAB8A1,S8A				; FM 1ch Table Pointer
		DC.B	FB8A1,FA8A1				; Bias,Volm

		TDW		TAB8A2,S8A				; FM 2ch Table Pointer
		DC.B	FB8A2,FA8A2				; Bias,Volm

		TDW		TAB8A4,S8A				; FM 4ch Table Pointer
		DC.B	FB8A4,FA8A4				; Bias,Volm

		TDW		TAB8A5,S8A				; FM 5ch Table Pointer
		DC.B	FB8A5,FA8A5				; Bias,Volm

;		TDW		TAB8A6,S8A				; FM 6ch Table Pointer
;		DC.B	FB8A6,FA8A6				; Bias,Volm (if don't use PCM drum)

		TDW		TAB8A8,S8A				; PSG 80ch Table Pointer
		DC.B	PB8A8,PA8A8,0,PE8A8		; Bias,Volm,Dummy,Enve

		TDW		TAB8AA,S8A				; PSG A0ch Table Pointer
		DC.B	PB8AA,PA8AA,0,PE8AA		; Bias,Volm,Dummy,Enve

		TDW		TAB8AC,S8A				; PSG C0ch Table Pointer
		DC.B	PB8AC,PA8AC,0,PE8AC		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB8A0	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB8A1	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB8A2	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB8A4	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB8A5	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB8A6	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB8A8	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB8AA	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB8AC	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB8AD	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB8A	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
