;=======================================================;
;			*$$SNG86.S	(Song Data)						;
;						ORG. MDSNG116.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	S86

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
;=====< S86 CHANNEL TOTAL >=====;
FM86	EQU		6				; FM Channel Total
PSG86	EQU		3				; PSG Channel Total
;=========< S86 TEMPO >=========;
TP86	EQU		2				; Tempo
DL86	EQU		5				; Delay
;==========< S86 BIAS >=========;
FB860	EQU		0				; FM 0ch
FB861	EQU		0				; FM 1ch
FB862	EQU		0				; FM 2ch
FB864	EQU		0				; FM 4ch
FB865	EQU		0				; FM 5ch
FB866	EQU		0				; FM 6ch (if don't use PCM drum)
PB868	EQU		0				; PSG 80ch
PB86A	EQU		0				; PSG A0ch
PB86C	EQU		0				; PSG C0ch
;==========< S86 VOLM >=========;
FA860	EQU		10H				; FM 0ch
FA861	EQU		10H				; FM 1ch
FA862	EQU		10H				; FM 2ch
FA864	EQU		10H				; FM 4ch
FA865	EQU		10H				; FM 5ch
FA866	EQU		10H				; FM 6ch (if don't use PCM drum)
PA868	EQU		08H				; PSG 80ch
PA86A	EQU		08H				; PSG A0ch
PA86C	EQU		08H				; PSG C0ch
;==========< S86 ENVE >=========;
PE868	EQU		0				; PSG 80ch
PE86A	EQU		0				; PSG A0ch
PE86C	EQU		0				; PSG C0ch

;===============================================;
;												;
;					 HEADER						;
;												;
;===============================================;
S86:
		TDW		TIMB86,S86				; Voice Top Address
		DC.B	FM86,PSG86,TP86,DL86	; FM Total,PSG Total,Tempo,Delay

		TDW		TAB86D,S86				; PCM Drum Table Pointer
		DC.B	0,0						; Bias,Volm (Dummy)

		TDW		TAB860,S86				; FM 0ch Table Pointer
		DC.B	FB860,FA860				; Bias,Volm

		TDW		TAB861,S86				; FM 1ch Table Pointer
		DC.B	FB861,FA861				; Bias,Volm

		TDW		TAB862,S86				; FM 2ch Table Pointer
		DC.B	FB862,FA862				; Bias,Volm

		TDW		TAB864,S86				; FM 4ch Table Pointer
		DC.B	FB864,FA864				; Bias,Volm

		TDW		TAB865,S86				; FM 5ch Table Pointer
		DC.B	FB865,FA865				; Bias,Volm

;		TDW		TAB866,S86				; FM 6ch Table Pointer
;		DC.B	FB866,FA866				; Bias,Volm (if don't use PCM drum)

		TDW		TAB868,S86				; PSG 80ch Table Pointer
		DC.B	PB868,PA868,0,PE868		; Bias,Volm,Dummy,Enve

		TDW		TAB86A,S86				; PSG A0ch Table Pointer
		DC.B	PB86A,PA86A,0,PE86A		; Bias,Volm,Dummy,Enve

		TDW		TAB86C,S86				; PSG C0ch Table Pointer
		DC.B	PB86C,PA86C,0,PE86C		; Bias,Volm,Dummy,Enve

;===============================================;
;												;
;				   SONG TABLE					;
;												;
;===============================================;
;===============================================;
;					 FM 0ch						;
;===============================================;
TAB860	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 1ch						;
;===============================================;
TAB861	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 2ch						;
;===============================================;
TAB862	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 4ch						;
;===============================================;
TAB864	EQU		*
		DC.B	CMEND
;===============================================;
;					 FM 5ch						;
;===============================================;
TAB865	EQU		*
		DC.B	CMEND
;===============================================;
;		  FM 6ch (if don't use PCM drum)		;
;===============================================;
;TAB866	EQU		*
;		DC.B	CMEND
;===============================================;
;					 PSG 80ch					;
;===============================================;
TAB868	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG A0ch					;
;===============================================;
TAB86A	EQU		*
		DC.B	CMEND
;===============================================;
;					 PSG C0ch					;
;===============================================;
TAB86C	EQU		*
		DC.B	CMEND
;===============================================;
;					 PCM DRUM					;
;===============================================;
TAB86D	EQU		*
		DC.B	CMEND

;===============================================;
;												;
;					  VOICE						;
;												;
;===============================================;
TIMB86	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
