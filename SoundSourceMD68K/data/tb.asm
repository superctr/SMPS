;=======================================================;
;			*$$TB.ASM  (Sound Adddress & Data Table)	;
;						ORG. MDTB11.ASM					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		list off
;		include mdEQ11.lib
;		include mdMCR11.lib
;		include mdTB11.lib
;		list on

;		public	adrtb
;		public	bgmtb,envetb,prtb
;		extern	S81,S82,S83,S84,S85,S86,S87,S88,S89,S8A,S8B,S8C,S8D,S8E,S8F
;		extern	S90,S91,S92,S93,S94,S95,S96,S97

;		if		prg
;		extern	sound
;		extern	setb
;		extern	backtb
;		org		sound_top
;		else
;sound	equ		control_top
;setb	equ		se_top
;backtb	equ		setb+(seend-sestrt+1)*4
;		org		song_top
;		endif

;=======================================;
;										;
;			 TABLE.ASM START			;
;										;
;=======================================;


;=======================================;
;										;
;			  ADDRESS TABLE				;
;										;
;=======================================;

adrtb:
		dc.l	prtb					; priority
		dc.l	backtb					; back se
		dc.l	bgmtb					; bgm
		dc.l	setb					; s.e
		dc.l	prtb					; dmy (vibr)
		dc.l	envetb					; envelope
		dc.l	sestrt					; se start no.
		dc.l	sound					; 7th fix (for sound editor)

;=======================================;
;										;
;			  ENVELOPE TABLE			;
;										;
;=======================================;
envetb:
		DC.L	EV1,EV2,EV3,EV4,EV5,EV6
		DC.L	EV7,EV8

EV1		EQU		*
		DC.B	0,0,0,1,1,1,2,2,2,3,3,3
		DC.B	4,4,4,5,5,5,6,6,6
		DC.B	7,TBEND
EV2		EQU		*
		DC.B	0,2,4,6,8,10H,TBEND
EV3		EQU		*
		DC.B	0,0,1,1,3,3,4,5,TBEND
EV4		EQU		*
		DC.B	0,0,2,3,4,4,5,5,5
		DC.B	6,TBEND					;HIHAT(THEN CMGATE,3)
EV6		EQU		*
		DC.B	4,4,4,4,3,3,3,3,2,2,2,2
		DC.B	1,1,1,1
EV5		EQU		*
		DC.B	0,0,0,0,0,0,0,0,0,0
		DC.B	1,1,1,1,1,1,1,1,1,1
		DC.B	1,1,1,1,2,2,2,2,2,2
		DC.B	2,2,3,3,3,3,3,3,3,3
		DC.B	4,TBEND
EV7		EQU		*
		DC.B	2,TBEND					;HIHAT
EV8		EQU		*
		DC.B	0,0,0,0,0,1,1,1,1,1
		DC.B	2,2,2,2,2,2,3,3,3,3,3
		DC.B	4,4,4,4,4,5,5,5,5,5
		DC.B	6,6,6,6,6,7,7,7,TBEND

		even
;=======================================;
;										;
;			SONG ADDRESS TABLE			;
;										;
;=======================================;
bgmtb:
		DC.L	S81						; 81
		DC.L	S82						; 82
		DC.L	S83						; 83
		DC.L	S84						; 84
		DC.L	S85						; 85
		DC.L	S86						; 86
		DC.L	S81						; 87
		DC.L	S81						; 88
		DC.L	S81						; 89
		DC.L	S81						; 8A
		DC.L	S81						; 8B
		DC.L	S81						; 8C
		DC.L	S81						; 8D
		DC.L	S81						; 8E
		DC.L	S81						; 8F

;=======================================;
;										;
;			  PRIORITY TABLE			;
;										;
;=======================================;
prtb:
		if		lstno>081H-1
				DC.B	PR81
		endif
		if		lstno>082H-1
				DC.B	PR82
		endif
		if		lstno>083H-1
				DC.B	PR83
		endif
		if		lstno>084H-1
				DC.B	PR84
		endif
		if		lstno>085H-1
				DC.B	PR85
		endif
		if		lstno>086H-1
				DC.B	PR86
		endif
		if		lstno>087H-1
				DC.B	PR87
		endif
		if		lstno>088H-1
				DC.B	PR88
		endif
		if		lstno>089H-1
				DC.B	PR89
		endif
		if		lstno>08AH-1
				DC.B	PR8A
		endif
		if		lstno>08BH-1
				DC.B	PR8B
		endif
		if		lstno>08CH-1
				DC.B	PR8C
		endif
		if		lstno>08DH-1
				DC.B	PR8D
		endif
		if		lstno>08EH-1
				DC.B	PR8E
		endif
		if		lstno>08FH-1
				DC.B	PR8F
		endif
		if		lstno>090H-1
				DC.B	PR90
		endif
		if		lstno>091H-1
				DC.B	PR91
		endif
		if		lstno>092H-1
				DC.B	PR92
		endif
		if		lstno>093H-1
				DC.B	PR93
		endif
		if		lstno>094H-1
				DC.B	PR94
		endif
		if		lstno>095H-1
				DC.B	PR95
		endif
		if		lstno>096H-1
				DC.B	PR96
		endif
		if		lstno>097H-1
				DC.B	PR97
		endif
		if		lstno>098H-1
				DC.B	PR98
		endif
		if		lstno>099H-1
				DC.B	PR99
		endif
		if		lstno>09AH-1
				DC.B	PR9A
		endif
		if		lstno>09BH-1
				DC.B	PR9B
		endif
		if		lstno>09CH-1
				DC.B	PR9C
		endif
		if		lstno>09DH-1
				DC.B	PR9D
		endif
		if		lstno>09EH-1
				DC.B	PR9E
		endif
		if		lstno>09FH-1
				DC.B	PR9F
		endif
		if		lstno>0A0H-1
				DC.B	PRA0
		endif
		if		lstno>0A1H-1
				DC.B	PRA1
		endif
		if		lstno>0A2H-1
				DC.B	PRA2
		endif
		if		lstno>0A3H-1
				DC.B	PRA3
		endif
		if		lstno>0A4H-1
				DC.B	PRA4
		endif
		if		lstno>0A5H-1
				DC.B	PRA5
		endif
		if		lstno>0A6H-1
				DC.B	PRA6
		endif
		if		lstno>0A7H-1
				DC.B	PRA7
		endif
		if		lstno>0A8H-1
				DC.B	PRA8
		endif
		if		lstno>0A9H-1
				DC.B	PRA9
		endif
		if		lstno>0AAH-1
				DC.B	PRAA
		endif
		if		lstno>0ABH-1
				DC.B	PRAB
		endif
		if		lstno>0ACH-1
				DC.B	PRAC
		endif
		if		lstno>0ADH-1
				DC.B	PRAD
		endif
		if		lstno>0AEH-1
				DC.B	PRAE
		endif
		if		lstno>0AFH-1
				DC.B	PRAF
		endif
		if		lstno>0B0H-1
				DC.B	PRB0
		endif
		if		lstno>0B1H-1
				DC.B	PRB1
		endif
		if		lstno>0B2H-1
				DC.B	PRB2
		endif
		if		lstno>0B3H-1
				DC.B	PRB3
		endif
		if		lstno>0B4H-1
				DC.B	PRB4
		endif
		if		lstno>0B5H-1
				DC.B	PRB5
		endif
		if		lstno>0B6H-1
				DC.B	PRB6
		endif
		if		lstno>0B7H-1
				DC.B	PRB7
		endif
		if		lstno>0B8H-1
				DC.B	PRB8
		endif
		if		lstno>0B9H-1
				DC.B	PRB9
		endif
		if		lstno>0BAH-1
				DC.B	PRBA
		endif
		if		lstno>0BBH-1
				DC.B	PRBB
		endif
		if		lstno>0BCH-1
				DC.B	PRBC
		endif
		if		lstno>0BDH-1
				DC.B	PRBD
		endif
		if		lstno>0BEH-1
				DC.B	PRBE
		endif
		if		lstno>0BFH-1
				DC.B	PRBF
		endif
		if		lstno>0C0H-1
				DC.B	PRC0
		endif
		if		lstno>0C1H-1
				DC.B	PRC1
		endif
		if		lstno>0C2H-1
				DC.B	PRC2
		endif
		if		lstno>0C3H-1
				DC.B	PRC3
		endif
		if		lstno>0C4H-1
				DC.B	PRC4
		endif
		if		lstno>0C5H-1
				DC.B	PRC5
		endif
		if		lstno>0C6H-1
				DC.B	PRC6
		endif
		if		lstno>0C7H-1
				DC.B	PRC7
		endif
		if		lstno>0C8H-1
				DC.B	PRC8
		endif
		if		lstno>0C9H-1
				DC.B	PRC9
		endif
		if		lstno>0CAH-1
				DC.B	PRCA
		endif
		if		lstno>0CBH-1
				DC.B	PRCB
		endif
		if		lstno>0CCH-1
				DC.B	PRCC
		endif
		if		lstno>0CDH-1
				DC.B	PRCD
		endif
		if		lstno>0CEH-1
				DC.B	PRCE
		endif
		if		lstno>0CFH-1
				DC.B	PRCF
		endif
		if		lstno>0D0H-1
				DC.B	PRD0
		endif
		if		lstno>0D1H-1
				DC.B	PRD1
		endif
		if		lstno>0D2H-1
				DC.B	PRD2
		endif
		if		lstno>0D3H-1
				DC.B	PRD3
		endif
		if		lstno>0D4H-1
				DC.B	PRD4
		endif
		if		lstno>0D5H-1
				DC.B	PRD5
		endif
		if		lstno>0D6H-1
				DC.B	PRD6
		endif
		if		lstno>0D7H-1
				DC.B	PRD7
		endif
		if		lstno>0D8H-1
				DC.B	PRD8
		endif
		if		lstno>0D9H-1
				DC.B	PRD9
		endif
		if		lstno>0DAH-1
				DC.B	PRDA
		endif
		if		lstno>0DBH-1
				DC.B	PRDB
		endif
		if		lstno>0DCH-1
				DC.B	PRDC
		endif
		if		lstno>0DDH-1
				DC.B	PRDD
		endif
		if		lstno>0DEH-1
				DC.B	PRDE
		endif
		if		lstno>0DFH-1
				DC.B	PRDF
		endif
		if		lstno>0E0H-1
				DC.B	PRE0
		endif
		if		lstno>0E1H-1
				DC.B	PRE1
		endif
		if		lstno>0E2H-1
				DC.B	PRE2
		endif
		if		lstno>0E3H-1
				DC.B	PRE3
		endif
		if		lstno>0E4H-1
				DC.B	PRE4
		endif
		if		lstno>0E5H-1
				DC.B	PRE5
		endif
		if		lstno>0E6H-1
				DC.B	PRE6
		endif
		if		lstno>0E7H-1
				DC.B	PRE7
		endif
		if		lstno>0E8H-1
				DC.B	PRE8
		endif
		if		lstno>0E9H-1
				DC.B	PRE9
		endif
		if		lstno>0EAH-1
				DC.B	PREA
		endif
		if		lstno>0EBH-1
				DC.B	PREB
		endif
		if		lstno>0ECH-1
				DC.B	PREC
		endif
		if		lstno>0EDH-1
				DC.B	PRED
		endif
		if		lstno>0EEH-1
				DC.B	PREE
		endif
		if		lstno>0EFH-1
				DC.B	PREF
		endif

;=======================================;
;			  END OF FILE				;
;=======================================;

; vim: set ft=asm68k sw=4 ts=4 noet:
