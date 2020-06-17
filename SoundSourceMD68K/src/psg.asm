;=======================================================;
;			$$$PSG.ASM  (Sound PSG Control)				;
;						ORG. MDPSG11.ASM				;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		list off
;		include mdEQ11.lib
;		include mdMCR11.lib
;		list on

;		extern	flag_set,leng_set		; $$$CNT.ASM
;		extern	gate_chk,vibr_chk		; $$$CNT.ASM
;		extern	command					; $$$CMD.ASM

;=======================================;
;										;
;			   PSG CONTROL				;
;										;
;=======================================;
;		public	psg_cnt
psg_cnt:
		subq.b	#1,lcont(a5)			; if length = 0 then jump
		bne.s	psg_cnt1
;------< data get & frequency set >-----;
		bclr.b	#_tie,(a5)
		jsr		psg_nextd(pc)			; table data get
		jsr		psg_frq_set0(pc)
		bra		enve_set
psg_cnt1:
		jsr		gate_chk(pc)
		jsr		enve_chk(pc)
		jsr		vibr_chk(pc)			; out d6 = frequency
		jsr		psg_frq_set(pc)
		rts
;---------------------------------------;
;			PSG NEXT DATA SCAN			;
;---------------------------------------;
;		public	psg_nextd
psg_nextd:
		bclr.b	#_nl,(a5)				; null flag clear
;---------< table pointer get >---------;
		movea.l	tbpon(a5),a4
;-----------< table data get >----------;
psg_cmd_chk:
		moveq	#0,d5					; d5 clear
		move.b	(a4)+,d5				; d5 = table data
		cmpi.b	#$e0,d5					; if data < $E0
		bcs.s	psg_d					; then jump
		jsr		command(pc)				; if data >= $E0 then command
		bra.s	psg_cmd_chk

psg_d:
		tst.b	d5						; if data < $80
		bpl.s	psg_leng				; then length set
		jsr		psg_frq(pc)				; if data >= $80 then freq set
		move.b	(a4)+,d5				; next data
		tst.b	d5						; if data < $80
		bpl.s	psg_leng				; then length set
		subq.w	#1,a4					; table pointer adjust
		bra		flag_set

psg_leng:
		jsr		leng_set(pc)
		bra		flag_set

;---------------------------------------;
;		   PSG FREQUENCY GET			;
;---------------------------------------;
;  in d5 : data
;     a4 : table pointer
;     a5 : channel RAM top address
psg_frq:
		sub.b	#$81,d5					;
		bcs.s	psg_null				; if d5 < $81 then null
		add.b	bias(a5),d5				; bias data add
		andi.w	#$007f,d5
		lsl.w	#1,d5					; *2 (dw)
		lea		psg_scale(pc),a0		; a0 = scale address
		move.w	(a0,d5.w),freqb(a5)
		bra		flag_set

;---------------------------------------;
;			  PSG NULL SET				;
;---------------------------------------;
;		public	psg_null
psg_null:
		bset.b	#_nl,(a5)				; null flag set
		move.w	#$ffff,freqb(a5)		; freq null set
		jsr		flag_set(pc)
		bra		psg_off
;=======================================;
;										;
;			PSG FREQUENCY SET			;
;										;
;=======================================;
;  in d6 : frequency
psg_frq_set0:							; from nextd
		move.w	freqb(a5),d6			; d6 = freq data
		bmi.s	psg_null_set
psg_frq_set:							; from vibr_chk
		move.b	fdt_freq(a5),d0
		ext.w	d0
		add.w	d0,d6					; fdt set
		btst.b	#_wr,(a5)				; if write protect on 
		bne.s	pvibrs_end				; then end
		btst.b	#_nl,(a5)				; if null flag on 
		bne.s	pvibrs_end
		move.b	chian(a5),d0			; d0 = high 4 bit (PSG channel)
		cmpi.b	#$e0,d0
		bne.s	?jump
		move.b	#$c0,d0
?jump:
		move.w	d6,d1
		andi.b	#$0f,d1					; d1 = low 4 bit
		or.b	d1,d0					; in d0 = channel
		lsr.w	#4,d6
		andi.b	#$3f,d6
;--------< PSG frequency write >--------;
		move.b	d0,psg68k
		move.b	d6,psg68k
pvibrs_end:
		rts
psg_null_set:
		bset.b	#_nl,(a5)				; if null flag = on
		rts
;=======================================;
;										;
;			PSG ENVELOPE SET			;
;										;
;=======================================;
;		public	enve_chk,enve_set
enve_chk:
		tst.b	enve(a5)				; if enve = 0
		beq		enve_end				; then end
enve_set:
;---------< envelope no.scan >----------;
		move.b	volm(a5),d6				; d6 = volm data
		moveq	#0,d0
		move.b	enve(a5),d0				; d0 = enve no.
		beq.s	psg_att_set
;-------< envelope address make >-------;
		movea.l	sound_top+hd_envetb*4,a0 ; a0 = setb address
		subq.w	#1,d0
		lsl.w	#2,d0					; long word table
		movea.l	(a0,d0.w),a0			; a0 = enve address
		move.b	econt(a5),d0			; d0 = enve counter
		move.b	(a0,d0.w),d0			; d0 = enve table data
		addq.b	#1,econt(a5)			; enve counter +1
;------------< command scan >-----------;
		btst	#7,d0					; if data < $80
		beq.s	?jump1					; then jump (not command)
		cmpi.b	#TBEND,d0
		beq.s	etbend
		cmpi.b	#TBBAK,d0
		beq.s	etbbak
		cmpi.b	#TBREPT,d0
		beq.s	etbrept
;--------< envelope data make >---------;
?jump1:
		add.w	d0,d6					; d6 = new enve data
		cmpi.b	#$10,d6					; if data < $10
		bcs.s	?jump2					; then jump
		moveq	#$f,d6					; if data >= $10 then enve = $f
?jump2:
;=======================================;
;			PSG attenation set			;
;=======================================;
;  in d6 : volm data
;		public	psg_att_set
psg_att_set:
		btst.b	#_nl,(a5)				; if null flag on
		bne.s	enve_end				; then end
		btst.b	#_wr,(a5)				; if write protect on
		bne.s	enve_end				; then end
		btst.b	#_tie,(a5)				; if tie flag on
		bne.s	penves_tie				; then jump
psg_att_wrt:
		or.b	chian(a5),d6
		add.b	#$10,d6
		move.b	d6,psg68k				; PSG write
enve_end:
		rts
penves_tie:
		tst.b	gate_str(a5)			; if gate store = 0
		beq.s	psg_att_wrt				; then att set
		tst.b	gate(a5)				; if gate work · 0
		bne.s	psg_att_wrt				; then att set
		rts


;===============< TBEND >===============;
etbend:
		subq.b	#1,econt(a5)			; enve counter -1
		rts
;===============< TBBAK >===============;
etbbak:
		move.b	1(a0,d0.w),econt(a5)	; next enve table data set
		bra		enve_set				; enve set
;===============< TBREPT >==============;
etbrept:
		clr.b	econt(a5)				; enve counter clear
		bra		enve_set				; enve set

;=======================================;
;										;
;				PSG OFF					;
;										;
;=======================================;
;		public	psg_off,psg_off0
psg_off:
		btst.b	#_wr,(a5)				; if write protect on
		bne.s	psg_off_end				; then end
psg_off0:
		move.b	chian(a5),d0			; d0 = channel data
		ori.b	#$1f,d0					; d0 = PSG off data
		move.b	d0,psg68k				; data set
psg_off_end:
		rts

;=======================================;
;										;
;			  PSG ALL CLEAR				;
;										;
;=======================================;
;		public	psg_clear
psg_clear:
		lea		psg68k,a0
		move.b	#$9f,(a0)
		move.b	#$bf,(a0)
		move.b	#$df,(a0)
		move.b	#$ff,(a0)
		rts
;=======================================;
;										;
;				PSG SCALE				;
;										;
;=======================================;
;		public	psg_scale
psg_scale:
;		dc.w	1015,958,904
		dc.w	854,806,761,718,677,640
		dc.w	604,570,538,507,479,452
		dc.w	427,403,381,359,339,320
		dc.w	302,285,269,254,239,226
		dc.w	214,201,190,180,169,160
		dc.w	151,143,135,127,120,113
		dc.w	107,101,095,090,085,080
		dc.w	075,071,067,064,060,057
		dc.w	054,051,048,045,043,040
		dc.w	038,036,034,032,031,029
		dc.w	027,026,024,023,022,021
		dc.w	019,018,017,000			; 0 = nois hihat

;=======================================;
;			  END OF FILE				;
;=======================================;

; vim: set ft=asm68k sw=4 ts=4 noet:
