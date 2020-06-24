;=======================================================;
;			*$$SNG8C.S	(Song Data)						;
;						ORG. MDSNG11C.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S8C

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
;=====< S8C CHANNEL TOTAL >=====;
FM8C	EQU		6				; FM Channel Total
PSG8C	EQU		3				; PSG Channel Total
;=========< S8C TEMPO >=========;
TP8C	EQU		2				; Tempo
DL8C	EQU		5				; Delay
;==========< S8C BIAS >=========;
FB8C0	EQU		0				; FM 0ch
FB8C1	EQU		0				; FM 1ch
FB8C2	EQU		0				; FM 2ch
FB8C4	EQU		0				; FM 4ch
FB8C5	EQU		0				; FM 5ch
FB8C6	EQU		0				; FM 6ch (if don't use PCM drum)
PB8C8	EQU		0				; PSG 80ch
PB8CA	EQU		0				; PSG A0ch
PB8CC	EQU		0				; PSG C0ch
;==========< S8C VOLM >=========;
FA8C0	EQU		10H				; FM 0ch
FA8C1	EQU		10H				; FM 1ch
FA8C2	EQU		10H				; FM 2ch
FA8C4	EQU		10H				; FM 4ch
FA8C5	EQU		10H				; FM 5ch
FA8C6	EQU		10H				; FM 6ch (if don't use PCM drum)
PA8C8	EQU		08H				; PSG 80ch
PA8CA	EQU		08H				; PSG A0ch
PA8CC	EQU		08H				; PSG C0ch
;==========< S8C ENVE >=========;
PE8C8	EQU		0				; PSG 80ch
PE8CA	EQU		0				; PSG A0ch
PE8CC	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S8C:
		TDW		TIMB8C,S8C				; Voice Top Address
		DC.B	FM8C,PSG8C,TP8C,DL8C	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB8CD,S8C				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB8C0,S8C				; FM 0ch Table Pointer
		DC.B	FB8C0,FA8C0				; Bias,Volm

		TDW		TAB8C1,S8C				; FM 1ch Table Pointer
		DC.B	FB8C1,FA8C1				; Bias,Volm

		TDW		TAB8C2,S8C				; FM 2ch Table Pointer
		DC.B	FB8C2,FA8C2				; Bias,Volm

		TDW		TAB8C4,S8C				; FM 4ch Table Pointer
		DC.B	FB8C4,FA8C4				; Bias,Volm

		TDW		TAB8C5,S8C				; FM 5ch Table Pointer
		DC.B	FB8C5,FA8C5				; Bias,Volm

;		TDW		TAB8C6,S8C				; FM 6ch Table Pointer
;		DC.B	FB8C6,FA8C6				; Bias,Volm (if don't use PCM drum)

		TDW		TAB8C8,S8C				; PSG 80ch Table Pointer
		DC.B	PB8C8,PA8C8,0,PE8C8		; Bias,Volm,Dummy,Enve

		TDW		TAB8CA,S8C				; PSG A0ch Table Pointer
		DC.B	PB8CA,PA8CA,0,PE8CA		; Bias,Volm,Dummy,Enve

		TDW		TAB8CC,S8C				; PSG C0ch Table Pointer
		DC.B	PB8CC,PA8CC,0,PE8CC		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB8C0	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB8C1	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB8C2	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB8C4	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB8C5	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB8C6	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB8C8	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB8CA	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB8CC	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB8CD	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB8C	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
