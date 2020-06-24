;=======================================================;
;			*$$SNG8B.S	(Song Data)						;
;						ORG. MDSNG11B.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S8B

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
;=====< S8B CHANNEL TOTAL >=====;
FM8B	EQU		6				; FM Channel Total
PSG8B	EQU		3				; PSG Channel Total
;=========< S8B TEMPO >=========;
TP8B	EQU		2				; Tempo
DL8B	EQU		5				; Delay
;==========< S8B BIAS >=========;
FB8B0	EQU		0				; FM 0ch
FB8B1	EQU		0				; FM 1ch
FB8B2	EQU		0				; FM 2ch
FB8B4	EQU		0				; FM 4ch
FB8B5	EQU		0				; FM 5ch
FB8B6	EQU		0				; FM 6ch (if don't use PCM drum)
PB8B8	EQU		0				; PSG 80ch
PB8BA	EQU		0				; PSG A0ch
PB8BC	EQU		0				; PSG C0ch
;==========< S8B VOLM >=========;
FA8B0	EQU		10H				; FM 0ch
FA8B1	EQU		10H				; FM 1ch
FA8B2	EQU		10H				; FM 2ch
FA8B4	EQU		10H				; FM 4ch
FA8B5	EQU		10H				; FM 5ch
FA8B6	EQU		10H				; FM 6ch (if don't use PCM drum)
PA8B8	EQU		08H				; PSG 80ch
PA8BA	EQU		08H				; PSG A0ch
PA8BC	EQU		08H				; PSG C0ch
;==========< S8B ENVE >=========;
PE8B8	EQU		0				; PSG 80ch
PE8BA	EQU		0				; PSG A0ch
PE8BC	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S8B:
		TDW		TIMB8B,S8B				; Voice Top Address
		DC.B	FM8B,PSG8B,TP8B,DL8B	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB8BD,S8B				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB8B0,S8B				; FM 0ch Table Pointer
		DC.B	FB8B0,FA8B0				; Bias,Volm

		TDW		TAB8B1,S8B				; FM 1ch Table Pointer
		DC.B	FB8B1,FA8B1				; Bias,Volm

		TDW		TAB8B2,S8B				; FM 2ch Table Pointer
		DC.B	FB8B2,FA8B2				; Bias,Volm

		TDW		TAB8B4,S8B				; FM 4ch Table Pointer
		DC.B	FB8B4,FA8B4				; Bias,Volm

		TDW		TAB8B5,S8B				; FM 5ch Table Pointer
		DC.B	FB8B5,FA8B5				; Bias,Volm

;		TDW		TAB8B6,S8B				; FM 6ch Table Pointer
;		DC.B	FB8B6,FA8B6				; Bias,Volm (if don't use PCM drum)

		TDW		TAB8B8,S8B				; PSG 80ch Table Pointer
		DC.B	PB8B8,PA8B8,0,PE8B8		; Bias,Volm,Dummy,Enve

		TDW		TAB8BA,S8B				; PSG A0ch Table Pointer
		DC.B	PB8BA,PA8BA,0,PE8BA		; Bias,Volm,Dummy,Enve

		TDW		TAB8BC,S8B				; PSG C0ch Table Pointer
		DC.B	PB8BC,PA8BC,0,PE8BC		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB8B0	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB8B1	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB8B2	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB8B4	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB8B5	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB8B6	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB8B8	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB8BA	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB8BC	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB8BD	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB8B	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
