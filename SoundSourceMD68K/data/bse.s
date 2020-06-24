;=======================================================;
;			*$$BSE.S  (Back S.E. Data)					;
;						ORG. MDBSE11.S					;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;


;		list off
;		include mdEQ11.LIB
;		include mdMCR11.LIB
;		include mdTB11.LIB
;		list on

;		public	SD0,SD1,SD2,SD3

		even

;=======================================;
;				   SD0					;
;=======================================;
SD0:
		TDW		TIMBD0,SD0				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,4					; Flag,Channel
		TDW		TABD00,SD0				; FM 1ch Table Pointer
		DC.B	00H,00AH				; Bias,Volm

;------------< Table Data >-------------;
TABD00	EQU		*
		DC.B	FEV,0
		DC.B	0D0H,05H
		DC.B	NL,1
TD00	EQU		*
		DC.B	TIE,0D0H,10
		DC.B	CMJUMP
		JDW		TD00

;------------< Voice Data >-------------;
TIMBD0	EQU		*
		CNF		0,7
		MD		15,0,15,0,15,0,15,0
		RSAR	0,31,0,31,0,31,0,12H
		D1R		0,0,0,0
		D2R		0,0,0,0
		RRL		15,0,15,0,15,0,15,1
		TL		0,0,0,0

		even

;=======================================;
;				   SD1					;
;=======================================;
SD1:
		TDW		TIMBD1,SD1				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,0C0H				; Flag,Channel
		TDW		TABD10,SD1				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm

;------------< Table Data >-------------;
TABD10	EQU		*
		DC.B	CMNOIS,NOIS5
TD10	EQU		*
		DC.B	DN4,L2,NL,CN4,NL
		DC.B	CMJUMP
		JDW		TD10

;------------< Voice Data >-------------;
TIMBD1	EQU		*
		CNF		0,7
		MD		15,0,15,0,15,0,15,0
		RSAR	0,31,0,31,0,31,0,14
		D1R		0,0,0,0
		D2R		0,0,0,0
		RRL		15,0,15,0,15,0,15,1
		TL		0,0,0,0

		even

;=======================================;
;				   SD2					;
;=======================================;
SD2:
		TDW		TIMBD2,SD2				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,4					; Flag,Channel
		TDW		TABD20,SD2				; FM 1ch Table Pointer
		DC.B	00H,014H				; Bias,Volm

;------------< Table Data >-------------;
TABD20	EQU		*
		DC.B	FEV,0
TD20	EQU		*
		DC.B	085h,14,087H,15
		DC.B	CMJUMP
		JDW		TD20
		
;------------< Voice Data >-------------;
TIMBD2	EQU		*
		CNF		1,4
		MD		3,7,9,5,0,6,1,4
		RSAR	0,31,0,21,0,31,0,20
		D1R		5,20,3,2
		D2R		15,15,15,15
		RRL		15,1,15,2,15,4,15,1
		TL		016H,012H,013H,0

		even

;=======================================;
;				   SD3					;
;=======================================;
SD3:
		TDW		TIMBD3,SD3				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,0C0H				; Flag,Channel
		TDW		TABD30,SD3				; FM 1ch Table Pointer
		DC.B	00H,001H				; Bias,Volm

;------------< Table Data >-------------;
TABD30	EQU		*
		DC.B	CMNOIS,NOIS7
		DC.B	FVR,1,1,3,8
TD30	EQU		*
		DC.B	0A7H,1,CMBIAS,1,CMREPT,0,1AH
		JDW		TD30
TD31	EQU		*
		DC.B	20
		DC.B	CMJUMP
		JDW		TD31
		DC.B	CMEND
;------------< Voice Data >-------------;
TIMBD3	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
