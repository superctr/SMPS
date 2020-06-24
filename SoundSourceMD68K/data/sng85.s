;=======================================================;
;			*$$SNG85.S	(Song Data)						;
;						ORG. MDSNG115.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S85

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
;=====< S85 CHANNEL TOTAL >=====;
FM85	EQU		6				; FM Channel Total
PSG85	EQU		3				; PSG Channel Total
;=========< S85 TEMPO >=========;
TP85	EQU		2				; Tempo
DL85	EQU		5				; Delay
;==========< S85 BIAS >=========;
FB850	EQU		0				; FM 0ch
FB851	EQU		0				; FM 1ch
FB852	EQU		0				; FM 2ch
FB854	EQU		0				; FM 4ch
FB855	EQU		0				; FM 5ch
FB856	EQU		0				; FM 6ch (if don't use PCM drum)
PB858	EQU		0				; PSG 80ch
PB85A	EQU		0				; PSG A0ch
PB85C	EQU		0				; PSG C0ch
;==========< S85 VOLM >=========;
FA850	EQU		10H				; FM 0ch
FA851	EQU		10H				; FM 1ch
FA852	EQU		10H				; FM 2ch
FA854	EQU		10H				; FM 4ch
FA855	EQU		10H				; FM 5ch
FA856	EQU		10H				; FM 6ch (if don't use PCM drum)
PA858	EQU		08H				; PSG 80ch
PA85A	EQU		08H				; PSG A0ch
PA85C	EQU		08H				; PSG C0ch
;==========< S85 ENVE >=========;
PE858	EQU		0				; PSG 80ch
PE85A	EQU		0				; PSG A0ch
PE85C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S85:
		TDW		TIMB85,S85				; Voice Top Address
		DC.B	FM85,PSG85,TP85,DL85	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB85D,S85				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB850,S85				; FM 0ch Table Pointer
		DC.B	FB850,FA850				; Bias,Volm

		TDW		TAB851,S85				; FM 1ch Table Pointer
		DC.B	FB851,FA851				; Bias,Volm

		TDW		TAB852,S85				; FM 2ch Table Pointer
		DC.B	FB852,FA852				; Bias,Volm

		TDW		TAB854,S85				; FM 4ch Table Pointer
		DC.B	FB854,FA854				; Bias,Volm

		TDW		TAB855,S85				; FM 5ch Table Pointer
		DC.B	FB855,FA855				; Bias,Volm

;		TDW		TAB856,S85				; FM 6ch Table Pointer
;		DC.B	FB856,FA856				; Bias,Volm (if don't use PCM drum)

		TDW		TAB858,S85				; PSG 80ch Table Pointer
		DC.B	PB858,PA858,0,PE858		; Bias,Volm,Dummy,Enve

		TDW		TAB85A,S85				; PSG A0ch Table Pointer
		DC.B	PB85A,PA85A,0,PE85A		; Bias,Volm,Dummy,Enve

		TDW		TAB85C,S85				; PSG C0ch Table Pointer
		DC.B	PB85C,PA85C,0,PE85C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB850	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB851	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB852	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB854	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB855	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB856	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB858	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB85A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB85C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB85D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB85	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
