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
				DC.L	(SA0-adrtb)+rambase
		endif
		if		seend>0A1H-1
				DC.L	(SA1-adrtb)+rambase
		endif
		if		seend>0A2H-1
				DC.L	(SA2-adrtb)+rambase
		endif
		if		seend>0A3H-1
				DC.L	(SA3-adrtb)+rambase
		endif
		if		seend>0A4H-1
				DC.L	(SA4-adrtb)+rambase
		endif
		if		seend>0A5H-1
				DC.L	(SA5-adrtb)+rambase
		endif
		if		seend>0A6H-1
				DC.L	(SA6-adrtb)+rambase
		endif
		if		seend>0A7H-1
				DC.L	(SA7-adrtb)+rambase
		endif
		if		seend>0A8H-1
				DC.L	(SA8-adrtb)+rambase
		endif
		if		seend>0A9H-1
				DC.L	(SA9-adrtb)+rambase
		endif
		if		seend>0AAH-1
				DC.L	(SAA-adrtb)+rambase
		endif
		if		seend>0ABH-1
				DC.L	(SAB-adrtb)+rambase
		endif
		if		seend>0ACH-1
				DC.L	(SAC-adrtb)+rambase
		endif
		if		seend>0ADH-1
				DC.L	(SAD-adrtb)+rambase
		endif
		if		seend>0AEH-1
				DC.L	(SAE-adrtb)+rambase
		endif
		if		seend>0AFH-1
				DC.L	(SAF-adrtb)+rambase
		endif
		if		seend>0B0H-1
				DC.L	(SB0-adrtb)+rambase
		endif
		if		seend>0B1H-1
				DC.L	(SB1-adrtb)+rambase
		endif
		if		seend>0B2H-1
				DC.L	(SB2-adrtb)+rambase
		endif
		if		seend>0B3H-1
				DC.L	(SB3-adrtb)+rambase
		endif
		if		seend>0B4H-1
				DC.L	(SB4-adrtb)+rambase
		endif
		if		seend>0B5H-1
				DC.L	(SB5-adrtb)+rambase
		endif
		if		seend>0B6H-1
				DC.L	(SB6-adrtb)+rambase
		endif
		if		seend>0B7H-1
				DC.L	(SB7-adrtb)+rambase
		endif
		if		seend>0B8H-1
				DC.L	(SB8-adrtb)+rambase
		endif
		if		seend>0B9H-1
				DC.L	(SB9-adrtb)+rambase
		endif
		if		seend>0BAH-1
				DC.L	(SBA-adrtb)+rambase
		endif
		if		seend>0BBH-1
				DC.L	(SBB-adrtb)+rambase
		endif
		if		seend>0BCH-1
				DC.L	(SBC-adrtb)+rambase
		endif
		if		seend>0BDH-1
				DC.L	(SBD-adrtb)+rambase
		endif
		if		seend>0BEH-1
				DC.L	(SBE-adrtb)+rambase
		endif
		if		seend>0BFH-1
				DC.L	(SBF-adrtb)+rambase
		endif
		if		seend>0C0H-1
				DC.L	(SC0-adrtb)+rambase
		endif
		if		seend>0C1H-1
				DC.L	(SC1-adrtb)+rambase
		endif
		if		seend>0C2H-1
				DC.L	(SC2-adrtb)+rambase
		endif
		if		seend>0C3H-1
				DC.L	(SC3-adrtb)+rambase
		endif
		if		seend>0C4H-1
				DC.L	(SC4-adrtb)+rambase
		endif
		if		seend>0C5H-1
				DC.L	(SC5-adrtb)+rambase
		endif
		if		seend>0C6H-1
				DC.L	(SC6-adrtb)+rambase
		endif
		if		seend>0C7H-1
				DC.L	(SC7-adrtb)+rambase
		endif
		if		seend>0C8H-1
				DC.L	(SC8-adrtb)+rambase
		endif
		if		seend>0C9H-1
				DC.L	(SC9-adrtb)+rambase
		endif
		if		seend>0CAH-1
				DC.L	(SCA-adrtb)+rambase
		endif
		if		seend>0CBH-1
				DC.L	(SCB-adrtb)+rambase
		endif
		if		seend>0CCH-1
				DC.L	(SCC-adrtb)+rambase
		endif
		if		seend>0CDH-1
				DC.L	(SCD-adrtb)+rambase
		endif
		if		seend>0CEH-1
				DC.L	(SCE-adrtb)+rambase
		endif
		if		seend>0CFH-1
				DC.L	(SCF-adrtb)+rambase
		endif

backtb:
				DC.L	(SD0-adrtb)+rambase
				DC.L	(SD1-adrtb)+rambase
				DC.L	(SD2-adrtb)+rambase
				DC.L	(SD3-adrtb)+rambase

; vim: set ft=asm68k sw=4 ts=4 noet:
