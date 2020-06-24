;=======================================================;
;			*$$SETB.ASM  (Sound S.E. Address Table)		;
;						ORG. MDSETB11.ASM				;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		public	setb,backtb

;		extern	SA0,SA1,SA2,SA3,SA4,SA5,SA6,SA7,SA8
;		extern	SA9,SAA,SAB,SAC,SAD,SAE,SAF
;		extern	SD0,SD1,SD2,SD3

;		include mdEQ11.lib

;		ifz		prg
;		org		se_top
;		endif

		even

;=======================================;
;										;
;			S.E. ADDRESS TABLE			;
;										;
;=======================================;
setb:
		if		seend>0A0H-1
				DC.L	SA0
		endif
		if		seend>0A1H-1
				DC.L	SA1
		endif
		if		seend>0A2H-1
				DC.L	SA2
		endif
		if		seend>0A3H-1
				DC.L	SA3
		endif
		if		seend>0A4H-1
				DC.L	SA4
		endif
		if		seend>0A5H-1
				DC.L	SA5
		endif
		if		seend>0A6H-1
				DC.L	SA6
		endif
		if		seend>0A7H-1
				DC.L	SA7
		endif
		if		seend>0A8H-1
				DC.L	SA8
		endif
		if		seend>0A9H-1
				DC.L	SA9
		endif
		if		seend>0AAH-1
				DC.L	SAA
		endif
		if		seend>0ABH-1
				DC.L	SAB
		endif
		if		seend>0ACH-1
				DC.L	SAC
		endif
		if		seend>0ADH-1
				DC.L	SAD
		endif
		if		seend>0AEH-1
				DC.L	SAE
		endif
		if		seend>0AFH-1
				DC.L	SAF
		endif
		if		seend>0B0H-1
				DC.L	SB0
		endif
		if		seend>0B1H-1
				DC.L	SB1
		endif
		if		seend>0B2H-1
				DC.L	SB2
		endif
		if		seend>0B3H-1
				DC.L	SB3
		endif
		if		seend>0B4H-1
				DC.L	SB4
		endif
		if		seend>0B5H-1
				DC.L	SB5
		endif
		if		seend>0B6H-1
				DC.L	SB6
		endif
		if		seend>0B7H-1
				DC.L	SB7
		endif
		if		seend>0B8H-1
				DC.L	SB8
		endif
		if		seend>0B9H-1
				DC.L	SB9
		endif
		if		seend>0BAH-1
				DC.L	SBA
		endif
		if		seend>0BBH-1
				DC.L	SBB
		endif
		if		seend>0BCH-1
				DC.L	SBC
		endif
		if		seend>0BDH-1
				DC.L	SBD
		endif
		if		seend>0BEH-1
				DC.L	SBE
		endif
		if		seend>0BFH-1
				DC.L	SBF
		endif
		if		seend>0C0H-1
				DC.L	SC0
		endif
		if		seend>0C1H-1
				DC.L	SC1
		endif
		if		seend>0C2H-1
				DC.L	SC2
		endif
		if		seend>0C3H-1
				DC.L	SC3
		endif
		if		seend>0C4H-1
				DC.L	SC4
		endif
		if		seend>0C5H-1
				DC.L	SC5
		endif
		if		seend>0C6H-1
				DC.L	SC6
		endif
		if		seend>0C7H-1
				DC.L	SC7
		endif
		if		seend>0C8H-1
				DC.L	SC8
		endif
		if		seend>0C9H-1
				DC.L	SC9
		endif
		if		seend>0CAH-1
				DC.L	SCA
		endif
		if		seend>0CBH-1
				DC.L	SCB
		endif
		if		seend>0CCH-1
				DC.L	SCC
		endif
		if		seend>0CDH-1
				DC.L	SCD
		endif
		if		seend>0CEH-1
				DC.L	SCE
		endif
		if		seend>0CFH-1
				DC.L	SCF
		endif

backtb:
				DC.L	SD0
				DC.L	SD1
				DC.L	SD2
				DC.L	SD3

; vim: set ft=asm68k sw=4 ts=4 noet:
