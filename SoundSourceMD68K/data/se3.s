;=======================================================;
;			*$$SE3.S  (S.E. Data)						;
;						ORG. MDSE113.S					;
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


;		PUBLIC	SC0,SC1,SC2,SC3,SC4,SC5,SC6,SC7
;		PUBLIC	SC8,SC9,SCA,SCB,SCC,SCD,SCE,SCF

		even

;=======================================;
;				   SC0					;
;=======================================;
SC0:
		TDW		TIMBC0,SC0				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC00,SC0				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC00	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC0	EQU		*

		even

;=======================================;
;				   SC1					;
;=======================================;
SC1:
		TDW		TIMBC1,SC1				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC10,SC1				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC10	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC1	EQU		*

		even

;=======================================;
;				   SC2					;
;=======================================;
SC2:
		TDW		TIMBC2,SC2				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC20,SC2				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC20	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC2	EQU		*

		even

;=======================================;
;				   SC3					;
;=======================================;
SC3:
		TDW		TIMBC3,SC3				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC30,SC3				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC30	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC3	EQU		*

		even

;=======================================;
;				   SC4					;
;=======================================;
SC4:
		TDW		TIMBC4,SC4				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC40,SC4				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC40	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC4	EQU		*

		even

;=======================================;
;				   SC5					;
;=======================================;
SC5:
		TDW		TIMBC5,SC5				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC50,SC5				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC50	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC5	EQU		*

		even

;=======================================;
;				   SC6					;
;=======================================;
SC6:
		TDW		TIMBC6,SC6				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC60,SC6				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC60	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC6	EQU		*

		even

;=======================================;
;				   SC7					;
;=======================================;
SC7:
		TDW		TIMBC7,SC7				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC70,SC7				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC70	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC7	EQU		*

		even

;=======================================;
;				   SC8					;
;=======================================;
SC8:
		TDW		TIMBC8,SC8				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC80,SC8				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC80	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC8	EQU		*

		even

;=======================================;
;				   SC9					;
;=======================================;
SC9:
		TDW		TIMBC9,SC9				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABC90,SC9				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABC90	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBC9	EQU		*

		even

;=======================================;
;				   SCA					;
;=======================================;
SCA:
		TDW		TIMBCA,SCA				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCA0,SCA				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCA0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCA	EQU		*

		even

;=======================================;
;				   SCB					;
;=======================================;
SCB:
		TDW		TIMBCB,SCB				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCB0,SCB				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCB0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCB	EQU		*

		even

;=======================================;
;				   SCC					;
;=======================================;
SCC:
		TDW		TIMBCC,SCC				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCC0,SCC				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCC0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCC	EQU		*

		even

;=======================================;
;				   SCD					;
;=======================================;
SCD:
		TDW		TIMBCD,SCD				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCD0,SCD				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCD0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCD	EQU		*

		even

;=======================================;
;				   SCE					;
;=======================================;
SCE:
		TDW		TIMBCE,SCE				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCE0,SCE				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCE0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCE	EQU		*

		even

;=======================================;
;				   SCF					;
;=======================================;
SCF:
		TDW		TIMBCF,SCF				; Voice Top Address
		DC.B	1,1						; Base,Use Channel Total

		DC.B	80H,5					; Flag,Channel
		TDW		TABCF0,SCF				; FM 1ch Table Pointer
		DC.B	00H,000H				; Bias,Volm
;------------< Table Data >-------------;
TABCF0	EQU		*
		DC.B	CMEND

;------------< Voice Data >-------------;
TIMBCF	EQU		*

; vim: set ft=asm68k sw=4 ts=4 noet:
