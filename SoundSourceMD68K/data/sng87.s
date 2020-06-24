;=======================================================;
;			*$$SNG87.S	(Song Data)						;
;						ORG. MDSNG117.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S87

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
;=====< S87 CHANNEL TOTAL >=====;
FM87	EQU		6				; FM Channel Total
PSG87	EQU		3				; PSG Channel Total
;=========< S87 TEMPO >=========;
TP87	EQU		2				; Tempo
DL87	EQU		5				; Delay
;==========< S87 BIAS >=========;
FB870	EQU		0				; FM 0ch
FB871	EQU		0				; FM 1ch
FB872	EQU		0				; FM 2ch
FB874	EQU		0				; FM 4ch
FB875	EQU		0				; FM 5ch
FB876	EQU		0				; FM 6ch (if don't use PCM drum)
PB878	EQU		0				; PSG 80ch
PB87A	EQU		0				; PSG A0ch
PB87C	EQU		0				; PSG C0ch
;==========< S87 VOLM >=========;
FA870	EQU		10H				; FM 0ch
FA871	EQU		10H				; FM 1ch
FA872	EQU		10H				; FM 2ch
FA874	EQU		10H				; FM 4ch
FA875	EQU		10H				; FM 5ch
FA876	EQU		10H				; FM 6ch (if don't use PCM drum)
PA878	EQU		08H				; PSG 80ch
PA87A	EQU		08H				; PSG A0ch
PA87C	EQU		08H				; PSG C0ch
;==========< S87 ENVE >=========;
PE878	EQU		0				; PSG 80ch
PE87A	EQU		0				; PSG A0ch
PE87C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S87:
		TDW		TIMB87,S87				; Voice Top Address
		DC.B	FM87,PSG87,TP87,DL87	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB87D,S87				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB870,S87				; FM 0ch Table Pointer
		DC.B	FB870,FA870				; Bias,Volm

		TDW		TAB871,S87				; FM 1ch Table Pointer
		DC.B	FB871,FA871				; Bias,Volm

		TDW		TAB872,S87				; FM 2ch Table Pointer
		DC.B	FB872,FA872				; Bias,Volm

		TDW		TAB874,S87				; FM 4ch Table Pointer
		DC.B	FB874,FA874				; Bias,Volm

		TDW		TAB875,S87				; FM 5ch Table Pointer
		DC.B	FB875,FA875				; Bias,Volm

;		TDW		TAB876,S87				; FM 6ch Table Pointer
;		DC.B	FB876,FA876				; Bias,Volm (if don't use PCM drum)

		TDW		TAB878,S87				; PSG 80ch Table Pointer
		DC.B	PB878,PA878,0,PE878		; Bias,Volm,Dummy,Enve

		TDW		TAB87A,S87				; PSG A0ch Table Pointer
		DC.B	PB87A,PA87A,0,PE87A		; Bias,Volm,Dummy,Enve

		TDW		TAB87C,S87				; PSG C0ch Table Pointer
		DC.B	PB87C,PA87C,0,PE87C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB870	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB871	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB872	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB874	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB875	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB876	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB878	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB87A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB87C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB87D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB87	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
