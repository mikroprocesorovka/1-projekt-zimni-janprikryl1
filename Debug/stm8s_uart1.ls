   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  43                     ; 53 void UART1_DeInit(void)
  43                     ; 54 {
  45                     	switch	.text
  46  0000               _UART1_DeInit:
  50                     ; 57   (void)UART1->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 58   (void)UART1->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  76  001e 725f5238      	clr	21048
  77                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  79  0022 725f5239      	clr	21049
  80                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  82  0026 725f523a      	clr	21050
  83                     ; 71 }
  86  002a 81            	ret
 390                     .const:	section	.text
 391  0000               L21:
 392  0000 00098969      	dc.l	625001
 393  0004               L25:
 394  0004 00000064      	dc.l	100
 395                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 395                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 395                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 395                     ; 93 {
 396                     	switch	.text
 397  002b               _UART1_Init:
 399  002b 520c          	subw	sp,#12
 400       0000000c      OFST:	set	12
 403                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 407                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 409  002d 96            	ldw	x,sp
 410  002e 1c000f        	addw	x,#OFST+3
 411  0031 cd0000        	call	c_ltor
 413  0034 ae0000        	ldw	x,#L21
 414  0037 cd0000        	call	c_lcmp
 416  003a 2403          	jruge	L01
 417  003c 4f            	clr	a
 418  003d 2010          	jra	L41
 419  003f               L01:
 420  003f ae0061        	ldw	x,#97
 421  0042 89            	pushw	x
 422  0043 ae0000        	ldw	x,#0
 423  0046 89            	pushw	x
 424  0047 ae0008        	ldw	x,#L371
 425  004a cd0000        	call	_assert_failed
 427  004d 5b04          	addw	sp,#4
 428  004f               L41:
 429                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 431  004f 0d13          	tnz	(OFST+7,sp)
 432  0051 2706          	jreq	L02
 433  0053 7b13          	ld	a,(OFST+7,sp)
 434  0055 a110          	cp	a,#16
 435  0057 2603          	jrne	L61
 436  0059               L02:
 437  0059 4f            	clr	a
 438  005a 2010          	jra	L22
 439  005c               L61:
 440  005c ae0062        	ldw	x,#98
 441  005f 89            	pushw	x
 442  0060 ae0000        	ldw	x,#0
 443  0063 89            	pushw	x
 444  0064 ae0008        	ldw	x,#L371
 445  0067 cd0000        	call	_assert_failed
 447  006a 5b04          	addw	sp,#4
 448  006c               L22:
 449                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 451  006c 0d14          	tnz	(OFST+8,sp)
 452  006e 2712          	jreq	L62
 453  0070 7b14          	ld	a,(OFST+8,sp)
 454  0072 a110          	cp	a,#16
 455  0074 270c          	jreq	L62
 456  0076 7b14          	ld	a,(OFST+8,sp)
 457  0078 a120          	cp	a,#32
 458  007a 2706          	jreq	L62
 459  007c 7b14          	ld	a,(OFST+8,sp)
 460  007e a130          	cp	a,#48
 461  0080 2603          	jrne	L42
 462  0082               L62:
 463  0082 4f            	clr	a
 464  0083 2010          	jra	L03
 465  0085               L42:
 466  0085 ae0063        	ldw	x,#99
 467  0088 89            	pushw	x
 468  0089 ae0000        	ldw	x,#0
 469  008c 89            	pushw	x
 470  008d ae0008        	ldw	x,#L371
 471  0090 cd0000        	call	_assert_failed
 473  0093 5b04          	addw	sp,#4
 474  0095               L03:
 475                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 477  0095 0d15          	tnz	(OFST+9,sp)
 478  0097 270c          	jreq	L43
 479  0099 7b15          	ld	a,(OFST+9,sp)
 480  009b a104          	cp	a,#4
 481  009d 2706          	jreq	L43
 482  009f 7b15          	ld	a,(OFST+9,sp)
 483  00a1 a106          	cp	a,#6
 484  00a3 2603          	jrne	L23
 485  00a5               L43:
 486  00a5 4f            	clr	a
 487  00a6 2010          	jra	L63
 488  00a8               L23:
 489  00a8 ae0064        	ldw	x,#100
 490  00ab 89            	pushw	x
 491  00ac ae0000        	ldw	x,#0
 492  00af 89            	pushw	x
 493  00b0 ae0008        	ldw	x,#L371
 494  00b3 cd0000        	call	_assert_failed
 496  00b6 5b04          	addw	sp,#4
 497  00b8               L63:
 498                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 500  00b8 7b17          	ld	a,(OFST+11,sp)
 501  00ba a108          	cp	a,#8
 502  00bc 2730          	jreq	L24
 503  00be 7b17          	ld	a,(OFST+11,sp)
 504  00c0 a140          	cp	a,#64
 505  00c2 272a          	jreq	L24
 506  00c4 7b17          	ld	a,(OFST+11,sp)
 507  00c6 a104          	cp	a,#4
 508  00c8 2724          	jreq	L24
 509  00ca 7b17          	ld	a,(OFST+11,sp)
 510  00cc a180          	cp	a,#128
 511  00ce 271e          	jreq	L24
 512  00d0 7b17          	ld	a,(OFST+11,sp)
 513  00d2 a10c          	cp	a,#12
 514  00d4 2718          	jreq	L24
 515  00d6 7b17          	ld	a,(OFST+11,sp)
 516  00d8 a10c          	cp	a,#12
 517  00da 2712          	jreq	L24
 518  00dc 7b17          	ld	a,(OFST+11,sp)
 519  00de a144          	cp	a,#68
 520  00e0 270c          	jreq	L24
 521  00e2 7b17          	ld	a,(OFST+11,sp)
 522  00e4 a1c0          	cp	a,#192
 523  00e6 2706          	jreq	L24
 524  00e8 7b17          	ld	a,(OFST+11,sp)
 525  00ea a188          	cp	a,#136
 526  00ec 2603          	jrne	L04
 527  00ee               L24:
 528  00ee 4f            	clr	a
 529  00ef 2010          	jra	L44
 530  00f1               L04:
 531  00f1 ae0065        	ldw	x,#101
 532  00f4 89            	pushw	x
 533  00f5 ae0000        	ldw	x,#0
 534  00f8 89            	pushw	x
 535  00f9 ae0008        	ldw	x,#L371
 536  00fc cd0000        	call	_assert_failed
 538  00ff 5b04          	addw	sp,#4
 539  0101               L44:
 540                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 542  0101 7b16          	ld	a,(OFST+10,sp)
 543  0103 a488          	and	a,#136
 544  0105 a188          	cp	a,#136
 545  0107 271b          	jreq	L64
 546  0109 7b16          	ld	a,(OFST+10,sp)
 547  010b a444          	and	a,#68
 548  010d a144          	cp	a,#68
 549  010f 2713          	jreq	L64
 550  0111 7b16          	ld	a,(OFST+10,sp)
 551  0113 a422          	and	a,#34
 552  0115 a122          	cp	a,#34
 553  0117 270b          	jreq	L64
 554  0119 7b16          	ld	a,(OFST+10,sp)
 555  011b a411          	and	a,#17
 556  011d a111          	cp	a,#17
 557  011f 2703          	jreq	L64
 558  0121 4f            	clr	a
 559  0122 2010          	jra	L05
 560  0124               L64:
 561  0124 ae0066        	ldw	x,#102
 562  0127 89            	pushw	x
 563  0128 ae0000        	ldw	x,#0
 564  012b 89            	pushw	x
 565  012c ae0008        	ldw	x,#L371
 566  012f cd0000        	call	_assert_failed
 568  0132 5b04          	addw	sp,#4
 569  0134               L05:
 570                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 572  0134 72195234      	bres	21044,#4
 573                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 575  0138 c65234        	ld	a,21044
 576  013b 1a13          	or	a,(OFST+7,sp)
 577  013d c75234        	ld	21044,a
 578                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 580  0140 c65236        	ld	a,21046
 581  0143 a4cf          	and	a,#207
 582  0145 c75236        	ld	21046,a
 583                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 585  0148 c65236        	ld	a,21046
 586  014b 1a14          	or	a,(OFST+8,sp)
 587  014d c75236        	ld	21046,a
 588                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 590  0150 c65234        	ld	a,21044
 591  0153 a4f9          	and	a,#249
 592  0155 c75234        	ld	21044,a
 593                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 595  0158 c65234        	ld	a,21044
 596  015b 1a15          	or	a,(OFST+9,sp)
 597  015d c75234        	ld	21044,a
 598                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 600  0160 725f5232      	clr	21042
 601                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 603  0164 c65233        	ld	a,21043
 604  0167 a40f          	and	a,#15
 605  0169 c75233        	ld	21043,a
 606                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 608  016c c65233        	ld	a,21043
 609  016f a4f0          	and	a,#240
 610  0171 c75233        	ld	21043,a
 611                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 613  0174 96            	ldw	x,sp
 614  0175 1c000f        	addw	x,#OFST+3
 615  0178 cd0000        	call	c_ltor
 617  017b a604          	ld	a,#4
 618  017d cd0000        	call	c_llsh
 620  0180 96            	ldw	x,sp
 621  0181 1c0001        	addw	x,#OFST-11
 622  0184 cd0000        	call	c_rtol
 625  0187 cd0000        	call	_CLK_GetClockFreq
 627  018a 96            	ldw	x,sp
 628  018b 1c0001        	addw	x,#OFST-11
 629  018e cd0000        	call	c_ludv
 631  0191 96            	ldw	x,sp
 632  0192 1c0009        	addw	x,#OFST-3
 633  0195 cd0000        	call	c_rtol
 636                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 638  0198 96            	ldw	x,sp
 639  0199 1c000f        	addw	x,#OFST+3
 640  019c cd0000        	call	c_ltor
 642  019f a604          	ld	a,#4
 643  01a1 cd0000        	call	c_llsh
 645  01a4 96            	ldw	x,sp
 646  01a5 1c0001        	addw	x,#OFST-11
 647  01a8 cd0000        	call	c_rtol
 650  01ab cd0000        	call	_CLK_GetClockFreq
 652  01ae a664          	ld	a,#100
 653  01b0 cd0000        	call	c_smul
 655  01b3 96            	ldw	x,sp
 656  01b4 1c0001        	addw	x,#OFST-11
 657  01b7 cd0000        	call	c_ludv
 659  01ba 96            	ldw	x,sp
 660  01bb 1c0005        	addw	x,#OFST-7
 661  01be cd0000        	call	c_rtol
 664                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 666  01c1 96            	ldw	x,sp
 667  01c2 1c0009        	addw	x,#OFST-3
 668  01c5 cd0000        	call	c_ltor
 670  01c8 a664          	ld	a,#100
 671  01ca cd0000        	call	c_smul
 673  01cd 96            	ldw	x,sp
 674  01ce 1c0001        	addw	x,#OFST-11
 675  01d1 cd0000        	call	c_rtol
 678  01d4 96            	ldw	x,sp
 679  01d5 1c0005        	addw	x,#OFST-7
 680  01d8 cd0000        	call	c_ltor
 682  01db 96            	ldw	x,sp
 683  01dc 1c0001        	addw	x,#OFST-11
 684  01df cd0000        	call	c_lsub
 686  01e2 a604          	ld	a,#4
 687  01e4 cd0000        	call	c_llsh
 689  01e7 ae0004        	ldw	x,#L25
 690  01ea cd0000        	call	c_ludv
 692  01ed b603          	ld	a,c_lreg+3
 693  01ef a40f          	and	a,#15
 694  01f1 ca5233        	or	a,21043
 695  01f4 c75233        	ld	21043,a
 696                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 698  01f7 1e0b          	ldw	x,(OFST-1,sp)
 699  01f9 54            	srlw	x
 700  01fa 54            	srlw	x
 701  01fb 54            	srlw	x
 702  01fc 54            	srlw	x
 703  01fd 01            	rrwa	x,a
 704  01fe a4f0          	and	a,#240
 705  0200 5f            	clrw	x
 706  0201 ca5233        	or	a,21043
 707  0204 c75233        	ld	21043,a
 708                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 710  0207 c65232        	ld	a,21042
 711  020a 1a0c          	or	a,(OFST+0,sp)
 712  020c c75232        	ld	21042,a
 713                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 715  020f c65235        	ld	a,21045
 716  0212 a4f3          	and	a,#243
 717  0214 c75235        	ld	21045,a
 718                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 720  0217 c65236        	ld	a,21046
 721  021a a4f8          	and	a,#248
 722  021c c75236        	ld	21046,a
 723                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 723                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 725  021f 7b16          	ld	a,(OFST+10,sp)
 726  0221 a407          	and	a,#7
 727  0223 ca5236        	or	a,21046
 728  0226 c75236        	ld	21046,a
 729                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 731  0229 7b17          	ld	a,(OFST+11,sp)
 732  022b a504          	bcp	a,#4
 733  022d 2706          	jreq	L571
 734                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 736  022f 72165235      	bset	21045,#3
 738  0233 2004          	jra	L771
 739  0235               L571:
 740                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 742  0235 72175235      	bres	21045,#3
 743  0239               L771:
 744                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 746  0239 7b17          	ld	a,(OFST+11,sp)
 747  023b a508          	bcp	a,#8
 748  023d 2706          	jreq	L102
 749                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 751  023f 72145235      	bset	21045,#2
 753  0243 2004          	jra	L302
 754  0245               L102:
 755                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 757  0245 72155235      	bres	21045,#2
 758  0249               L302:
 759                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 761  0249 7b16          	ld	a,(OFST+10,sp)
 762  024b a580          	bcp	a,#128
 763  024d 2706          	jreq	L502
 764                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 766  024f 72175236      	bres	21046,#3
 768  0253 200a          	jra	L702
 769  0255               L502:
 770                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 772  0255 7b16          	ld	a,(OFST+10,sp)
 773  0257 a408          	and	a,#8
 774  0259 ca5236        	or	a,21046
 775  025c c75236        	ld	21046,a
 776  025f               L702:
 777                     ; 176 }
 780  025f 5b0c          	addw	sp,#12
 781  0261 81            	ret
 836                     ; 184 void UART1_Cmd(FunctionalState NewState)
 836                     ; 185 {
 837                     	switch	.text
 838  0262               _UART1_Cmd:
 842                     ; 186   if (NewState != DISABLE)
 844  0262 4d            	tnz	a
 845  0263 2706          	jreq	L732
 846                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 848  0265 721b5234      	bres	21044,#5
 850  0269 2004          	jra	L142
 851  026b               L732:
 852                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 854  026b 721a5234      	bset	21044,#5
 855  026f               L142:
 856                     ; 196 }
 859  026f 81            	ret
 985                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 985                     ; 212 {
 986                     	switch	.text
 987  0270               _UART1_ITConfig:
 989  0270 89            	pushw	x
 990  0271 89            	pushw	x
 991       00000002      OFST:	set	2
 994                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 998                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1000  0272 a30100        	cpw	x,#256
1001  0275 2719          	jreq	L26
1002  0277 a30277        	cpw	x,#631
1003  027a 2714          	jreq	L26
1004  027c a30266        	cpw	x,#614
1005  027f 270f          	jreq	L26
1006  0281 a30205        	cpw	x,#517
1007  0284 270a          	jreq	L26
1008  0286 a30244        	cpw	x,#580
1009  0289 2705          	jreq	L26
1010  028b a30346        	cpw	x,#838
1011  028e 2603          	jrne	L06
1012  0290               L26:
1013  0290 4f            	clr	a
1014  0291 2010          	jra	L46
1015  0293               L06:
1016  0293 ae00d8        	ldw	x,#216
1017  0296 89            	pushw	x
1018  0297 ae0000        	ldw	x,#0
1019  029a 89            	pushw	x
1020  029b ae0008        	ldw	x,#L371
1021  029e cd0000        	call	_assert_failed
1023  02a1 5b04          	addw	sp,#4
1024  02a3               L46:
1025                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1027  02a3 0d07          	tnz	(OFST+5,sp)
1028  02a5 2706          	jreq	L07
1029  02a7 7b07          	ld	a,(OFST+5,sp)
1030  02a9 a101          	cp	a,#1
1031  02ab 2603          	jrne	L66
1032  02ad               L07:
1033  02ad 4f            	clr	a
1034  02ae 2010          	jra	L27
1035  02b0               L66:
1036  02b0 ae00d9        	ldw	x,#217
1037  02b3 89            	pushw	x
1038  02b4 ae0000        	ldw	x,#0
1039  02b7 89            	pushw	x
1040  02b8 ae0008        	ldw	x,#L371
1041  02bb cd0000        	call	_assert_failed
1043  02be 5b04          	addw	sp,#4
1044  02c0               L27:
1045                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1047  02c0 7b03          	ld	a,(OFST+1,sp)
1048  02c2 6b01          	ld	(OFST-1,sp),a
1050                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1052  02c4 7b04          	ld	a,(OFST+2,sp)
1053  02c6 a40f          	and	a,#15
1054  02c8 5f            	clrw	x
1055  02c9 97            	ld	xl,a
1056  02ca a601          	ld	a,#1
1057  02cc 5d            	tnzw	x
1058  02cd 2704          	jreq	L47
1059  02cf               L67:
1060  02cf 48            	sll	a
1061  02d0 5a            	decw	x
1062  02d1 26fc          	jrne	L67
1063  02d3               L47:
1064  02d3 6b02          	ld	(OFST+0,sp),a
1066                     ; 224   if (NewState != DISABLE)
1068  02d5 0d07          	tnz	(OFST+5,sp)
1069  02d7 272a          	jreq	L123
1070                     ; 227     if (uartreg == 0x01)
1072  02d9 7b01          	ld	a,(OFST-1,sp)
1073  02db a101          	cp	a,#1
1074  02dd 260a          	jrne	L323
1075                     ; 229       UART1->CR1 |= itpos;
1077  02df c65234        	ld	a,21044
1078  02e2 1a02          	or	a,(OFST+0,sp)
1079  02e4 c75234        	ld	21044,a
1081  02e7 2045          	jra	L333
1082  02e9               L323:
1083                     ; 231     else if (uartreg == 0x02)
1085  02e9 7b01          	ld	a,(OFST-1,sp)
1086  02eb a102          	cp	a,#2
1087  02ed 260a          	jrne	L723
1088                     ; 233       UART1->CR2 |= itpos;
1090  02ef c65235        	ld	a,21045
1091  02f2 1a02          	or	a,(OFST+0,sp)
1092  02f4 c75235        	ld	21045,a
1094  02f7 2035          	jra	L333
1095  02f9               L723:
1096                     ; 237       UART1->CR4 |= itpos;
1098  02f9 c65237        	ld	a,21047
1099  02fc 1a02          	or	a,(OFST+0,sp)
1100  02fe c75237        	ld	21047,a
1101  0301 202b          	jra	L333
1102  0303               L123:
1103                     ; 243     if (uartreg == 0x01)
1105  0303 7b01          	ld	a,(OFST-1,sp)
1106  0305 a101          	cp	a,#1
1107  0307 260b          	jrne	L533
1108                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1110  0309 7b02          	ld	a,(OFST+0,sp)
1111  030b 43            	cpl	a
1112  030c c45234        	and	a,21044
1113  030f c75234        	ld	21044,a
1115  0312 201a          	jra	L333
1116  0314               L533:
1117                     ; 247     else if (uartreg == 0x02)
1119  0314 7b01          	ld	a,(OFST-1,sp)
1120  0316 a102          	cp	a,#2
1121  0318 260b          	jrne	L143
1122                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1124  031a 7b02          	ld	a,(OFST+0,sp)
1125  031c 43            	cpl	a
1126  031d c45235        	and	a,21045
1127  0320 c75235        	ld	21045,a
1129  0323 2009          	jra	L333
1130  0325               L143:
1131                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1133  0325 7b02          	ld	a,(OFST+0,sp)
1134  0327 43            	cpl	a
1135  0328 c45237        	and	a,21047
1136  032b c75237        	ld	21047,a
1137  032e               L333:
1138                     ; 257 }
1141  032e 5b04          	addw	sp,#4
1142  0330 81            	ret
1179                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1179                     ; 266 {
1180                     	switch	.text
1181  0331               _UART1_HalfDuplexCmd:
1183  0331 88            	push	a
1184       00000000      OFST:	set	0
1187                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1189  0332 4d            	tnz	a
1190  0333 2704          	jreq	L401
1191  0335 a101          	cp	a,#1
1192  0337 2603          	jrne	L201
1193  0339               L401:
1194  0339 4f            	clr	a
1195  033a 2010          	jra	L601
1196  033c               L201:
1197  033c ae010b        	ldw	x,#267
1198  033f 89            	pushw	x
1199  0340 ae0000        	ldw	x,#0
1200  0343 89            	pushw	x
1201  0344 ae0008        	ldw	x,#L371
1202  0347 cd0000        	call	_assert_failed
1204  034a 5b04          	addw	sp,#4
1205  034c               L601:
1206                     ; 269   if (NewState != DISABLE)
1208  034c 0d01          	tnz	(OFST+1,sp)
1209  034e 2706          	jreq	L363
1210                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1212  0350 72165238      	bset	21048,#3
1214  0354 2004          	jra	L563
1215  0356               L363:
1216                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1218  0356 72175238      	bres	21048,#3
1219  035a               L563:
1220                     ; 277 }
1223  035a 84            	pop	a
1224  035b 81            	ret
1282                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1282                     ; 286 {
1283                     	switch	.text
1284  035c               _UART1_IrDAConfig:
1286  035c 88            	push	a
1287       00000000      OFST:	set	0
1290                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1292  035d a101          	cp	a,#1
1293  035f 2703          	jreq	L411
1294  0361 4d            	tnz	a
1295  0362 2603          	jrne	L211
1296  0364               L411:
1297  0364 4f            	clr	a
1298  0365 2010          	jra	L611
1299  0367               L211:
1300  0367 ae011f        	ldw	x,#287
1301  036a 89            	pushw	x
1302  036b ae0000        	ldw	x,#0
1303  036e 89            	pushw	x
1304  036f ae0008        	ldw	x,#L371
1305  0372 cd0000        	call	_assert_failed
1307  0375 5b04          	addw	sp,#4
1308  0377               L611:
1309                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1311  0377 0d01          	tnz	(OFST+1,sp)
1312  0379 2706          	jreq	L514
1313                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1315  037b 72145238      	bset	21048,#2
1317  037f 2004          	jra	L714
1318  0381               L514:
1319                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1321  0381 72155238      	bres	21048,#2
1322  0385               L714:
1323                     ; 297 }
1326  0385 84            	pop	a
1327  0386 81            	ret
1363                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1363                     ; 306 {
1364                     	switch	.text
1365  0387               _UART1_IrDACmd:
1367  0387 88            	push	a
1368       00000000      OFST:	set	0
1371                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373  0388 4d            	tnz	a
1374  0389 2704          	jreq	L421
1375  038b a101          	cp	a,#1
1376  038d 2603          	jrne	L221
1377  038f               L421:
1378  038f 4f            	clr	a
1379  0390 2010          	jra	L621
1380  0392               L221:
1381  0392 ae0134        	ldw	x,#308
1382  0395 89            	pushw	x
1383  0396 ae0000        	ldw	x,#0
1384  0399 89            	pushw	x
1385  039a ae0008        	ldw	x,#L371
1386  039d cd0000        	call	_assert_failed
1388  03a0 5b04          	addw	sp,#4
1389  03a2               L621:
1390                     ; 310   if (NewState != DISABLE)
1392  03a2 0d01          	tnz	(OFST+1,sp)
1393  03a4 2706          	jreq	L734
1394                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1396  03a6 72125238      	bset	21048,#1
1398  03aa 2004          	jra	L144
1399  03ac               L734:
1400                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1402  03ac 72135238      	bres	21048,#1
1403  03b0               L144:
1404                     ; 320 }
1407  03b0 84            	pop	a
1408  03b1 81            	ret
1468                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1468                     ; 330 {
1469                     	switch	.text
1470  03b2               _UART1_LINBreakDetectionConfig:
1472  03b2 88            	push	a
1473       00000000      OFST:	set	0
1476                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1478  03b3 4d            	tnz	a
1479  03b4 2704          	jreq	L431
1480  03b6 a101          	cp	a,#1
1481  03b8 2603          	jrne	L231
1482  03ba               L431:
1483  03ba 4f            	clr	a
1484  03bb 2010          	jra	L631
1485  03bd               L231:
1486  03bd ae014b        	ldw	x,#331
1487  03c0 89            	pushw	x
1488  03c1 ae0000        	ldw	x,#0
1489  03c4 89            	pushw	x
1490  03c5 ae0008        	ldw	x,#L371
1491  03c8 cd0000        	call	_assert_failed
1493  03cb 5b04          	addw	sp,#4
1494  03cd               L631:
1495                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1497  03cd 0d01          	tnz	(OFST+1,sp)
1498  03cf 2706          	jreq	L174
1499                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1501  03d1 721a5237      	bset	21047,#5
1503  03d5 2004          	jra	L374
1504  03d7               L174:
1505                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1507  03d7 721b5237      	bres	21047,#5
1508  03db               L374:
1509                     ; 341 }
1512  03db 84            	pop	a
1513  03dc 81            	ret
1549                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1549                     ; 350 {
1550                     	switch	.text
1551  03dd               _UART1_LINCmd:
1553  03dd 88            	push	a
1554       00000000      OFST:	set	0
1557                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1559  03de 4d            	tnz	a
1560  03df 2704          	jreq	L441
1561  03e1 a101          	cp	a,#1
1562  03e3 2603          	jrne	L241
1563  03e5               L441:
1564  03e5 4f            	clr	a
1565  03e6 2010          	jra	L641
1566  03e8               L241:
1567  03e8 ae015f        	ldw	x,#351
1568  03eb 89            	pushw	x
1569  03ec ae0000        	ldw	x,#0
1570  03ef 89            	pushw	x
1571  03f0 ae0008        	ldw	x,#L371
1572  03f3 cd0000        	call	_assert_failed
1574  03f6 5b04          	addw	sp,#4
1575  03f8               L641:
1576                     ; 353   if (NewState != DISABLE)
1578  03f8 0d01          	tnz	(OFST+1,sp)
1579  03fa 2706          	jreq	L315
1580                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1582  03fc 721c5236      	bset	21046,#6
1584  0400 2004          	jra	L515
1585  0402               L315:
1586                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1588  0402 721d5236      	bres	21046,#6
1589  0406               L515:
1590                     ; 363 }
1593  0406 84            	pop	a
1594  0407 81            	ret
1630                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1630                     ; 372 {
1631                     	switch	.text
1632  0408               _UART1_SmartCardCmd:
1634  0408 88            	push	a
1635       00000000      OFST:	set	0
1638                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1640  0409 4d            	tnz	a
1641  040a 2704          	jreq	L451
1642  040c a101          	cp	a,#1
1643  040e 2603          	jrne	L251
1644  0410               L451:
1645  0410 4f            	clr	a
1646  0411 2010          	jra	L651
1647  0413               L251:
1648  0413 ae0175        	ldw	x,#373
1649  0416 89            	pushw	x
1650  0417 ae0000        	ldw	x,#0
1651  041a 89            	pushw	x
1652  041b ae0008        	ldw	x,#L371
1653  041e cd0000        	call	_assert_failed
1655  0421 5b04          	addw	sp,#4
1656  0423               L651:
1657                     ; 375   if (NewState != DISABLE)
1659  0423 0d01          	tnz	(OFST+1,sp)
1660  0425 2706          	jreq	L535
1661                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1663  0427 721a5238      	bset	21048,#5
1665  042b 2004          	jra	L735
1666  042d               L535:
1667                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1669  042d 721b5238      	bres	21048,#5
1670  0431               L735:
1671                     ; 385 }
1674  0431 84            	pop	a
1675  0432 81            	ret
1712                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1712                     ; 395 {
1713                     	switch	.text
1714  0433               _UART1_SmartCardNACKCmd:
1716  0433 88            	push	a
1717       00000000      OFST:	set	0
1720                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1722  0434 4d            	tnz	a
1723  0435 2704          	jreq	L461
1724  0437 a101          	cp	a,#1
1725  0439 2603          	jrne	L261
1726  043b               L461:
1727  043b 4f            	clr	a
1728  043c 2010          	jra	L661
1729  043e               L261:
1730  043e ae018c        	ldw	x,#396
1731  0441 89            	pushw	x
1732  0442 ae0000        	ldw	x,#0
1733  0445 89            	pushw	x
1734  0446 ae0008        	ldw	x,#L371
1735  0449 cd0000        	call	_assert_failed
1737  044c 5b04          	addw	sp,#4
1738  044e               L661:
1739                     ; 398   if (NewState != DISABLE)
1741  044e 0d01          	tnz	(OFST+1,sp)
1742  0450 2706          	jreq	L755
1743                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1745  0452 72185238      	bset	21048,#4
1747  0456 2004          	jra	L165
1748  0458               L755:
1749                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1751  0458 72195238      	bres	21048,#4
1752  045c               L165:
1753                     ; 408 }
1756  045c 84            	pop	a
1757  045d 81            	ret
1815                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1815                     ; 417 {
1816                     	switch	.text
1817  045e               _UART1_WakeUpConfig:
1819  045e 88            	push	a
1820       00000000      OFST:	set	0
1823                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1825  045f 4d            	tnz	a
1826  0460 2704          	jreq	L471
1827  0462 a108          	cp	a,#8
1828  0464 2603          	jrne	L271
1829  0466               L471:
1830  0466 4f            	clr	a
1831  0467 2010          	jra	L671
1832  0469               L271:
1833  0469 ae01a2        	ldw	x,#418
1834  046c 89            	pushw	x
1835  046d ae0000        	ldw	x,#0
1836  0470 89            	pushw	x
1837  0471 ae0008        	ldw	x,#L371
1838  0474 cd0000        	call	_assert_failed
1840  0477 5b04          	addw	sp,#4
1841  0479               L671:
1842                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1844  0479 72175234      	bres	21044,#3
1845                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1847  047d c65234        	ld	a,21044
1848  0480 1a01          	or	a,(OFST+1,sp)
1849  0482 c75234        	ld	21044,a
1850                     ; 422 }
1853  0485 84            	pop	a
1854  0486 81            	ret
1891                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1891                     ; 431 {
1892                     	switch	.text
1893  0487               _UART1_ReceiverWakeUpCmd:
1895  0487 88            	push	a
1896       00000000      OFST:	set	0
1899                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1901  0488 4d            	tnz	a
1902  0489 2704          	jreq	L402
1903  048b a101          	cp	a,#1
1904  048d 2603          	jrne	L202
1905  048f               L402:
1906  048f 4f            	clr	a
1907  0490 2010          	jra	L602
1908  0492               L202:
1909  0492 ae01b0        	ldw	x,#432
1910  0495 89            	pushw	x
1911  0496 ae0000        	ldw	x,#0
1912  0499 89            	pushw	x
1913  049a ae0008        	ldw	x,#L371
1914  049d cd0000        	call	_assert_failed
1916  04a0 5b04          	addw	sp,#4
1917  04a2               L602:
1918                     ; 434   if (NewState != DISABLE)
1920  04a2 0d01          	tnz	(OFST+1,sp)
1921  04a4 2706          	jreq	L726
1922                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1924  04a6 72125235      	bset	21045,#1
1926  04aa 2004          	jra	L136
1927  04ac               L726:
1928                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1930  04ac 72135235      	bres	21045,#1
1931  04b0               L136:
1932                     ; 444 }
1935  04b0 84            	pop	a
1936  04b1 81            	ret
1959                     ; 451 uint8_t UART1_ReceiveData8(void)
1959                     ; 452 {
1960                     	switch	.text
1961  04b2               _UART1_ReceiveData8:
1965                     ; 453   return ((uint8_t)UART1->DR);
1967  04b2 c65231        	ld	a,21041
1970  04b5 81            	ret
2004                     ; 461 uint16_t UART1_ReceiveData9(void)
2004                     ; 462 {
2005                     	switch	.text
2006  04b6               _UART1_ReceiveData9:
2008  04b6 89            	pushw	x
2009       00000002      OFST:	set	2
2012                     ; 463   uint16_t temp = 0;
2014                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2016  04b7 c65234        	ld	a,21044
2017  04ba 5f            	clrw	x
2018  04bb a480          	and	a,#128
2019  04bd 5f            	clrw	x
2020  04be 02            	rlwa	x,a
2021  04bf 58            	sllw	x
2022  04c0 1f01          	ldw	(OFST-1,sp),x
2024                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2026  04c2 c65231        	ld	a,21041
2027  04c5 5f            	clrw	x
2028  04c6 97            	ld	xl,a
2029  04c7 01            	rrwa	x,a
2030  04c8 1a02          	or	a,(OFST+0,sp)
2031  04ca 01            	rrwa	x,a
2032  04cb 1a01          	or	a,(OFST-1,sp)
2033  04cd 01            	rrwa	x,a
2034  04ce 01            	rrwa	x,a
2035  04cf a4ff          	and	a,#255
2036  04d1 01            	rrwa	x,a
2037  04d2 a401          	and	a,#1
2038  04d4 01            	rrwa	x,a
2041  04d5 5b02          	addw	sp,#2
2042  04d7 81            	ret
2076                     ; 474 void UART1_SendData8(uint8_t Data)
2076                     ; 475 {
2077                     	switch	.text
2078  04d8               _UART1_SendData8:
2082                     ; 477   UART1->DR = Data;
2084  04d8 c75231        	ld	21041,a
2085                     ; 478 }
2088  04db 81            	ret
2122                     ; 486 void UART1_SendData9(uint16_t Data)
2122                     ; 487 {
2123                     	switch	.text
2124  04dc               _UART1_SendData9:
2126  04dc 89            	pushw	x
2127       00000000      OFST:	set	0
2130                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2132  04dd 721d5234      	bres	21044,#6
2133                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2135  04e1 54            	srlw	x
2136  04e2 54            	srlw	x
2137  04e3 9f            	ld	a,xl
2138  04e4 a440          	and	a,#64
2139  04e6 ca5234        	or	a,21044
2140  04e9 c75234        	ld	21044,a
2141                     ; 493   UART1->DR   = (uint8_t)(Data);
2143  04ec 7b02          	ld	a,(OFST+2,sp)
2144  04ee c75231        	ld	21041,a
2145                     ; 494 }
2148  04f1 85            	popw	x
2149  04f2 81            	ret
2172                     ; 501 void UART1_SendBreak(void)
2172                     ; 502 {
2173                     	switch	.text
2174  04f3               _UART1_SendBreak:
2178                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2180  04f3 72105235      	bset	21045,#0
2181                     ; 504 }
2184  04f7 81            	ret
2219                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2219                     ; 512 {
2220                     	switch	.text
2221  04f8               _UART1_SetAddress:
2223  04f8 88            	push	a
2224       00000000      OFST:	set	0
2227                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2229  04f9 a110          	cp	a,#16
2230  04fb 2403          	jruge	L422
2231  04fd 4f            	clr	a
2232  04fe 2010          	jra	L622
2233  0500               L422:
2234  0500 ae0202        	ldw	x,#514
2235  0503 89            	pushw	x
2236  0504 ae0000        	ldw	x,#0
2237  0507 89            	pushw	x
2238  0508 ae0008        	ldw	x,#L371
2239  050b cd0000        	call	_assert_failed
2241  050e 5b04          	addw	sp,#4
2242  0510               L622:
2243                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2245  0510 c65237        	ld	a,21047
2246  0513 a4f0          	and	a,#240
2247  0515 c75237        	ld	21047,a
2248                     ; 519   UART1->CR4 |= UART1_Address;
2250  0518 c65237        	ld	a,21047
2251  051b 1a01          	or	a,(OFST+1,sp)
2252  051d c75237        	ld	21047,a
2253                     ; 520 }
2256  0520 84            	pop	a
2257  0521 81            	ret
2291                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2291                     ; 529 {
2292                     	switch	.text
2293  0522               _UART1_SetGuardTime:
2297                     ; 531   UART1->GTR = UART1_GuardTime;
2299  0522 c75239        	ld	21049,a
2300                     ; 532 }
2303  0525 81            	ret
2337                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2337                     ; 557 {
2338                     	switch	.text
2339  0526               _UART1_SetPrescaler:
2343                     ; 559   UART1->PSCR = UART1_Prescaler;
2345  0526 c7523a        	ld	21050,a
2346                     ; 560 }
2349  0529 81            	ret
2493                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2493                     ; 569 {
2494                     	switch	.text
2495  052a               _UART1_GetFlagStatus:
2497  052a 89            	pushw	x
2498  052b 88            	push	a
2499       00000001      OFST:	set	1
2502                     ; 570   FlagStatus status = RESET;
2504                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2506  052c a30080        	cpw	x,#128
2507  052f 272d          	jreq	L042
2508  0531 a30040        	cpw	x,#64
2509  0534 2728          	jreq	L042
2510  0536 a30020        	cpw	x,#32
2511  0539 2723          	jreq	L042
2512  053b a30010        	cpw	x,#16
2513  053e 271e          	jreq	L042
2514  0540 a30008        	cpw	x,#8
2515  0543 2719          	jreq	L042
2516  0545 a30004        	cpw	x,#4
2517  0548 2714          	jreq	L042
2518  054a a30002        	cpw	x,#2
2519  054d 270f          	jreq	L042
2520  054f a30001        	cpw	x,#1
2521  0552 270a          	jreq	L042
2522  0554 a30101        	cpw	x,#257
2523  0557 2705          	jreq	L042
2524  0559 a30210        	cpw	x,#528
2525  055c 2603          	jrne	L632
2526  055e               L042:
2527  055e 4f            	clr	a
2528  055f 2010          	jra	L242
2529  0561               L632:
2530  0561 ae023d        	ldw	x,#573
2531  0564 89            	pushw	x
2532  0565 ae0000        	ldw	x,#0
2533  0568 89            	pushw	x
2534  0569 ae0008        	ldw	x,#L371
2535  056c cd0000        	call	_assert_failed
2537  056f 5b04          	addw	sp,#4
2538  0571               L242:
2539                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2541  0571 1e02          	ldw	x,(OFST+1,sp)
2542  0573 a30210        	cpw	x,#528
2543  0576 2611          	jrne	L1601
2544                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2546  0578 c65237        	ld	a,21047
2547  057b 1503          	bcp	a,(OFST+2,sp)
2548  057d 2706          	jreq	L3601
2549                     ; 582       status = SET;
2551  057f a601          	ld	a,#1
2552  0581 6b01          	ld	(OFST+0,sp),a
2555  0583 202b          	jra	L7601
2556  0585               L3601:
2557                     ; 587       status = RESET;
2559  0585 0f01          	clr	(OFST+0,sp)
2561  0587 2027          	jra	L7601
2562  0589               L1601:
2563                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2565  0589 1e02          	ldw	x,(OFST+1,sp)
2566  058b a30101        	cpw	x,#257
2567  058e 2611          	jrne	L1701
2568                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2570  0590 c65235        	ld	a,21045
2571  0593 1503          	bcp	a,(OFST+2,sp)
2572  0595 2706          	jreq	L3701
2573                     ; 595       status = SET;
2575  0597 a601          	ld	a,#1
2576  0599 6b01          	ld	(OFST+0,sp),a
2579  059b 2013          	jra	L7601
2580  059d               L3701:
2581                     ; 600       status = RESET;
2583  059d 0f01          	clr	(OFST+0,sp)
2585  059f 200f          	jra	L7601
2586  05a1               L1701:
2587                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2589  05a1 c65230        	ld	a,21040
2590  05a4 1503          	bcp	a,(OFST+2,sp)
2591  05a6 2706          	jreq	L1011
2592                     ; 608       status = SET;
2594  05a8 a601          	ld	a,#1
2595  05aa 6b01          	ld	(OFST+0,sp),a
2598  05ac 2002          	jra	L7601
2599  05ae               L1011:
2600                     ; 613       status = RESET;
2602  05ae 0f01          	clr	(OFST+0,sp)
2604  05b0               L7601:
2605                     ; 617   return status;
2607  05b0 7b01          	ld	a,(OFST+0,sp)
2610  05b2 5b03          	addw	sp,#3
2611  05b4 81            	ret
2647                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2647                     ; 647 {
2648                     	switch	.text
2649  05b5               _UART1_ClearFlag:
2651  05b5 89            	pushw	x
2652       00000000      OFST:	set	0
2655                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2657  05b6 a30020        	cpw	x,#32
2658  05b9 2705          	jreq	L052
2659  05bb a30210        	cpw	x,#528
2660  05be 2603          	jrne	L642
2661  05c0               L052:
2662  05c0 4f            	clr	a
2663  05c1 2010          	jra	L252
2664  05c3               L642:
2665  05c3 ae0288        	ldw	x,#648
2666  05c6 89            	pushw	x
2667  05c7 ae0000        	ldw	x,#0
2668  05ca 89            	pushw	x
2669  05cb ae0008        	ldw	x,#L371
2670  05ce cd0000        	call	_assert_failed
2672  05d1 5b04          	addw	sp,#4
2673  05d3               L252:
2674                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2676  05d3 1e01          	ldw	x,(OFST+1,sp)
2677  05d5 a30020        	cpw	x,#32
2678  05d8 2606          	jrne	L3211
2679                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2681  05da 35df5230      	mov	21040,#223
2683  05de 2004          	jra	L5211
2684  05e0               L3211:
2685                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2687  05e0 72195237      	bres	21047,#4
2688  05e4               L5211:
2689                     ; 660 }
2692  05e4 85            	popw	x
2693  05e5 81            	ret
2776                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2776                     ; 676 {
2777                     	switch	.text
2778  05e6               _UART1_GetITStatus:
2780  05e6 89            	pushw	x
2781  05e7 89            	pushw	x
2782       00000002      OFST:	set	2
2785                     ; 677   ITStatus pendingbitstatus = RESET;
2787                     ; 678   uint8_t itpos = 0;
2789                     ; 679   uint8_t itmask1 = 0;
2791                     ; 680   uint8_t itmask2 = 0;
2793                     ; 681   uint8_t enablestatus = 0;
2795                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2797  05e8 a30277        	cpw	x,#631
2798  05eb 271e          	jreq	L062
2799  05ed a30266        	cpw	x,#614
2800  05f0 2719          	jreq	L062
2801  05f2 a30255        	cpw	x,#597
2802  05f5 2714          	jreq	L062
2803  05f7 a30244        	cpw	x,#580
2804  05fa 270f          	jreq	L062
2805  05fc a30235        	cpw	x,#565
2806  05ff 270a          	jreq	L062
2807  0601 a30346        	cpw	x,#838
2808  0604 2705          	jreq	L062
2809  0606 a30100        	cpw	x,#256
2810  0609 2603          	jrne	L652
2811  060b               L062:
2812  060b 4f            	clr	a
2813  060c 2010          	jra	L262
2814  060e               L652:
2815  060e ae02ac        	ldw	x,#684
2816  0611 89            	pushw	x
2817  0612 ae0000        	ldw	x,#0
2818  0615 89            	pushw	x
2819  0616 ae0008        	ldw	x,#L371
2820  0619 cd0000        	call	_assert_failed
2822  061c 5b04          	addw	sp,#4
2823  061e               L262:
2824                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2826  061e 7b04          	ld	a,(OFST+2,sp)
2827  0620 a40f          	and	a,#15
2828  0622 5f            	clrw	x
2829  0623 97            	ld	xl,a
2830  0624 a601          	ld	a,#1
2831  0626 5d            	tnzw	x
2832  0627 2704          	jreq	L462
2833  0629               L662:
2834  0629 48            	sll	a
2835  062a 5a            	decw	x
2836  062b 26fc          	jrne	L662
2837  062d               L462:
2838  062d 6b01          	ld	(OFST-1,sp),a
2840                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2842  062f 7b04          	ld	a,(OFST+2,sp)
2843  0631 4e            	swap	a
2844  0632 a40f          	and	a,#15
2845  0634 6b02          	ld	(OFST+0,sp),a
2847                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2849  0636 7b02          	ld	a,(OFST+0,sp)
2850  0638 5f            	clrw	x
2851  0639 97            	ld	xl,a
2852  063a a601          	ld	a,#1
2853  063c 5d            	tnzw	x
2854  063d 2704          	jreq	L072
2855  063f               L272:
2856  063f 48            	sll	a
2857  0640 5a            	decw	x
2858  0641 26fc          	jrne	L272
2859  0643               L072:
2860  0643 6b02          	ld	(OFST+0,sp),a
2862                     ; 695   if (UART1_IT == UART1_IT_PE)
2864  0645 1e03          	ldw	x,(OFST+1,sp)
2865  0647 a30100        	cpw	x,#256
2866  064a 261c          	jrne	L1711
2867                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2869  064c c65234        	ld	a,21044
2870  064f 1402          	and	a,(OFST+0,sp)
2871  0651 6b02          	ld	(OFST+0,sp),a
2873                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2875  0653 c65230        	ld	a,21040
2876  0656 1501          	bcp	a,(OFST-1,sp)
2877  0658 270a          	jreq	L3711
2879  065a 0d02          	tnz	(OFST+0,sp)
2880  065c 2706          	jreq	L3711
2881                     ; 704       pendingbitstatus = SET;
2883  065e a601          	ld	a,#1
2884  0660 6b02          	ld	(OFST+0,sp),a
2887  0662 2041          	jra	L7711
2888  0664               L3711:
2889                     ; 709       pendingbitstatus = RESET;
2891  0664 0f02          	clr	(OFST+0,sp)
2893  0666 203d          	jra	L7711
2894  0668               L1711:
2895                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2897  0668 1e03          	ldw	x,(OFST+1,sp)
2898  066a a30346        	cpw	x,#838
2899  066d 261c          	jrne	L1021
2900                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2902  066f c65237        	ld	a,21047
2903  0672 1402          	and	a,(OFST+0,sp)
2904  0674 6b02          	ld	(OFST+0,sp),a
2906                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2908  0676 c65237        	ld	a,21047
2909  0679 1501          	bcp	a,(OFST-1,sp)
2910  067b 270a          	jreq	L3021
2912  067d 0d02          	tnz	(OFST+0,sp)
2913  067f 2706          	jreq	L3021
2914                     ; 721       pendingbitstatus = SET;
2916  0681 a601          	ld	a,#1
2917  0683 6b02          	ld	(OFST+0,sp),a
2920  0685 201e          	jra	L7711
2921  0687               L3021:
2922                     ; 726       pendingbitstatus = RESET;
2924  0687 0f02          	clr	(OFST+0,sp)
2926  0689 201a          	jra	L7711
2927  068b               L1021:
2928                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2930  068b c65235        	ld	a,21045
2931  068e 1402          	and	a,(OFST+0,sp)
2932  0690 6b02          	ld	(OFST+0,sp),a
2934                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2936  0692 c65230        	ld	a,21040
2937  0695 1501          	bcp	a,(OFST-1,sp)
2938  0697 270a          	jreq	L1121
2940  0699 0d02          	tnz	(OFST+0,sp)
2941  069b 2706          	jreq	L1121
2942                     ; 737       pendingbitstatus = SET;
2944  069d a601          	ld	a,#1
2945  069f 6b02          	ld	(OFST+0,sp),a
2948  06a1 2002          	jra	L7711
2949  06a3               L1121:
2950                     ; 742       pendingbitstatus = RESET;
2952  06a3 0f02          	clr	(OFST+0,sp)
2954  06a5               L7711:
2955                     ; 747   return  pendingbitstatus;
2957  06a5 7b02          	ld	a,(OFST+0,sp)
2960  06a7 5b04          	addw	sp,#4
2961  06a9 81            	ret
2998                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2998                     ; 776 {
2999                     	switch	.text
3000  06aa               _UART1_ClearITPendingBit:
3002  06aa 89            	pushw	x
3003       00000000      OFST:	set	0
3006                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
3008  06ab a30255        	cpw	x,#597
3009  06ae 2705          	jreq	L003
3010  06b0 a30346        	cpw	x,#838
3011  06b3 2603          	jrne	L672
3012  06b5               L003:
3013  06b5 4f            	clr	a
3014  06b6 2010          	jra	L203
3015  06b8               L672:
3016  06b8 ae0309        	ldw	x,#777
3017  06bb 89            	pushw	x
3018  06bc ae0000        	ldw	x,#0
3019  06bf 89            	pushw	x
3020  06c0 ae0008        	ldw	x,#L371
3021  06c3 cd0000        	call	_assert_failed
3023  06c6 5b04          	addw	sp,#4
3024  06c8               L203:
3025                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3027  06c8 1e01          	ldw	x,(OFST+1,sp)
3028  06ca a30255        	cpw	x,#597
3029  06cd 2606          	jrne	L3321
3030                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3032  06cf 35df5230      	mov	21040,#223
3034  06d3 2004          	jra	L5321
3035  06d5               L3321:
3036                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3038  06d5 72195237      	bres	21047,#4
3039  06d9               L5321:
3040                     ; 789 }
3043  06d9 85            	popw	x
3044  06da 81            	ret
3057                     	xdef	_UART1_ClearITPendingBit
3058                     	xdef	_UART1_GetITStatus
3059                     	xdef	_UART1_ClearFlag
3060                     	xdef	_UART1_GetFlagStatus
3061                     	xdef	_UART1_SetPrescaler
3062                     	xdef	_UART1_SetGuardTime
3063                     	xdef	_UART1_SetAddress
3064                     	xdef	_UART1_SendBreak
3065                     	xdef	_UART1_SendData9
3066                     	xdef	_UART1_SendData8
3067                     	xdef	_UART1_ReceiveData9
3068                     	xdef	_UART1_ReceiveData8
3069                     	xdef	_UART1_ReceiverWakeUpCmd
3070                     	xdef	_UART1_WakeUpConfig
3071                     	xdef	_UART1_SmartCardNACKCmd
3072                     	xdef	_UART1_SmartCardCmd
3073                     	xdef	_UART1_LINCmd
3074                     	xdef	_UART1_LINBreakDetectionConfig
3075                     	xdef	_UART1_IrDACmd
3076                     	xdef	_UART1_IrDAConfig
3077                     	xdef	_UART1_HalfDuplexCmd
3078                     	xdef	_UART1_ITConfig
3079                     	xdef	_UART1_Cmd
3080                     	xdef	_UART1_Init
3081                     	xdef	_UART1_DeInit
3082                     	xref	_assert_failed
3083                     	xref	_CLK_GetClockFreq
3084                     	switch	.const
3085  0008               L371:
3086  0008 7372635c7374  	dc.b	"src\stm8s_uart1.c",0
3087                     	xref.b	c_lreg
3088                     	xref.b	c_x
3108                     	xref	c_lsub
3109                     	xref	c_smul
3110                     	xref	c_ludv
3111                     	xref	c_rtol
3112                     	xref	c_llsh
3113                     	xref	c_lcmp
3114                     	xref	c_ltor
3115                     	end
