;=======================================================;
;			$$$CMD.ASM	(Sound Command Control)			;
;						ORG. MDCMD11.ASM				;
;				'Sound-Source'							;
;				 for Mega Drive (68K)					;
;						Ver  1.1 / 1990.9.1				;
;									  By  H.Kubota		;
;=======================================================;

;		list off
;		include mdEQ11.lib
;		include mdMCR11.lib
;		list on

;		extern	opn_wrt_chk,z80opn_chk	; $$$CNT.ASM
;		extern	opn_wrt,opn1_wrt_chk	; $$$CNT.ASM
;		extern	key_off,key_off0		; $$$CNT.ASM
;		extern	tl_rr_off,se_song_tb	; $$$CNT.ASM
;		extern	psg_off,psg_off0		; $$$PSG.ASM
;		extern	psg_clear				; $$$PSG.ASM

;=======================================;
;										;
;			   COMMAND SET				;
;										;
;=======================================;
; use resistor
;	  a6 : sound ram top
;	  a5 : channel ram top
;	  a4 : table pointer
;	  d5 : data
;		public	command
command:
		subi.w	#$e0,d5					; $E0 -> $00  $E1 -> $01
		lsl.w	#2,d5					; *4 (bra.w  d5=word o.k.)
		jmp		command_tbl(pc,d5.w)	; table address routine call
command_tbl:
		bra.w	jlrpan					; E0- LRPAN
		bra.w	jfdt					; E1- FDT
		bra.w	jset_tflg				; E2- SET_TFLG
		bra.w	jtrend					; E3- CMTREND
		bra.w	jautopan				; E4- AUTOPAN
		bra.w	jpfvadd					; E5- PFVADD
		bra.w	jvadd					; E6- CMVADD
		bra.w	jtab					; E7- CMTAB
		bra.w	jgate					; E8- CMGATE
		bra.w	jlfo					; E9- LFO
		bra.w	jtempo_chg				; EA- TEMPO_CHG
		bra.w	jkeyset					; EB- KEYSET
		bra.w	jpvadd					; EC- PVADD
		bra.w	jregset					; ED- REGSET
		bra.w	jfmwrite				; EE- FMWRITE
		bra.w	jfenv					; EF- FEV
		bra.w	jfvr					; F0- FVR
		bra.w	jvron					; F1- VRON
		bra.w	jend					; F2- CMEND
		bra.w	jnois					; F3- CMNOIS
		bra.w	jvroff					; F4- VROFF
		bra.w	jev						; F5- EV
		bra.w	jjump					; F6- CMJUMP
		bra.w	jrept					; F7- CMREPT
		bra.w	jcall					; F8- CMCALL
		bra.w	jret					; F9- CMRET
		bra.w	jbase					; FA- CMBASE
		bra.w	jbias					; FB- CMBIAS
		bra.w	jsng_base				; FC- SNG_BASE
		bra.w	jtvr					; FD- TVR
		bra.w	jdt						; FE- DT
excommand:
		moveq	#0,d0					; d0 clear
		move.b	(a4)+,d0				; d0 = next command data
		lsl.w	#2,d0					; *4 (bra.w)
		jmp		excommand_tbl(pc,d0.w)	; table addr rutine call
excommand_tbl:
		bra.w	js_pse					;  0- S_PSE
		bra.w	jssg					;  1- SSG

;=======================================;
;										;
;				LRPAN ($E0)				;
;										;
;=======================================;
;		public	jlrpan
jlrpan:
		move.b	(a4)+,d1				; d1 = table data
		tst.b	chian(a5)				; if channel = PSG
		bmi.s	?end					; then end
		move.b	panstr(a5),d0			; d0 = pan data
		andi.b	#%00110111,d0			; d0 = ams pms bit data
		or.b	d0,d1					; d1 = new pan data
		move.b	d1,panstr(a5)			; pan data store
		move.b	#lr_mod,d0				; lr registor
		bra		opn_wrt_chk
?end:
		rts
;=======================================;
;										;
;				 FDT ($E1)				;
;										;
;=======================================;
;		public	jfdt
jfdt:
		move.b	(a4)+,fdt_freq(a5)		; fdt frequency set
		rts
;=======================================;
;										;
;			   SET_TFLG ($E2)			;
;										;
;=======================================;
;		public	jset_tflg
jset_tflg:
		move.b	(a4)+,t_flg(a6)			; t_flg set
		rts
;=======================================;
;										;
;			   CMTREND ($E3)			;
;										;
;=======================================;
;		public	jtrend
jtrend:
		jsr		tl_rr_off(pc)			; total level & release rate off
		bra		jend					; jump to CMEND
;=======================================;
;										;
;			   AUTOPAN ($E4)			;
;										;
;=======================================;
;		public	jautopan
jautopan:
		move.b	(a4)+,pan_no(a5)		; pan no. set
		beq.s	?off					; if pan no.= 0 then AUTOPAN OFF
		move.b	(a4)+,pan_tb(a5)		; pan table set
		move.b	(a4)+,pan_start(a5)		; pan start no. set
		move.b	(a4)+,pan_limit(a5)		; pan limit set
		move.b	(a4),pan_leng(a5)		; pan length set
		move.b	(a4)+,pan_cont(a5)		; pan control set (=length)
		rts
?off:
;---------------------------------------;
;			   LR RECOVER				;
;---------------------------------------;
		move.b	#lr_mod,d0				; FM registor
		move.b	panstr(a5),d1			; d1 pan data
		bra		opn_wrt_chk
;=======================================;
;										;
;			   PFVADD ($E5)				;
;										;
;=======================================;
;		public	jpfvadd
jpfvadd:
		move.b	(a4)+,d0				; PSG add data
		tst.b	chian(a5)				; if channel = plus
		bpl.s	jvadd					; then FM volm add
		add.b	d0,volm(a5)				; PSG data add
		addq.w	#1,a4					; table pointer adjust
		rts
;=======================================;
;										;
;				CMVADD ($E6)			;
;										;
;=======================================;
;		public	jvadd
jvadd:
		move.b	(a4)+,d0				; d0 = FM add data
		add.b	d0,volm(a5)				; add data store
		bra		vol_set					; volume set
;=======================================;
;										;
;				CMTAB ($E7)				;
;										;
;=======================================;
;		public	jtab
jtab:
		bset.b	#_tie,(a5)				; then set flag
		rts
;=======================================;
;										;
;				CMGATE ($E8)			;
;										;
;=======================================;
;		public	jgate
jgate:
		move.b	(a4),gate(a5)			; gate data store (work area)
		move.b	(a4)+,gate_str(a5)		; gate data store (store area)
		rts
;=======================================;
;										;
;				 LFO ($E9)				;
;										;
;=======================================;
;	   DB	  LFO,036h,027h		 slot,lfo,ams,pms
;		public	jlfo
jlfo:
		;--------- SLOT ---------
		movea.l	sng_voice_addr(a6),a1
		beq.s	jlfo_ss
		movea.l	se_voice_addr(a6),a1
jlfo_ss:
		move.b	(a4),d3					; d3 = slot data
		adda.w	#9,a0					; a0 = DR1 addr
		lea		lfo_reg_tbl(pc),a2
		moveq	#4-1,d6					; loop time
jlfo_loop:
		move.b	(a1)+,d1				; d1 = DR data
		move.b	(a2)+,d0				; d0 = DR reg.
		btst	#7,d3					; if slot bit data = 0 
		beq.s	jlfo_not				; then not write
		bset	#7,d1					; AMON on
		jsr		opn_wrt_chk(pc)			; DR write
jlfo_not:
		lsl		#1,d3
		dbra	d6,jlfo_loop
		;--------- LFO ---------
		move.b	(a4)+,d1				; lfo data get
		moveq	#lfo_fq,d0				; FM reg
		jsr		opn1_wrt_chk(pc)
		;--------- AMS,PMS ---------
		move.b	(a4)+,d1				; d1 = ams,pms data
		move.b	panstr(a5),d0			; d0 = pan data
		and.b	#$c0,d0					; lr data get
		or.b	d0,d1					; d1 = lr,ams,pms data
		move.b	d1,panstr(a5)			; pan data store
		move.b	#lr_mod,d0				; d0 = pan registor
		bra		opn_wrt_chk
lfo_reg_tbl:
		dc.b	DR1,DR2,DR3,DR4
;=======================================;
;										;
;			  TEMPO_CHG ($EA)			;
;										;
;=======================================;
;		public	jtempo_chg
jtempo_chg:
		move.b	(a4),cuntst(a6)			; change data set
		move.b	(a4)+,rcunt(a6)			; change data set
		rts
;=======================================;
;										;
;				KEYSET ($EB)			;
;										;
;=======================================;
;		public	jkeyset
jkeyset:
		move.b	(a4)+,kyflag(a6)		; d0 request no.
		rts
;=======================================;
;										;
;				PVADD ($EC)				;
;										;
;=======================================;
;		public	jpvadd
jpvadd:
		move.b	(a4)+,d0				; add data
		add.b	d0,volm(a5)				; data store
		rts
;=======================================;
;										;
;				REGSET ($ED)			;
;										;
;=======================================;
;		public	jregset
jregset:
		move.b	(a4)+,d0				; registor
		move.b	(a4)+,d1				; change data
		bra		opn_wrt_chk				; parameter change (channel look)
;=======================================;
;										;
;			   FMWRITE ($EE)			;
;										;
;=======================================;
;		public	jfmwrite
jfmwrite:
		move.b	(a4)+,d0				; registor
		move.b	(a4)+,d1				; change data
		bra		opn1_wrt_chk			; parameter change (channel don't look)
;=======================================;
;										;
;				 FEV ($EF)				;
;										;
;=======================================;
; FM parameter write
;  FBC,others,TL,LR-ams-pms
;		public	jfenv,jfenv0
jfenv:
		moveq	#0,d0					; d0 clear
		move.b	(a4)+,d0				; d0 = voice no.
		move.b	d0,enve(a5)				; voice no. store
		btst.b	#_wr,(a5)				; if write protect on then jump
		bne		jfenv_end

		movea.l	sng_voice_addr(a6),a1	; a1 = song voice address
		tst.b	seflag(a6)				; if s.e flag = 0
		beq.s	jfenv0					; then song (jump)
		movea.l	se_voice_addr(a6),a1	; a1 = s.e voice address
		tst.b	seflag(a6)				; if seflag = $80
		bmi.b	jfenv0					; then s.e (jump)
		movea.l	back_voice_addr(a6),a1	; a1 = back s.e voice address
jfenv0:									; from secut or jend
		subq.w	#1,d0					; voice no = 1.....
		bmi.s	?jump1
		move.w	#voice_vol,d1
?loop:
		adda.w	d1,a1
		dbra	d0,?loop
?jump1:									; a0 = FM voice top addr

;---------------------------------------;
;			  FM VOICE SET				;
;---------------------------------------;
;		public	voice_set
voice_set:
		jsr		z80opn_chk(pc)			; z80 bus on
;---------------< algo >----------------;
		move.b	(a1)+,d1				; algo
		move.b	d1,algo(a5)				; algo store
		move.b	d1,d4					; algo store (use volm_set)
		move.b	#FBC,d0					; registor
		jsr		opn_wrt(pc)				; write
;---------------< other >---------------;
		lea		fm_reg_tbl(pc),a2		; registor table address
		moveq	#20-1,d3				; parameter total
?loop:
		move.b	(a2)+,d0				; d0 = registor
		move.b	(a1)+,d1				; d1 = parameter
		jsr		opn_wrt(pc)				; write
		dbra	d3,?loop
;------------< total level >------------;
		moveq	#4-1,d5					; parameter total
		andi.w	#7,d4					; algo
		move.b	vol_flg_tbl(pc,d4.w),d4	; d4 = volm flag data
		move.b	volm(a5),d3				; d3 = volm data
?loop_t:
		move.b	(a2)+,d0				; d0 = registor
		move.b	(a1)+,d1				; d1 = total level data
		lsr.b	#1,d4					; d4 = flag data
		bcc.s	?jump_t					; if cary then set volm
		add.b	d3,d1					; volm add
?jump_t:
		jsr		opn_wrt(pc)				; write
		dbra	d5,?loop_t
;---------------< lrpan >---------------;
		move.b	#lr_mod,d0				; lr ams pms
		move.b	panstr(a5),d1			; parameter
		jsr		opn_wrt(pc)				; write
		z80bus_off
?end:
jfenv_end:
		rts
vol_flg_tbl:							; ｷｬﾘｱ / ﾓｼﾞｭﾚｰﾀ ﾉ ﾃﾞｰﾀ
		dc.b	08H						;
		dc.b	08H						; ｶｸ ﾋﾞｯﾄ ｶﾞ ｷｬﾘｱ/ﾓｼﾞｭﾚｰﾀ ｦ ｱﾗﾜｽ
		dc.b	08H						;
		dc.b	08H						; Bit=1 ｶﾞ ｷｬﾘｱ
		dc.b	0AH						;	   0 ｶﾞ ﾓｼﾞｭﾚｰﾀ
		dc.b	0EH						;
		dc.b	0EH						; Bit0=OP 1 , Bit1=OP 2 ... etc
		dc.b	0FH						;
;---------------------------------------;
;			  FM VOLUME SET				;
;---------------------------------------;
;		public	vol_set
vol_set:
		btst.b	#_wr,(a5)				; if write protect on then jump(s.e use)
		bne.s	?end
		moveq	#0,d0
		move.b	enve(a5),d0				; voice no.
?vol_s:
		movea.l	sng_voice_addr(a6),a1
		tst.b	seflag(a6)
		beq.s	?jump1
		movea.l	se_voice_addr(a6),a1
		tst.b	seflag(a6)				; if seflag = $80
		bmi.b	?jump1					; then not backse
		movea.l	back_voice_addr(a6),a1
?jump1:
		subq.w	#1,d0					; voice no = 1.....
		bmi.s	?vol_s0
		move.w	#voice_vol,d1
?loop_a:
		add.w	d1,a1
		dbra	d0,?loop_a
?vol_s0:								; a0 = FM voice top address
		adda.w	#1+4*5,a1				; total level data address
		lea		tl_reg_tbl(pc),a2		; total level registor address

		move.b	algo(a5),d0				; store to ram (a5 = channel ram top)
		andi.w	#7,d0
		move.b	vol_flg_tbl(pc,d0.w),d4

		move.b	volm(a5),d3				; d3 = volm data
		bmi.b	?end
		moveq	#4-1,d5					; counter
		jsr		z80opn_chk(pc)
?loop_set:
		move.b	(a2)+,d0				; registor
		move.b	(a1)+,d1				; total level data
		lsr.b	#1,d4					; d6 = flag data
		bcc.s	?jump					; if cary then set volm
		add.b	d3,d1					;
		bcs.s	?jump
		jsr		opn_wrt(pc)
?jump:
		dbra	d5,?loop_set
		z80bus_off
?end:
		rts

fm_reg_tbl:
		dc.b	MU1,MU2,MU3,MU4
		dc.b	AR1,AR2,AR3,AR4
		dc.b	DR1,DR2,DR3,DR4
		dc.b	SR1,SR2,SR3,SR4
		dc.b	RR1,RR2,RR3,RR4
tl_reg_tbl:
		dc.b	TL1,TL2,TL3,TL4
		if		0
		dc.b	SSG1,SSG2,SSG3,SSG4
		endif
;=======================================;
;										;
;				 FVR ($F0)				;
;										;
;=======================================;
;		public	jfvr
jfvr:
		bset.b	#_fvr,(a5)				; fvrbit set
		move.l	a4,fvr_str(a5)			; tbpon store fvr_str

		move.b	(a4)+,v_delay(a5)		; delay data
		move.b	(a4)+,v_cont(a5)		; counter data
		move.b	(a4)+,v_add(a5)			; add add data
		move.b	(a4)+,d0				; limit data
		lsr.b	#1,d0					; 
		move.b	d0,v_limit(a5)			; 
		clr.w	v_freq(a5)				; 

		rts
;=======================================;
;										;
;				FVR ON ($F1)			;
;										;
;=======================================;
;		public	jvron
jvron:
		bset.b	#_fvr,(a5)				; fvrbit set
		rts
;=======================================;
;										;
;				CMEND ($F2)				;
;										;
;=======================================;
;		public	jend
jend:
		bclr.b	#_en,(a5)				; enable clear
		bclr.b	#_tie,(a5)				; tie bit clear (for key off)
?jump0:
		tst.b	chian(a5)				; if channel = minus
		bmi.s	?psg					; then PSG
;=================< FM >================;
		tst.b	rythm_flag(a6)			; if rythm_cnt
		bmi		?end					; then jump
		jsr		key_off(pc)				; (look _wr)
		bra.s	?jump2
;================< PSG >================;
?psg:
		jsr		psg_off(pc)				; (look _wr)
?jump2:
;==============< s.e scan >=============;
		tst.b	seflag(a6)				; if seflag = plus then end
		bpl		?end
		clr.b	prfl(a6)				; priority clear
;--------------< s.e only >-------------;
		moveq	#0,d0					; d0 clear
		move.b	chian(a5),d0			; d0 = channel no.
		bmi.s	?psgse					; if channel = minus then PSG
?fmse:
		lea		se_song_tb(pc),a0		; a0 = song channel table
		movea.l	a5,a3					; a5 store
		cmpi.b	#4,d0					; if channel ｷ 4
		bne.s	?jump_se1
		tst.b	back_se_wk(a6)			; if back s.e enable off
		bpl.s	?jump_se1
		lea		back_se_wk(a6),a5		; a5 = back s.e ram
		movea.l	back_voice_addr(a6),a1	; a1 = back s.e voice address
		bra.s	?jump_se2
?jump_se1:
		subq.b	#2,d0
		lsl.b	#2,d0					; 2->$00 , 3->$04 , 4->$08 , 5->$0C
		movea.l	(a0,d0.w),a5			; a5 = enable channel address (song)
		tst.b	(a5)					; if channel don't use
		bpl.s	?jump_se3				; then jump to not set
		movea.l	sng_voice_addr(a6),a1	; a1 = song voice address
?jump_se2:
		bclr.b	#_wr,(a5)				; write protect off
		bset.b	#_nl,(a5)				; null flag set
;----------< song voice set >-----------;
		move.b	enve(a5),d0				; d0 = voice no
		jsr		jfenv0(pc)				; song voice set
?jump_se3:
		movea.l	a3,a5					; a5 restore
;------------< s.e mode scan >----------;
		cmp.b	#2,chian(a5)			; if ch 2 se mode use
		bne.s	?end
		clr.b	se_mode_flg(a6)			; semode flag set
		moveq	#nomal_mode,d1
		moveq	#mode_tim,d0
		jsr		opn1_wrt_chk(pc)
		bra.s	?end
?psgse:
;----------< channel enable >-----------;
		lea		back_se2_wk(a6),a0		; a0 = back s.e2 ram
		tst.b	(a0)					; if back s.e2 enable off
		bpl.s	?jump_se4				; then jump
		cmpi.b	#$e0,d0					; if channel ｷ $e0
		beq.s	?jump_se5				; then jump
		cmpi.b	#$c0,d0					; if channel ｷ $c0
		beq.s	?jump_se5				; then jump
?jump_se4:
		lea		se_song_tb(pc),a0		; a0 = song channel table
		lsr.b	#3,d0					; $80->$10 , $A0->$14 , $C0->$18
		movea.l	(a0,d0.w),a0			; a0 = enable channel address (song)
?jump_se5:
		bclr.b	#_wr,(a0)				; write protect bit off
		bset.b	#_nl,(a0)				; null flag set
		cmpi.b	#$e0,chian(a0)			; if channel ｷ $e0 (noise mode)
		bne.s	?jump_se6				; then jump
		move.b	ntype(a0),psg68k		; noise mode write
?jump_se6:
?end:
		addq.w	#8,sp					; 3 return
		rts

;=======================================;
;										;
;				CMNOIS ($F3)			;
;										;
;=======================================;
;		public	jnois
jnois:
		move.b	#$e0,chian(a5)			; noise mode = E0h
		move.b	(a4)+,ntype(a5)			; set
		btst.b	#_wr,(a5)				; if write protect on
		bne.s	?end					; then end
		move.b	-1(a4),psg68k			; set
?end:
		rts
;=======================================;
;										;
;				FVR OFF ($F4)			;
;										;
;=======================================;
;		public	jvroff
jvroff:
		bclr.b	#_fvr,(a5)				; fvrbit set
		rts
;=======================================;
;										;
;				 EV ($F5)				;
;										;
;=======================================;
;		public	jev
jev:
		move.b	(a4)+,enve(a5)			; set
		rts
;=======================================;
;										;
;				CMJUMP ($F6)			;
;										;
;=======================================;
;		public	jjump
jjump:
		move.b	(a4)+,d0				; high addr get
		lsl.w	#8,d0					; high addr -> d0 high 8 bit
		move.b	(a4)+,d0				; low addr get
		adda.w	d0,a4					; add tbpon
		subq.w	#1,a4					; adjust
		rts
;=======================================;
;										;
;				CMREPT ($F7)			;
;										;
;=======================================;
;		public	jrept
jrept:
		moveq	#0,d0
		move.b	(a4)+,d0				; rept-reg no get
		move.b	(a4)+,d1				; rept counter data get
		tst.b	reptr(a5,d0.w)
		bne.s	?jump					; then jump
		move.b	d1,reptr(a5,d0.w)		; set rept counter
?jump:
		subq.b	#1,reptr(a5,d0.w)		; d0 = repeat reg no.
		bne.s	jjump					; CMJUMP
		addq.w	#2,a4					; table pointer adjust
		rts
;=======================================;
;										;
;				CMCALL ($F8)			;
;										;
;=======================================;
;		public	jcall
jcall:
		moveq	#0,d0
		move.b	stac(a5),d0				; d0 = stac
		subq.b	#4,d0					; stac -4
		move.l	a4,(a5,d0.w)			; table address store
		move.b	d0,stac(a5)				; stac store
		bra.s	jjump					; CMJUMP
;=======================================;
;										;
;				CMRET ($F9)				;
;										;
;=======================================;
;		public	jret
jret:
		moveq	#0,d0
		move.b	stac(a5),d0
		movea.l	(a5,d0.w),a4			; a4 = table pointer
		addq.w	#2,a4					; db cmjump /dw addr read out
		addq.b	#4,d0
		move.b	d0,stac(a5)
		rts
;=======================================;
;										;
;				CMBASE ($FA)			;
;										;
;=======================================;
;		public	jbase
jbase:
		move.b	(a4)+,cbase(a5)
		rts
;=======================================;
;										;
;				CMBIAS ($FB)			;
;										;
;=======================================;
;		public	jbias
jbias:
		move.b	(a4)+,d0
		add.b	d0,bias(a5)
		rts
;=======================================;
;										;
;			   SNG_BASE ($FC)			;
;										;
;=======================================;
;		public	jsng_base
jsng_base:
		lea		wk_top(a6),a0
		move.b	(a4)+,d0
		moveq	#flgvol,d1
		moveq	#song_no-1,d2			; d2 = channel no.
?loop:
		move.b	d0,cbase(a0)
		adda.w	d1,a0
		dbra	d2,?loop
		rts
;=======================================;
;										;
;				TVR ($FD)				;
;										;
;=======================================;
;		public	jtvr
jtvr:
		movea.l	sound_top+hd_tvrtb*4,a0 ; a0 = tvrtb top address
		moveq	#0,d0					; d0 clear
		move.b	(a4)+,d0				; tvr no.
		subi.b	#1,d0					; adjust
		lsl.w	#2,d0					; no.*4
		adda.w	d0,a0					; tvr address

		bset.b	#_fvr,(a5)				; fvrbit set
		move.l	a0,fvr_str(a5)			; fvr address store fvr_str

		move.b	(a0)+,v_delay(a5)		; delay data
		move.b	(a0)+,v_cont(a5)		; counter data
		move.b	(a0)+,v_add(a5)			; add add data
		move.b	(a0)+,d0				; limit data
		lsr.b	#1,d0					; 
		move.b	d0,v_limit(a5)			; 
		clr.w	v_freq(a5)				; 

		rts
;=======================================;
;										;
;				 DT ($FE)				;
;										;
;=======================================;
;		public	jdt
jdt:
		lea		dt1(a6),a0
		moveq	#8-1,d0
?loop:
		move.b	(a4)+,(a0)+
		dbra	d0,?loop

		move.b	#$80,se_mode_flg(a6)
		move.b	#mode_tim,d0
		moveq	#se_mode,d1
		bra		opn1_wrt_chk
;=======================================;
;										;
;			 S_PSE (EXCOM,0)			;
;										;
;=======================================;
;		public	js_pse
js_pse:
		moveq	#flgvol,d3				; constant add data
		move.b	(a4)+,d0
		beq.s	js_pse_off
;=======================================;
;			 SONG PAUSE ON				;
;=======================================;
js_pse_on:
		movea.l	a5,a3					; a5 store
;===============< rythm >===============;
		lea		wk_top(a6),a5			; channel ram top
		btst.b	#_en,(a5)				; if enable off
		beq.s	?fm						; then jump
		bclr.b	#_en,(a5)				; enable flag off
		bset.b	#_pse,(a5)				; song pause flag on
;=================< FM >================;
?fm:
		moveq	#fm_no-1,d4				; FM total
?fm_loop:
		adda.w	d3,a5
		btst.b	#_en,(a5)				; if enable off
		beq.s	?fm_next				; then jump
;--------------< flag set >-------------;
		bclr.b	#_en,(a5)				; enable flag off
		bset.b	#_pse,(a5)				; song pause flag on
;---------------< LR off >--------------;
		move.b	#lr_mod,d0				; LR registor
		moveq	#0,d1					; LR off data = 0
		jsr		opn_wrt_chk(pc)			; LR off write (look _wr)
;--------------< key off >--------------;
		jsr		key_off(pc)
?fm_next:
		dbra	d4,?fm_loop

;================< PSG >================;
		moveq	#psg_no-1,d4			; FM total
?psg_loop:
		adda.w	d3,a5
		btst.b	#_en,(a5)				; if enable off
		beq.s	?psg_next				; then jump
;--------------< flag set >-------------;
		bclr.b	#_en,(a5)				; enable flag off
		bset.b	#_pse,(a5)				; song pause flag on
;--------------< PSG off >--------------;
		jsr		psg_off(pc)
?psg_next:
		dbra	d4,?psg_loop

		movea.l	a3,a5					; a5 restore
		rts

;=======================================;
;			 SONG PAUSE OFF				;
;=======================================;
js_pse_off:
		movea.l	a5,a3					; a5 store
;===============< rythm >===============;
		lea		wk_top(a6),a5			; channel ram top
		btst.b	#_pse,(a5)				; if song pause flag off
		beq.s	?fm						; then jump
		bset.b	#_en,(a5)				; enable flag off
		bclr.b	#_pse,(a5)				; song pause flag on
;=================< FM >================;
?fm:
		moveq	#fm_no-1,d4				; FM total
?fm_loop:
		adda.w	d3,a5
		btst.b	#_pse,(a5)				; if song pause flag off
		beq.s	?fm_next				; then jump
;--------------< flag set >-------------;
		bset.b	#_en,(a5)				; enable flag off
		bclr.b	#_pse,(a5)				; song pause flag on
;-------------< LR recover >------------;
		move.b	#lr_mod,d0				; LR registor
		move.b	panstr(a5),d1			; d1 = pan data
		jsr		opn_wrt_chk(pc)			; LR write (look _wr)
?fm_next:
		dbra	d4,?fm_loop

;================< PSG >================;
		moveq	#psg_no-1,d4			; FM total
?psg_loop:
		adda.w	d3,a5
		btst.b	#_pse,(a5)				; if song pause flag off
		beq.s	?psg_next				; then jump
;--------------< flag set >-------------;
		bset.b	#_en,(a5)				; enable flag off
		bclr.b	#_pse,(a5)				; song pause flag on
?psg_next:
		dbra	d4,?psg_loop
		movea.l	a3,a5					; a5 restore
		rts

;=======================================;
;										;
;			  SSG (EXCOM,1)				;
;										;
;=======================================;
;		public	jssg
jssg:
		lea		ssg_reg_tbl(pc),a1
		moveq	#4-1,d3
?loop:
		move.b	(a1)+,d0				; reg
		move.b	(a4)+,d1				; data
		bset	#3,d1					; ssg bit
		jsr		opn_wrt_chk(pc)
		move.b	(a1)+,d0
		moveq	#$1f,d1					; AR = 1fh
		jsr		opn_wrt_chk(pc)
		dbra	d3,?loop
		rts
ssg_reg_tbl:
		dc.b	SSG1,AR1,SSG2,AR2,SSG3,AR3,SSG4,AR4

; vim: set ft=asm68k sw=4 ts=4 noet:
