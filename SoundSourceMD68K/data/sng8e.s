;=======================================================;
;			*$$SNG8E.S	(Song Data)						;
;						ORG. MDSNG11E.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S8E

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
;=====< S8E CHANNEL TOTAL >=====;
FM8E	EQU		6				; FM Channel Total
PSG8E	EQU		3				; PSG Channel Total
;=========< S8E TEMPO >=========;
TP8E	EQU		2				; Tempo
DL8E	EQU		5				; Delay
;==========< S8E BIAS >=========;
FB8E0	EQU		0				; FM 0ch
FB8E1	EQU		0				; FM 1ch
FB8E2	EQU		0				; FM 2ch
FB8E4	EQU		0				; FM 4ch
FB8E5	EQU		0				; FM 5ch
FB8E6	EQU		0				; FM 6ch (if don't use PCM drum)
PB8E8	EQU		0				; PSG 80ch
PB8EA	EQU		0				; PSG A0ch
PB8EC	EQU		0				; PSG C0ch
;==========< S8E VOLM >=========;
FA8E0	EQU		10H				; FM 0ch
FA8E1	EQU		10H				; FM 1ch
FA8E2	EQU		10H				; FM 2ch
FA8E4	EQU		10H				; FM 4ch
FA8E5	EQU		10H				; FM 5ch
FA8E6	EQU		10H				; FM 6ch (if don't use PCM drum)
PA8E8	EQU		08H				; PSG 80ch
PA8EA	EQU		08H				; PSG A0ch
PA8EC	EQU		08H				; PSG C0ch
;==========< S8E ENVE >=========;
PE8E8	EQU		0				; PSG 80ch
PE8EA	EQU		0				; PSG A0ch
PE8EC	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S8E:
		TDW		TIMB8E,S8E				; Voice Top Address
		DC.B	FM8E,PSG8E,TP8E,DL8E	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB8ED,S8E				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB8E0,S8E				; FM 0ch Table Pointer
		DC.B	FB8E0,FA8E0				; Bias,Volm

		TDW		TAB8E1,S8E				; FM 1ch Table Pointer
		DC.B	FB8E1,FA8E1				; Bias,Volm

		TDW		TAB8E2,S8E				; FM 2ch Table Pointer
		DC.B	FB8E2,FA8E2				; Bias,Volm

		TDW		TAB8E4,S8E				; FM 4ch Table Pointer
		DC.B	FB8E4,FA8E4				; Bias,Volm

		TDW		TAB8E5,S8E				; FM 5ch Table Pointer
		DC.B	FB8E5,FA8E5				; Bias,Volm

;		TDW		TAB8E6,S8E				; FM 6ch Table Pointer
;		DC.B	FB8E6,FA8E6				; Bias,Volm (if don't use PCM drum)

		TDW		TAB8E8,S8E				; PSG 80ch Table Pointer
		DC.B	PB8E8,PA8E8,0,PE8E8		; Bias,Volm,Dummy,Enve

		TDW		TAB8EA,S8E				; PSG A0ch Table Pointer
		DC.B	PB8EA,PA8EA,0,PE8EA		; Bias,Volm,Dummy,Enve

		TDW		TAB8EC,S8E				; PSG C0ch Table Pointer
		DC.B	PB8EC,PA8EC,0,PE8EC		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB8E0	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB8E1	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB8E2	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB8E4	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB8E5	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB8E6	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB8E8	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB8EA	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB8EC	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB8ED	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB8E	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
