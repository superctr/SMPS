;=======================================================;
;			*$$SNG83.S	(Song Data)						;
;						ORG. MDSNG113.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S83

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
;=====< S83 CHANNEL TOTAL >=====;
FM83	EQU		6				; FM Channel Total
PSG83	EQU		3				; PSG Channel Total
;=========< S83 TEMPO >=========;
TP83	EQU		2				; Tempo
DL83	EQU		5				; Delay
;==========< S83 BIAS >=========;
FB830	EQU		0				; FM 0ch
FB831	EQU		0				; FM 1ch
FB832	EQU		0				; FM 2ch
FB834	EQU		0				; FM 4ch
FB835	EQU		0				; FM 5ch
FB836	EQU		0				; FM 6ch (if don't use PCM drum)
PB838	EQU		0				; PSG 80ch
PB83A	EQU		0				; PSG A0ch
PB83C	EQU		0				; PSG C0ch
;==========< S83 VOLM >=========;
FA830	EQU		10H				; FM 0ch
FA831	EQU		10H				; FM 1ch
FA832	EQU		10H				; FM 2ch
FA834	EQU		10H				; FM 4ch
FA835	EQU		10H				; FM 5ch
FA836	EQU		10H				; FM 6ch (if don't use PCM drum)
PA838	EQU		08H				; PSG 80ch
PA83A	EQU		08H				; PSG A0ch
PA83C	EQU		08H				; PSG C0ch
;==========< S83 ENVE >=========;
PE838	EQU		0				; PSG 80ch
PE83A	EQU		0				; PSG A0ch
PE83C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S83:
		TDW		TIMB83,S83				; Voice Top Address
		DC.B	FM83,PSG83,TP83,DL83	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB83D,S83				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB830,S83				; FM 0ch Table Pointer
		DC.B	FB830,FA830				; Bias,Volm

		TDW		TAB831,S83				; FM 1ch Table Pointer
		DC.B	FB831,FA831				; Bias,Volm

		TDW		TAB832,S83				; FM 2ch Table Pointer
		DC.B	FB832,FA832				; Bias,Volm

		TDW		TAB834,S83				; FM 4ch Table Pointer
		DC.B	FB834,FA834				; Bias,Volm

		TDW		TAB835,S83				; FM 5ch Table Pointer
		DC.B	FB835,FA835				; Bias,Volm

;		TDW		TAB836,S83				; FM 6ch Table Pointer
;		DC.B	FB836,FA836				; Bias,Volm (if don't use PCM drum)

		TDW		TAB838,S83				; PSG 80ch Table Pointer
		DC.B	PB838,PA838,0,PE838		; Bias,Volm,Dummy,Enve

		TDW		TAB83A,S83				; PSG A0ch Table Pointer
		DC.B	PB83A,PA83A,0,PE83A		; Bias,Volm,Dummy,Enve

		TDW		TAB83C,S83				; PSG C0ch Table Pointer
		DC.B	PB83C,PA83C,0,PE83C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB830	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB831	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB832	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB834	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB835	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB836	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB838	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB83A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB83C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB83D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB83	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
