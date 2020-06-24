;=======================================================;
;			*$$SNG89.S	(Song Data)						;
;						ORG. MDSNG119.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S89

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
;=====< S89 CHANNEL TOTAL >=====;
FM89	EQU		6				; FM Channel Total
PSG89	EQU		3				; PSG Channel Total
;=========< S89 TEMPO >=========;
TP89	EQU		2				; Tempo
DL89	EQU		5				; Delay
;==========< S89 BIAS >=========;
FB890	EQU		0				; FM 0ch
FB891	EQU		0				; FM 1ch
FB892	EQU		0				; FM 2ch
FB894	EQU		0				; FM 4ch
FB895	EQU		0				; FM 5ch
FB896	EQU		0				; FM 6ch (if don't use PCM drum)
PB898	EQU		0				; PSG 80ch
PB89A	EQU		0				; PSG A0ch
PB89C	EQU		0				; PSG C0ch
;==========< S89 VOLM >=========;
FA890	EQU		10H				; FM 0ch
FA891	EQU		10H				; FM 1ch
FA892	EQU		10H				; FM 2ch
FA894	EQU		10H				; FM 4ch
FA895	EQU		10H				; FM 5ch
FA896	EQU		10H				; FM 6ch (if don't use PCM drum)
PA898	EQU		08H				; PSG 80ch
PA89A	EQU		08H				; PSG A0ch
PA89C	EQU		08H				; PSG C0ch
;==========< S89 ENVE >=========;
PE898	EQU		0				; PSG 80ch
PE89A	EQU		0				; PSG A0ch
PE89C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S89:
		TDW		TIMB89,S89				; Voice Top Address
		DC.B	FM89,PSG89,TP89,DL89	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB89D,S89				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB890,S89				; FM 0ch Table Pointer
		DC.B	FB890,FA890				; Bias,Volm

		TDW		TAB891,S89				; FM 1ch Table Pointer
		DC.B	FB891,FA891				; Bias,Volm

		TDW		TAB892,S89				; FM 2ch Table Pointer
		DC.B	FB892,FA892				; Bias,Volm

		TDW		TAB894,S89				; FM 4ch Table Pointer
		DC.B	FB894,FA894				; Bias,Volm

		TDW		TAB895,S89				; FM 5ch Table Pointer
		DC.B	FB895,FA895				; Bias,Volm

;		TDW		TAB896,S89				; FM 6ch Table Pointer
;		DC.B	FB896,FA896				; Bias,Volm (if don't use PCM drum)

		TDW		TAB898,S89				; PSG 80ch Table Pointer
		DC.B	PB898,PA898,0,PE898		; Bias,Volm,Dummy,Enve

		TDW		TAB89A,S89				; PSG A0ch Table Pointer
		DC.B	PB89A,PA89A,0,PE89A		; Bias,Volm,Dummy,Enve

		TDW		TAB89C,S89				; PSG C0ch Table Pointer
		DC.B	PB89C,PA89C,0,PE89C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB890	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB891	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB892	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB894	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB895	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB896	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB898	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB89A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB89C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB89D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB89	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
