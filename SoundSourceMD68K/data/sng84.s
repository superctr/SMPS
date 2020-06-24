;=======================================================;
;			*$$SNG84.S	(Song Data)						;
;						ORG. MDSNG114.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S84

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
;=====< S84 CHANNEL TOTAL >=====;
FM84	EQU		6				; FM Channel Total
PSG84	EQU		3				; PSG Channel Total
;=========< S84 TEMPO >=========;
TP84	EQU		2				; Tempo
DL84	EQU		5				; Delay
;==========< S84 BIAS >=========;
FB840	EQU		0				; FM 0ch
FB841	EQU		0				; FM 1ch
FB842	EQU		0				; FM 2ch
FB844	EQU		0				; FM 4ch
FB845	EQU		0				; FM 5ch
FB846	EQU		0				; FM 6ch (if don't use PCM drum)
PB848	EQU		0				; PSG 80ch
PB84A	EQU		0				; PSG A0ch
PB84C	EQU		0				; PSG C0ch
;==========< S84 VOLM >=========;
FA840	EQU		10H				; FM 0ch
FA841	EQU		10H				; FM 1ch
FA842	EQU		10H				; FM 2ch
FA844	EQU		10H				; FM 4ch
FA845	EQU		10H				; FM 5ch
FA846	EQU		10H				; FM 6ch (if don't use PCM drum)
PA848	EQU		08H				; PSG 80ch
PA84A	EQU		08H				; PSG A0ch
PA84C	EQU		08H				; PSG C0ch
;==========< S84 ENVE >=========;
PE848	EQU		0				; PSG 80ch
PE84A	EQU		0				; PSG A0ch
PE84C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S84:
		TDW		TIMB84,S84				; Voice Top Address
		DC.B	FM84,PSG84,TP84,DL84	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB84D,S84				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB840,S84				; FM 0ch Table Pointer
		DC.B	FB840,FA840				; Bias,Volm

		TDW		TAB841,S84				; FM 1ch Table Pointer
		DC.B	FB841,FA841				; Bias,Volm

		TDW		TAB842,S84				; FM 2ch Table Pointer
		DC.B	FB842,FA842				; Bias,Volm

		TDW		TAB844,S84				; FM 4ch Table Pointer
		DC.B	FB844,FA844				; Bias,Volm

		TDW		TAB845,S84				; FM 5ch Table Pointer
		DC.B	FB845,FA845				; Bias,Volm

;		TDW		TAB846,S84				; FM 6ch Table Pointer
;		DC.B	FB846,FA846				; Bias,Volm (if don't use PCM drum)

		TDW		TAB848,S84				; PSG 80ch Table Pointer
		DC.B	PB848,PA848,0,PE848		; Bias,Volm,Dummy,Enve

		TDW		TAB84A,S84				; PSG A0ch Table Pointer
		DC.B	PB84A,PA84A,0,PE84A		; Bias,Volm,Dummy,Enve

		TDW		TAB84C,S84				; PSG C0ch Table Pointer
		DC.B	PB84C,PA84C,0,PE84C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB840	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB841	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB842	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB844	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB845	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB846	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB848	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB84A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB84C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB84D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB84	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
