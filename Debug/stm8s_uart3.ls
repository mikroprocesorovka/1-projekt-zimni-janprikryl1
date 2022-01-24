   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  43                     ; 54 void UART3_DeInit(void)
  43                     ; 55 {
  45                     	switch	.text
  46  0000               _UART3_DeInit:
  50                     ; 58   (void) UART3->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 59   (void) UART3->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  76  001e 725f5249      	clr	21065
  77                     ; 69 }
  80  0022 81            	ret
 308                     .const:	section	.text
 309  0000               L43:
 310  0000 00098969      	dc.l	625001
 311  0004               L64:
 312  0004 00000064      	dc.l	100
 313                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 313                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 313                     ; 85                 UART3_Mode_TypeDef Mode)
 313                     ; 86 {
 314                     	switch	.text
 315  0023               _UART3_Init:
 317  0023 520e          	subw	sp,#14
 318       0000000e      OFST:	set	14
 321                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 325                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 329                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 331  0025 0d15          	tnz	(OFST+7,sp)
 332  0027 2706          	jreq	L21
 333  0029 7b15          	ld	a,(OFST+7,sp)
 334  002b a110          	cp	a,#16
 335  002d 2603          	jrne	L01
 336  002f               L21:
 337  002f 4f            	clr	a
 338  0030 2010          	jra	L41
 339  0032               L01:
 340  0032 ae005b        	ldw	x,#91
 341  0035 89            	pushw	x
 342  0036 ae0000        	ldw	x,#0
 343  0039 89            	pushw	x
 344  003a ae0008        	ldw	x,#L741
 345  003d cd0000        	call	_assert_failed
 347  0040 5b04          	addw	sp,#4
 348  0042               L41:
 349                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 351  0042 0d16          	tnz	(OFST+8,sp)
 352  0044 2706          	jreq	L02
 353  0046 7b16          	ld	a,(OFST+8,sp)
 354  0048 a120          	cp	a,#32
 355  004a 2603          	jrne	L61
 356  004c               L02:
 357  004c 4f            	clr	a
 358  004d 2010          	jra	L22
 359  004f               L61:
 360  004f ae005c        	ldw	x,#92
 361  0052 89            	pushw	x
 362  0053 ae0000        	ldw	x,#0
 363  0056 89            	pushw	x
 364  0057 ae0008        	ldw	x,#L741
 365  005a cd0000        	call	_assert_failed
 367  005d 5b04          	addw	sp,#4
 368  005f               L22:
 369                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 371  005f 0d17          	tnz	(OFST+9,sp)
 372  0061 270c          	jreq	L62
 373  0063 7b17          	ld	a,(OFST+9,sp)
 374  0065 a104          	cp	a,#4
 375  0067 2706          	jreq	L62
 376  0069 7b17          	ld	a,(OFST+9,sp)
 377  006b a106          	cp	a,#6
 378  006d 2603          	jrne	L42
 379  006f               L62:
 380  006f 4f            	clr	a
 381  0070 2010          	jra	L03
 382  0072               L42:
 383  0072 ae005d        	ldw	x,#93
 384  0075 89            	pushw	x
 385  0076 ae0000        	ldw	x,#0
 386  0079 89            	pushw	x
 387  007a ae0008        	ldw	x,#L741
 388  007d cd0000        	call	_assert_failed
 390  0080 5b04          	addw	sp,#4
 391  0082               L03:
 392                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 394  0082 96            	ldw	x,sp
 395  0083 1c0011        	addw	x,#OFST+3
 396  0086 cd0000        	call	c_ltor
 398  0089 ae0000        	ldw	x,#L43
 399  008c cd0000        	call	c_lcmp
 401  008f 2403          	jruge	L23
 402  0091 4f            	clr	a
 403  0092 2010          	jra	L63
 404  0094               L23:
 405  0094 ae005e        	ldw	x,#94
 406  0097 89            	pushw	x
 407  0098 ae0000        	ldw	x,#0
 408  009b 89            	pushw	x
 409  009c ae0008        	ldw	x,#L741
 410  009f cd0000        	call	_assert_failed
 412  00a2 5b04          	addw	sp,#4
 413  00a4               L63:
 414                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 416  00a4 7b18          	ld	a,(OFST+10,sp)
 417  00a6 a108          	cp	a,#8
 418  00a8 2730          	jreq	L24
 419  00aa 7b18          	ld	a,(OFST+10,sp)
 420  00ac a140          	cp	a,#64
 421  00ae 272a          	jreq	L24
 422  00b0 7b18          	ld	a,(OFST+10,sp)
 423  00b2 a104          	cp	a,#4
 424  00b4 2724          	jreq	L24
 425  00b6 7b18          	ld	a,(OFST+10,sp)
 426  00b8 a180          	cp	a,#128
 427  00ba 271e          	jreq	L24
 428  00bc 7b18          	ld	a,(OFST+10,sp)
 429  00be a10c          	cp	a,#12
 430  00c0 2718          	jreq	L24
 431  00c2 7b18          	ld	a,(OFST+10,sp)
 432  00c4 a10c          	cp	a,#12
 433  00c6 2712          	jreq	L24
 434  00c8 7b18          	ld	a,(OFST+10,sp)
 435  00ca a144          	cp	a,#68
 436  00cc 270c          	jreq	L24
 437  00ce 7b18          	ld	a,(OFST+10,sp)
 438  00d0 a1c0          	cp	a,#192
 439  00d2 2706          	jreq	L24
 440  00d4 7b18          	ld	a,(OFST+10,sp)
 441  00d6 a188          	cp	a,#136
 442  00d8 2603          	jrne	L04
 443  00da               L24:
 444  00da 4f            	clr	a
 445  00db 2010          	jra	L44
 446  00dd               L04:
 447  00dd ae005f        	ldw	x,#95
 448  00e0 89            	pushw	x
 449  00e1 ae0000        	ldw	x,#0
 450  00e4 89            	pushw	x
 451  00e5 ae0008        	ldw	x,#L741
 452  00e8 cd0000        	call	_assert_failed
 454  00eb 5b04          	addw	sp,#4
 455  00ed               L44:
 456                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 458  00ed 72195244      	bres	21060,#4
 459                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 461  00f1 c65244        	ld	a,21060
 462  00f4 1a15          	or	a,(OFST+7,sp)
 463  00f6 c75244        	ld	21060,a
 464                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 466  00f9 c65246        	ld	a,21062
 467  00fc a4cf          	and	a,#207
 468  00fe c75246        	ld	21062,a
 469                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 471  0101 c65246        	ld	a,21062
 472  0104 1a16          	or	a,(OFST+8,sp)
 473  0106 c75246        	ld	21062,a
 474                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 476  0109 c65244        	ld	a,21060
 477  010c a4f9          	and	a,#249
 478  010e c75244        	ld	21060,a
 479                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 481  0111 c65244        	ld	a,21060
 482  0114 1a17          	or	a,(OFST+9,sp)
 483  0116 c75244        	ld	21060,a
 484                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 486  0119 725f5242      	clr	21058
 487                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 489  011d c65243        	ld	a,21059
 490  0120 a40f          	and	a,#15
 491  0122 c75243        	ld	21059,a
 492                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 494  0125 c65243        	ld	a,21059
 495  0128 a4f0          	and	a,#240
 496  012a c75243        	ld	21059,a
 497                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 499  012d 96            	ldw	x,sp
 500  012e 1c0011        	addw	x,#OFST+3
 501  0131 cd0000        	call	c_ltor
 503  0134 a604          	ld	a,#4
 504  0136 cd0000        	call	c_llsh
 506  0139 96            	ldw	x,sp
 507  013a 1c0001        	addw	x,#OFST-13
 508  013d cd0000        	call	c_rtol
 511  0140 cd0000        	call	_CLK_GetClockFreq
 513  0143 96            	ldw	x,sp
 514  0144 1c0001        	addw	x,#OFST-13
 515  0147 cd0000        	call	c_ludv
 517  014a 96            	ldw	x,sp
 518  014b 1c000b        	addw	x,#OFST-3
 519  014e cd0000        	call	c_rtol
 522                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 524  0151 96            	ldw	x,sp
 525  0152 1c0011        	addw	x,#OFST+3
 526  0155 cd0000        	call	c_ltor
 528  0158 a604          	ld	a,#4
 529  015a cd0000        	call	c_llsh
 531  015d 96            	ldw	x,sp
 532  015e 1c0001        	addw	x,#OFST-13
 533  0161 cd0000        	call	c_rtol
 536  0164 cd0000        	call	_CLK_GetClockFreq
 538  0167 a664          	ld	a,#100
 539  0169 cd0000        	call	c_smul
 541  016c 96            	ldw	x,sp
 542  016d 1c0001        	addw	x,#OFST-13
 543  0170 cd0000        	call	c_ludv
 545  0173 96            	ldw	x,sp
 546  0174 1c0007        	addw	x,#OFST-7
 547  0177 cd0000        	call	c_rtol
 550                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 550                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 552  017a 96            	ldw	x,sp
 553  017b 1c000b        	addw	x,#OFST-3
 554  017e cd0000        	call	c_ltor
 556  0181 a664          	ld	a,#100
 557  0183 cd0000        	call	c_smul
 559  0186 96            	ldw	x,sp
 560  0187 1c0001        	addw	x,#OFST-13
 561  018a cd0000        	call	c_rtol
 564  018d 96            	ldw	x,sp
 565  018e 1c0007        	addw	x,#OFST-7
 566  0191 cd0000        	call	c_ltor
 568  0194 96            	ldw	x,sp
 569  0195 1c0001        	addw	x,#OFST-13
 570  0198 cd0000        	call	c_lsub
 572  019b a604          	ld	a,#4
 573  019d cd0000        	call	c_llsh
 575  01a0 ae0004        	ldw	x,#L64
 576  01a3 cd0000        	call	c_ludv
 578  01a6 b603          	ld	a,c_lreg+3
 579  01a8 a40f          	and	a,#15
 580  01aa 6b05          	ld	(OFST-9,sp),a
 582                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 584  01ac 1e0d          	ldw	x,(OFST-1,sp)
 585  01ae 54            	srlw	x
 586  01af 54            	srlw	x
 587  01b0 54            	srlw	x
 588  01b1 54            	srlw	x
 589  01b2 01            	rrwa	x,a
 590  01b3 a4f0          	and	a,#240
 591  01b5 5f            	clrw	x
 592  01b6 6b06          	ld	(OFST-8,sp),a
 594                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 596  01b8 7b05          	ld	a,(OFST-9,sp)
 597  01ba 1a06          	or	a,(OFST-8,sp)
 598  01bc c75243        	ld	21059,a
 599                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 601  01bf 7b0e          	ld	a,(OFST+0,sp)
 602  01c1 c75242        	ld	21058,a
 603                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 605  01c4 7b18          	ld	a,(OFST+10,sp)
 606  01c6 a504          	bcp	a,#4
 607  01c8 2706          	jreq	L151
 608                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 610  01ca 72165245      	bset	21061,#3
 612  01ce 2004          	jra	L351
 613  01d0               L151:
 614                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 616  01d0 72175245      	bres	21061,#3
 617  01d4               L351:
 618                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 620  01d4 7b18          	ld	a,(OFST+10,sp)
 621  01d6 a508          	bcp	a,#8
 622  01d8 2706          	jreq	L551
 623                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 625  01da 72145245      	bset	21061,#2
 627  01de 2004          	jra	L751
 628  01e0               L551:
 629                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 631  01e0 72155245      	bres	21061,#2
 632  01e4               L751:
 633                     ; 152 }
 636  01e4 5b0e          	addw	sp,#14
 637  01e6 81            	ret
 692                     ; 160 void UART3_Cmd(FunctionalState NewState)
 692                     ; 161 {
 693                     	switch	.text
 694  01e7               _UART3_Cmd:
 698                     ; 162   if (NewState != DISABLE)
 700  01e7 4d            	tnz	a
 701  01e8 2706          	jreq	L702
 702                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 704  01ea 721b5244      	bres	21060,#5
 706  01ee 2004          	jra	L112
 707  01f0               L702:
 708                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 710  01f0 721a5244      	bset	21060,#5
 711  01f4               L112:
 712                     ; 172 }
 715  01f4 81            	ret
 848                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 848                     ; 190 {
 849                     	switch	.text
 850  01f5               _UART3_ITConfig:
 852  01f5 89            	pushw	x
 853  01f6 89            	pushw	x
 854       00000002      OFST:	set	2
 857                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 861                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 863  01f7 a30100        	cpw	x,#256
 864  01fa 271e          	jreq	L65
 865  01fc a30277        	cpw	x,#631
 866  01ff 2719          	jreq	L65
 867  0201 a30266        	cpw	x,#614
 868  0204 2714          	jreq	L65
 869  0206 a30205        	cpw	x,#517
 870  0209 270f          	jreq	L65
 871  020b a30244        	cpw	x,#580
 872  020e 270a          	jreq	L65
 873  0210 a30412        	cpw	x,#1042
 874  0213 2705          	jreq	L65
 875  0215 a30346        	cpw	x,#838
 876  0218 2603          	jrne	L45
 877  021a               L65:
 878  021a 4f            	clr	a
 879  021b 2010          	jra	L06
 880  021d               L45:
 881  021d ae00c2        	ldw	x,#194
 882  0220 89            	pushw	x
 883  0221 ae0000        	ldw	x,#0
 884  0224 89            	pushw	x
 885  0225 ae0008        	ldw	x,#L741
 886  0228 cd0000        	call	_assert_failed
 888  022b 5b04          	addw	sp,#4
 889  022d               L06:
 890                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 892  022d 0d07          	tnz	(OFST+5,sp)
 893  022f 2706          	jreq	L46
 894  0231 7b07          	ld	a,(OFST+5,sp)
 895  0233 a101          	cp	a,#1
 896  0235 2603          	jrne	L26
 897  0237               L46:
 898  0237 4f            	clr	a
 899  0238 2010          	jra	L66
 900  023a               L26:
 901  023a ae00c3        	ldw	x,#195
 902  023d 89            	pushw	x
 903  023e ae0000        	ldw	x,#0
 904  0241 89            	pushw	x
 905  0242 ae0008        	ldw	x,#L741
 906  0245 cd0000        	call	_assert_failed
 908  0248 5b04          	addw	sp,#4
 909  024a               L66:
 910                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 912  024a 7b03          	ld	a,(OFST+1,sp)
 913  024c 6b01          	ld	(OFST-1,sp),a
 915                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 917  024e 7b04          	ld	a,(OFST+2,sp)
 918  0250 a40f          	and	a,#15
 919  0252 5f            	clrw	x
 920  0253 97            	ld	xl,a
 921  0254 a601          	ld	a,#1
 922  0256 5d            	tnzw	x
 923  0257 2704          	jreq	L07
 924  0259               L27:
 925  0259 48            	sll	a
 926  025a 5a            	decw	x
 927  025b 26fc          	jrne	L27
 928  025d               L07:
 929  025d 6b02          	ld	(OFST+0,sp),a
 931                     ; 203   if (NewState != DISABLE)
 933  025f 0d07          	tnz	(OFST+5,sp)
 934  0261 273a          	jreq	L372
 935                     ; 206     if (uartreg == 0x01)
 937  0263 7b01          	ld	a,(OFST-1,sp)
 938  0265 a101          	cp	a,#1
 939  0267 260a          	jrne	L572
 940                     ; 208       UART3->CR1 |= itpos;
 942  0269 c65244        	ld	a,21060
 943  026c 1a02          	or	a,(OFST+0,sp)
 944  026e c75244        	ld	21060,a
 946  0271 2066          	jra	L113
 947  0273               L572:
 948                     ; 210     else if (uartreg == 0x02)
 950  0273 7b01          	ld	a,(OFST-1,sp)
 951  0275 a102          	cp	a,#2
 952  0277 260a          	jrne	L103
 953                     ; 212       UART3->CR2 |= itpos;
 955  0279 c65245        	ld	a,21061
 956  027c 1a02          	or	a,(OFST+0,sp)
 957  027e c75245        	ld	21061,a
 959  0281 2056          	jra	L113
 960  0283               L103:
 961                     ; 214     else if (uartreg == 0x03)
 963  0283 7b01          	ld	a,(OFST-1,sp)
 964  0285 a103          	cp	a,#3
 965  0287 260a          	jrne	L503
 966                     ; 216       UART3->CR4 |= itpos;
 968  0289 c65247        	ld	a,21063
 969  028c 1a02          	or	a,(OFST+0,sp)
 970  028e c75247        	ld	21063,a
 972  0291 2046          	jra	L113
 973  0293               L503:
 974                     ; 220       UART3->CR6 |= itpos;
 976  0293 c65249        	ld	a,21065
 977  0296 1a02          	or	a,(OFST+0,sp)
 978  0298 c75249        	ld	21065,a
 979  029b 203c          	jra	L113
 980  029d               L372:
 981                     ; 226     if (uartreg == 0x01)
 983  029d 7b01          	ld	a,(OFST-1,sp)
 984  029f a101          	cp	a,#1
 985  02a1 260b          	jrne	L313
 986                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 988  02a3 7b02          	ld	a,(OFST+0,sp)
 989  02a5 43            	cpl	a
 990  02a6 c45244        	and	a,21060
 991  02a9 c75244        	ld	21060,a
 993  02ac 202b          	jra	L113
 994  02ae               L313:
 995                     ; 230     else if (uartreg == 0x02)
 997  02ae 7b01          	ld	a,(OFST-1,sp)
 998  02b0 a102          	cp	a,#2
 999  02b2 260b          	jrne	L713
1000                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
1002  02b4 7b02          	ld	a,(OFST+0,sp)
1003  02b6 43            	cpl	a
1004  02b7 c45245        	and	a,21061
1005  02ba c75245        	ld	21061,a
1007  02bd 201a          	jra	L113
1008  02bf               L713:
1009                     ; 234     else if (uartreg == 0x03)
1011  02bf 7b01          	ld	a,(OFST-1,sp)
1012  02c1 a103          	cp	a,#3
1013  02c3 260b          	jrne	L323
1014                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
1016  02c5 7b02          	ld	a,(OFST+0,sp)
1017  02c7 43            	cpl	a
1018  02c8 c45247        	and	a,21063
1019  02cb c75247        	ld	21063,a
1021  02ce 2009          	jra	L113
1022  02d0               L323:
1023                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
1025  02d0 7b02          	ld	a,(OFST+0,sp)
1026  02d2 43            	cpl	a
1027  02d3 c45249        	and	a,21065
1028  02d6 c75249        	ld	21065,a
1029  02d9               L113:
1030                     ; 243 }
1033  02d9 5b04          	addw	sp,#4
1034  02db 81            	ret
1094                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1094                     ; 253 {
1095                     	switch	.text
1096  02dc               _UART3_LINBreakDetectionConfig:
1098  02dc 88            	push	a
1099       00000000      OFST:	set	0
1102                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1104  02dd 4d            	tnz	a
1105  02de 2704          	jreq	L001
1106  02e0 a101          	cp	a,#1
1107  02e2 2603          	jrne	L67
1108  02e4               L001:
1109  02e4 4f            	clr	a
1110  02e5 2010          	jra	L201
1111  02e7               L67:
1112  02e7 ae00ff        	ldw	x,#255
1113  02ea 89            	pushw	x
1114  02eb ae0000        	ldw	x,#0
1115  02ee 89            	pushw	x
1116  02ef ae0008        	ldw	x,#L741
1117  02f2 cd0000        	call	_assert_failed
1119  02f5 5b04          	addw	sp,#4
1120  02f7               L201:
1121                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1123  02f7 0d01          	tnz	(OFST+1,sp)
1124  02f9 2706          	jreq	L553
1125                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
1127  02fb 721a5247      	bset	21063,#5
1129  02ff 2004          	jra	L753
1130  0301               L553:
1131                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1133  0301 721b5247      	bres	21063,#5
1134  0305               L753:
1135                     ; 265 }
1138  0305 84            	pop	a
1139  0306 81            	ret
1261                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1261                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1261                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1261                     ; 280 {
1262                     	switch	.text
1263  0307               _UART3_LINConfig:
1265  0307 89            	pushw	x
1266       00000000      OFST:	set	0
1269                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1271  0308 9e            	ld	a,xh
1272  0309 4d            	tnz	a
1273  030a 2705          	jreq	L011
1274  030c 9e            	ld	a,xh
1275  030d a101          	cp	a,#1
1276  030f 2603          	jrne	L601
1277  0311               L011:
1278  0311 4f            	clr	a
1279  0312 2010          	jra	L211
1280  0314               L601:
1281  0314 ae011a        	ldw	x,#282
1282  0317 89            	pushw	x
1283  0318 ae0000        	ldw	x,#0
1284  031b 89            	pushw	x
1285  031c ae0008        	ldw	x,#L741
1286  031f cd0000        	call	_assert_failed
1288  0322 5b04          	addw	sp,#4
1289  0324               L211:
1290                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1292  0324 7b02          	ld	a,(OFST+2,sp)
1293  0326 a101          	cp	a,#1
1294  0328 2704          	jreq	L611
1295  032a 0d02          	tnz	(OFST+2,sp)
1296  032c 2603          	jrne	L411
1297  032e               L611:
1298  032e 4f            	clr	a
1299  032f 2010          	jra	L021
1300  0331               L411:
1301  0331 ae011b        	ldw	x,#283
1302  0334 89            	pushw	x
1303  0335 ae0000        	ldw	x,#0
1304  0338 89            	pushw	x
1305  0339 ae0008        	ldw	x,#L741
1306  033c cd0000        	call	_assert_failed
1308  033f 5b04          	addw	sp,#4
1309  0341               L021:
1310                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1312  0341 0d05          	tnz	(OFST+5,sp)
1313  0343 2706          	jreq	L421
1314  0345 7b05          	ld	a,(OFST+5,sp)
1315  0347 a101          	cp	a,#1
1316  0349 2603          	jrne	L221
1317  034b               L421:
1318  034b 4f            	clr	a
1319  034c 2010          	jra	L621
1320  034e               L221:
1321  034e ae011c        	ldw	x,#284
1322  0351 89            	pushw	x
1323  0352 ae0000        	ldw	x,#0
1324  0355 89            	pushw	x
1325  0356 ae0008        	ldw	x,#L741
1326  0359 cd0000        	call	_assert_failed
1328  035c 5b04          	addw	sp,#4
1329  035e               L621:
1330                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1332  035e 0d01          	tnz	(OFST+1,sp)
1333  0360 2706          	jreq	L734
1334                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1336  0362 721a5249      	bset	21065,#5
1338  0366 2004          	jra	L144
1339  0368               L734:
1340                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1342  0368 721b5249      	bres	21065,#5
1343  036c               L144:
1344                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1346  036c 0d02          	tnz	(OFST+2,sp)
1347  036e 2706          	jreq	L344
1348                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1350  0370 72185249      	bset	21065,#4
1352  0374 2004          	jra	L544
1353  0376               L344:
1354                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1356  0376 72195249      	bres	21065,#4
1357  037a               L544:
1358                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1360  037a 0d05          	tnz	(OFST+5,sp)
1361  037c 2706          	jreq	L744
1362                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1364  037e 721e5249      	bset	21065,#7
1366  0382 2004          	jra	L154
1367  0384               L744:
1368                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1370  0384 721f5249      	bres	21065,#7
1371  0388               L154:
1372                     ; 312 }
1375  0388 85            	popw	x
1376  0389 81            	ret
1412                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1412                     ; 321 {
1413                     	switch	.text
1414  038a               _UART3_LINCmd:
1416  038a 88            	push	a
1417       00000000      OFST:	set	0
1420                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1422  038b 4d            	tnz	a
1423  038c 2704          	jreq	L431
1424  038e a101          	cp	a,#1
1425  0390 2603          	jrne	L231
1426  0392               L431:
1427  0392 4f            	clr	a
1428  0393 2010          	jra	L631
1429  0395               L231:
1430  0395 ae0143        	ldw	x,#323
1431  0398 89            	pushw	x
1432  0399 ae0000        	ldw	x,#0
1433  039c 89            	pushw	x
1434  039d ae0008        	ldw	x,#L741
1435  03a0 cd0000        	call	_assert_failed
1437  03a3 5b04          	addw	sp,#4
1438  03a5               L631:
1439                     ; 325   if (NewState != DISABLE)
1441  03a5 0d01          	tnz	(OFST+1,sp)
1442  03a7 2706          	jreq	L174
1443                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1445  03a9 721c5246      	bset	21062,#6
1447  03ad 2004          	jra	L374
1448  03af               L174:
1449                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1451  03af 721d5246      	bres	21062,#6
1452  03b3               L374:
1453                     ; 335 }
1456  03b3 84            	pop	a
1457  03b4 81            	ret
1515                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1515                     ; 344 {
1516                     	switch	.text
1517  03b5               _UART3_WakeUpConfig:
1519  03b5 88            	push	a
1520       00000000      OFST:	set	0
1523                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1525  03b6 4d            	tnz	a
1526  03b7 2704          	jreq	L441
1527  03b9 a108          	cp	a,#8
1528  03bb 2603          	jrne	L241
1529  03bd               L441:
1530  03bd 4f            	clr	a
1531  03be 2010          	jra	L641
1532  03c0               L241:
1533  03c0 ae015a        	ldw	x,#346
1534  03c3 89            	pushw	x
1535  03c4 ae0000        	ldw	x,#0
1536  03c7 89            	pushw	x
1537  03c8 ae0008        	ldw	x,#L741
1538  03cb cd0000        	call	_assert_failed
1540  03ce 5b04          	addw	sp,#4
1541  03d0               L641:
1542                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1544  03d0 72175244      	bres	21060,#3
1545                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1547  03d4 c65244        	ld	a,21060
1548  03d7 1a01          	or	a,(OFST+1,sp)
1549  03d9 c75244        	ld	21060,a
1550                     ; 350 }
1553  03dc 84            	pop	a
1554  03dd 81            	ret
1591                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1591                     ; 359 {
1592                     	switch	.text
1593  03de               _UART3_ReceiverWakeUpCmd:
1595  03de 88            	push	a
1596       00000000      OFST:	set	0
1599                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1601  03df 4d            	tnz	a
1602  03e0 2704          	jreq	L451
1603  03e2 a101          	cp	a,#1
1604  03e4 2603          	jrne	L251
1605  03e6               L451:
1606  03e6 4f            	clr	a
1607  03e7 2010          	jra	L651
1608  03e9               L251:
1609  03e9 ae0169        	ldw	x,#361
1610  03ec 89            	pushw	x
1611  03ed ae0000        	ldw	x,#0
1612  03f0 89            	pushw	x
1613  03f1 ae0008        	ldw	x,#L741
1614  03f4 cd0000        	call	_assert_failed
1616  03f7 5b04          	addw	sp,#4
1617  03f9               L651:
1618                     ; 363   if (NewState != DISABLE)
1620  03f9 0d01          	tnz	(OFST+1,sp)
1621  03fb 2706          	jreq	L145
1622                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1624  03fd 72125245      	bset	21061,#1
1626  0401 2004          	jra	L345
1627  0403               L145:
1628                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1630  0403 72135245      	bres	21061,#1
1631  0407               L345:
1632                     ; 373 }
1635  0407 84            	pop	a
1636  0408 81            	ret
1659                     ; 380 uint8_t UART3_ReceiveData8(void)
1659                     ; 381 {
1660                     	switch	.text
1661  0409               _UART3_ReceiveData8:
1665                     ; 382   return ((uint8_t)UART3->DR);
1667  0409 c65241        	ld	a,21057
1670  040c 81            	ret
1704                     ; 390 uint16_t UART3_ReceiveData9(void)
1704                     ; 391 {
1705                     	switch	.text
1706  040d               _UART3_ReceiveData9:
1708  040d 89            	pushw	x
1709       00000002      OFST:	set	2
1712                     ; 392   uint16_t temp = 0;
1714                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1716  040e c65244        	ld	a,21060
1717  0411 5f            	clrw	x
1718  0412 a480          	and	a,#128
1719  0414 5f            	clrw	x
1720  0415 02            	rlwa	x,a
1721  0416 58            	sllw	x
1722  0417 1f01          	ldw	(OFST-1,sp),x
1724                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1726  0419 c65241        	ld	a,21057
1727  041c 5f            	clrw	x
1728  041d 97            	ld	xl,a
1729  041e 01            	rrwa	x,a
1730  041f 1a02          	or	a,(OFST+0,sp)
1731  0421 01            	rrwa	x,a
1732  0422 1a01          	or	a,(OFST-1,sp)
1733  0424 01            	rrwa	x,a
1734  0425 01            	rrwa	x,a
1735  0426 a4ff          	and	a,#255
1736  0428 01            	rrwa	x,a
1737  0429 a401          	and	a,#1
1738  042b 01            	rrwa	x,a
1741  042c 5b02          	addw	sp,#2
1742  042e 81            	ret
1776                     ; 403 void UART3_SendData8(uint8_t Data)
1776                     ; 404 {
1777                     	switch	.text
1778  042f               _UART3_SendData8:
1782                     ; 406   UART3->DR = Data;
1784  042f c75241        	ld	21057,a
1785                     ; 407 }
1788  0432 81            	ret
1822                     ; 414 void UART3_SendData9(uint16_t Data)
1822                     ; 415 {
1823                     	switch	.text
1824  0433               _UART3_SendData9:
1826  0433 89            	pushw	x
1827       00000000      OFST:	set	0
1830                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1832  0434 721d5244      	bres	21060,#6
1833                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1835  0438 54            	srlw	x
1836  0439 54            	srlw	x
1837  043a 9f            	ld	a,xl
1838  043b a440          	and	a,#64
1839  043d ca5244        	or	a,21060
1840  0440 c75244        	ld	21060,a
1841                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1843  0443 7b02          	ld	a,(OFST+2,sp)
1844  0445 c75241        	ld	21057,a
1845                     ; 424 }
1848  0448 85            	popw	x
1849  0449 81            	ret
1872                     ; 431 void UART3_SendBreak(void)
1872                     ; 432 {
1873                     	switch	.text
1874  044a               _UART3_SendBreak:
1878                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1880  044a 72105245      	bset	21061,#0
1881                     ; 434 }
1884  044e 81            	ret
1919                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1919                     ; 442 {
1920                     	switch	.text
1921  044f               _UART3_SetAddress:
1923  044f 88            	push	a
1924       00000000      OFST:	set	0
1927                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1929  0450 a110          	cp	a,#16
1930  0452 2403          	jruge	L471
1931  0454 4f            	clr	a
1932  0455 2010          	jra	L671
1933  0457               L471:
1934  0457 ae01bc        	ldw	x,#444
1935  045a 89            	pushw	x
1936  045b ae0000        	ldw	x,#0
1937  045e 89            	pushw	x
1938  045f ae0008        	ldw	x,#L741
1939  0462 cd0000        	call	_assert_failed
1941  0465 5b04          	addw	sp,#4
1942  0467               L671:
1943                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1945  0467 c65247        	ld	a,21063
1946  046a a4f0          	and	a,#240
1947  046c c75247        	ld	21063,a
1948                     ; 449   UART3->CR4 |= UART3_Address;
1950  046f c65247        	ld	a,21063
1951  0472 1a01          	or	a,(OFST+1,sp)
1952  0474 c75247        	ld	21063,a
1953                     ; 450 }
1956  0477 84            	pop	a
1957  0478 81            	ret
2115                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2115                     ; 459 {
2116                     	switch	.text
2117  0479               _UART3_GetFlagStatus:
2119  0479 89            	pushw	x
2120  047a 88            	push	a
2121       00000001      OFST:	set	1
2124                     ; 460   FlagStatus status = RESET;
2126                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2128  047b a30080        	cpw	x,#128
2129  047e 2737          	jreq	L402
2130  0480 a30040        	cpw	x,#64
2131  0483 2732          	jreq	L402
2132  0485 a30020        	cpw	x,#32
2133  0488 272d          	jreq	L402
2134  048a a30010        	cpw	x,#16
2135  048d 2728          	jreq	L402
2136  048f a30008        	cpw	x,#8
2137  0492 2723          	jreq	L402
2138  0494 a30004        	cpw	x,#4
2139  0497 271e          	jreq	L402
2140  0499 a30002        	cpw	x,#2
2141  049c 2719          	jreq	L402
2142  049e a30001        	cpw	x,#1
2143  04a1 2714          	jreq	L402
2144  04a3 a30101        	cpw	x,#257
2145  04a6 270f          	jreq	L402
2146  04a8 a30301        	cpw	x,#769
2147  04ab 270a          	jreq	L402
2148  04ad a30302        	cpw	x,#770
2149  04b0 2705          	jreq	L402
2150  04b2 a30210        	cpw	x,#528
2151  04b5 2603          	jrne	L202
2152  04b7               L402:
2153  04b7 4f            	clr	a
2154  04b8 2010          	jra	L602
2155  04ba               L202:
2156  04ba ae01cf        	ldw	x,#463
2157  04bd 89            	pushw	x
2158  04be ae0000        	ldw	x,#0
2159  04c1 89            	pushw	x
2160  04c2 ae0008        	ldw	x,#L741
2161  04c5 cd0000        	call	_assert_failed
2163  04c8 5b04          	addw	sp,#4
2164  04ca               L602:
2165                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
2167  04ca 1e02          	ldw	x,(OFST+1,sp)
2168  04cc a30210        	cpw	x,#528
2169  04cf 2611          	jrne	L347
2170                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2172  04d1 c65247        	ld	a,21063
2173  04d4 1503          	bcp	a,(OFST+2,sp)
2174  04d6 2706          	jreq	L547
2175                     ; 471       status = SET;
2177  04d8 a601          	ld	a,#1
2178  04da 6b01          	ld	(OFST+0,sp),a
2181  04dc 2039          	jra	L157
2182  04de               L547:
2183                     ; 476       status = RESET;
2185  04de 0f01          	clr	(OFST+0,sp)
2187  04e0 2035          	jra	L157
2188  04e2               L347:
2189                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
2191  04e2 1e02          	ldw	x,(OFST+1,sp)
2192  04e4 a30101        	cpw	x,#257
2193  04e7 2611          	jrne	L357
2194                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2196  04e9 c65245        	ld	a,21061
2197  04ec 1503          	bcp	a,(OFST+2,sp)
2198  04ee 2706          	jreq	L557
2199                     ; 484       status = SET;
2201  04f0 a601          	ld	a,#1
2202  04f2 6b01          	ld	(OFST+0,sp),a
2205  04f4 2021          	jra	L157
2206  04f6               L557:
2207                     ; 489       status = RESET;
2209  04f6 0f01          	clr	(OFST+0,sp)
2211  04f8 201d          	jra	L157
2212  04fa               L357:
2213                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2215  04fa 1e02          	ldw	x,(OFST+1,sp)
2216  04fc a30302        	cpw	x,#770
2217  04ff 2707          	jreq	L567
2219  0501 1e02          	ldw	x,(OFST+1,sp)
2220  0503 a30301        	cpw	x,#769
2221  0506 2614          	jrne	L367
2222  0508               L567:
2223                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2225  0508 c65249        	ld	a,21065
2226  050b 1503          	bcp	a,(OFST+2,sp)
2227  050d 2706          	jreq	L767
2228                     ; 497       status = SET;
2230  050f a601          	ld	a,#1
2231  0511 6b01          	ld	(OFST+0,sp),a
2234  0513 2002          	jra	L157
2235  0515               L767:
2236                     ; 502       status = RESET;
2238  0515 0f01          	clr	(OFST+0,sp)
2240  0517               L157:
2241                     ; 520   return  status;
2243  0517 7b01          	ld	a,(OFST+0,sp)
2246  0519 5b03          	addw	sp,#3
2247  051b 81            	ret
2248  051c               L367:
2249                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2251  051c c65240        	ld	a,21056
2252  051f 1503          	bcp	a,(OFST+2,sp)
2253  0521 2706          	jreq	L577
2254                     ; 510       status = SET;
2256  0523 a601          	ld	a,#1
2257  0525 6b01          	ld	(OFST+0,sp),a
2260  0527 20ee          	jra	L157
2261  0529               L577:
2262                     ; 515       status = RESET;
2264  0529 0f01          	clr	(OFST+0,sp)
2266  052b 20ea          	jra	L157
2302                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2302                     ; 552 {
2303                     	switch	.text
2304  052d               _UART3_ClearFlag:
2306  052d 89            	pushw	x
2307       00000000      OFST:	set	0
2310                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2312  052e a30020        	cpw	x,#32
2313  0531 270f          	jreq	L412
2314  0533 a30302        	cpw	x,#770
2315  0536 270a          	jreq	L412
2316  0538 a30301        	cpw	x,#769
2317  053b 2705          	jreq	L412
2318  053d a30210        	cpw	x,#528
2319  0540 2603          	jrne	L212
2320  0542               L412:
2321  0542 4f            	clr	a
2322  0543 2010          	jra	L612
2323  0545               L212:
2324  0545 ae022a        	ldw	x,#554
2325  0548 89            	pushw	x
2326  0549 ae0000        	ldw	x,#0
2327  054c 89            	pushw	x
2328  054d ae0008        	ldw	x,#L741
2329  0550 cd0000        	call	_assert_failed
2331  0553 5b04          	addw	sp,#4
2332  0555               L612:
2333                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
2335  0555 1e01          	ldw	x,(OFST+1,sp)
2336  0557 a30020        	cpw	x,#32
2337  055a 2606          	jrne	L7101
2338                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2340  055c 35df5240      	mov	21056,#223
2342  0560 201e          	jra	L1201
2343  0562               L7101:
2344                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
2346  0562 1e01          	ldw	x,(OFST+1,sp)
2347  0564 a30210        	cpw	x,#528
2348  0567 2606          	jrne	L3201
2349                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2351  0569 72195247      	bres	21063,#4
2353  056d 2011          	jra	L1201
2354  056f               L3201:
2355                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
2357  056f 1e01          	ldw	x,(OFST+1,sp)
2358  0571 a30302        	cpw	x,#770
2359  0574 2606          	jrne	L7201
2360                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2362  0576 72135249      	bres	21065,#1
2364  057a 2004          	jra	L1201
2365  057c               L7201:
2366                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2368  057c 72115249      	bres	21065,#0
2369  0580               L1201:
2370                     ; 576 }
2373  0580 85            	popw	x
2374  0581 81            	ret
2457                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2457                     ; 592 {
2458                     	switch	.text
2459  0582               _UART3_GetITStatus:
2461  0582 89            	pushw	x
2462  0583 89            	pushw	x
2463       00000002      OFST:	set	2
2466                     ; 593   ITStatus pendingbitstatus = RESET;
2468                     ; 594   uint8_t itpos = 0;
2470                     ; 595   uint8_t itmask1 = 0;
2472                     ; 596   uint8_t itmask2 = 0;
2474                     ; 597   uint8_t enablestatus = 0;
2476                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2478  0584 a30277        	cpw	x,#631
2479  0587 2723          	jreq	L422
2480  0589 a30266        	cpw	x,#614
2481  058c 271e          	jreq	L422
2482  058e a30255        	cpw	x,#597
2483  0591 2719          	jreq	L422
2484  0593 a30244        	cpw	x,#580
2485  0596 2714          	jreq	L422
2486  0598 a30235        	cpw	x,#565
2487  059b 270f          	jreq	L422
2488  059d a30346        	cpw	x,#838
2489  05a0 270a          	jreq	L422
2490  05a2 a30412        	cpw	x,#1042
2491  05a5 2705          	jreq	L422
2492  05a7 a30100        	cpw	x,#256
2493  05aa 2603          	jrne	L222
2494  05ac               L422:
2495  05ac 4f            	clr	a
2496  05ad 2010          	jra	L622
2497  05af               L222:
2498  05af ae0258        	ldw	x,#600
2499  05b2 89            	pushw	x
2500  05b3 ae0000        	ldw	x,#0
2501  05b6 89            	pushw	x
2502  05b7 ae0008        	ldw	x,#L741
2503  05ba cd0000        	call	_assert_failed
2505  05bd 5b04          	addw	sp,#4
2506  05bf               L622:
2507                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2509  05bf 7b04          	ld	a,(OFST+2,sp)
2510  05c1 a40f          	and	a,#15
2511  05c3 5f            	clrw	x
2512  05c4 97            	ld	xl,a
2513  05c5 a601          	ld	a,#1
2514  05c7 5d            	tnzw	x
2515  05c8 2704          	jreq	L032
2516  05ca               L232:
2517  05ca 48            	sll	a
2518  05cb 5a            	decw	x
2519  05cc 26fc          	jrne	L232
2520  05ce               L032:
2521  05ce 6b01          	ld	(OFST-1,sp),a
2523                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2525  05d0 7b04          	ld	a,(OFST+2,sp)
2526  05d2 4e            	swap	a
2527  05d3 a40f          	and	a,#15
2528  05d5 6b02          	ld	(OFST+0,sp),a
2530                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2532  05d7 7b02          	ld	a,(OFST+0,sp)
2533  05d9 5f            	clrw	x
2534  05da 97            	ld	xl,a
2535  05db a601          	ld	a,#1
2536  05dd 5d            	tnzw	x
2537  05de 2704          	jreq	L432
2538  05e0               L632:
2539  05e0 48            	sll	a
2540  05e1 5a            	decw	x
2541  05e2 26fc          	jrne	L632
2542  05e4               L432:
2543  05e4 6b02          	ld	(OFST+0,sp),a
2545                     ; 610   if (UART3_IT == UART3_IT_PE)
2547  05e6 1e03          	ldw	x,(OFST+1,sp)
2548  05e8 a30100        	cpw	x,#256
2549  05eb 261c          	jrne	L5701
2550                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2552  05ed c65244        	ld	a,21060
2553  05f0 1402          	and	a,(OFST+0,sp)
2554  05f2 6b02          	ld	(OFST+0,sp),a
2556                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2558  05f4 c65240        	ld	a,21056
2559  05f7 1501          	bcp	a,(OFST-1,sp)
2560  05f9 270a          	jreq	L7701
2562  05fb 0d02          	tnz	(OFST+0,sp)
2563  05fd 2706          	jreq	L7701
2564                     ; 619       pendingbitstatus = SET;
2566  05ff a601          	ld	a,#1
2567  0601 6b02          	ld	(OFST+0,sp),a
2570  0603 2064          	jra	L3011
2571  0605               L7701:
2572                     ; 624       pendingbitstatus = RESET;
2574  0605 0f02          	clr	(OFST+0,sp)
2576  0607 2060          	jra	L3011
2577  0609               L5701:
2578                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2580  0609 1e03          	ldw	x,(OFST+1,sp)
2581  060b a30346        	cpw	x,#838
2582  060e 261c          	jrne	L5011
2583                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2585  0610 c65247        	ld	a,21063
2586  0613 1402          	and	a,(OFST+0,sp)
2587  0615 6b02          	ld	(OFST+0,sp),a
2589                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2591  0617 c65247        	ld	a,21063
2592  061a 1501          	bcp	a,(OFST-1,sp)
2593  061c 270a          	jreq	L7011
2595  061e 0d02          	tnz	(OFST+0,sp)
2596  0620 2706          	jreq	L7011
2597                     ; 635       pendingbitstatus = SET;
2599  0622 a601          	ld	a,#1
2600  0624 6b02          	ld	(OFST+0,sp),a
2603  0626 2041          	jra	L3011
2604  0628               L7011:
2605                     ; 640       pendingbitstatus = RESET;
2607  0628 0f02          	clr	(OFST+0,sp)
2609  062a 203d          	jra	L3011
2610  062c               L5011:
2611                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2613  062c 1e03          	ldw	x,(OFST+1,sp)
2614  062e a30412        	cpw	x,#1042
2615  0631 261c          	jrne	L5111
2616                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2618  0633 c65249        	ld	a,21065
2619  0636 1402          	and	a,(OFST+0,sp)
2620  0638 6b02          	ld	(OFST+0,sp),a
2622                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2624  063a c65249        	ld	a,21065
2625  063d 1501          	bcp	a,(OFST-1,sp)
2626  063f 270a          	jreq	L7111
2628  0641 0d02          	tnz	(OFST+0,sp)
2629  0643 2706          	jreq	L7111
2630                     ; 651       pendingbitstatus = SET;
2632  0645 a601          	ld	a,#1
2633  0647 6b02          	ld	(OFST+0,sp),a
2636  0649 201e          	jra	L3011
2637  064b               L7111:
2638                     ; 656       pendingbitstatus = RESET;
2640  064b 0f02          	clr	(OFST+0,sp)
2642  064d 201a          	jra	L3011
2643  064f               L5111:
2644                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2646  064f c65245        	ld	a,21061
2647  0652 1402          	and	a,(OFST+0,sp)
2648  0654 6b02          	ld	(OFST+0,sp),a
2650                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2652  0656 c65240        	ld	a,21056
2653  0659 1501          	bcp	a,(OFST-1,sp)
2654  065b 270a          	jreq	L5211
2656  065d 0d02          	tnz	(OFST+0,sp)
2657  065f 2706          	jreq	L5211
2658                     ; 667       pendingbitstatus = SET;
2660  0661 a601          	ld	a,#1
2661  0663 6b02          	ld	(OFST+0,sp),a
2664  0665 2002          	jra	L3011
2665  0667               L5211:
2666                     ; 672       pendingbitstatus = RESET;
2668  0667 0f02          	clr	(OFST+0,sp)
2670  0669               L3011:
2671                     ; 676   return  pendingbitstatus;
2673  0669 7b02          	ld	a,(OFST+0,sp)
2676  066b 5b04          	addw	sp,#4
2677  066d 81            	ret
2714                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2714                     ; 707 {
2715                     	switch	.text
2716  066e               _UART3_ClearITPendingBit:
2718  066e 89            	pushw	x
2719       00000000      OFST:	set	0
2722                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2724  066f a30255        	cpw	x,#597
2725  0672 270a          	jreq	L442
2726  0674 a30412        	cpw	x,#1042
2727  0677 2705          	jreq	L442
2728  0679 a30346        	cpw	x,#838
2729  067c 2603          	jrne	L242
2730  067e               L442:
2731  067e 4f            	clr	a
2732  067f 2010          	jra	L642
2733  0681               L242:
2734  0681 ae02c5        	ldw	x,#709
2735  0684 89            	pushw	x
2736  0685 ae0000        	ldw	x,#0
2737  0688 89            	pushw	x
2738  0689 ae0008        	ldw	x,#L741
2739  068c cd0000        	call	_assert_failed
2741  068f 5b04          	addw	sp,#4
2742  0691               L642:
2743                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2745  0691 1e01          	ldw	x,(OFST+1,sp)
2746  0693 a30255        	cpw	x,#597
2747  0696 2606          	jrne	L7411
2748                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2750  0698 35df5240      	mov	21056,#223
2752  069c 2011          	jra	L1511
2753  069e               L7411:
2754                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2756  069e 1e01          	ldw	x,(OFST+1,sp)
2757  06a0 a30346        	cpw	x,#838
2758  06a3 2606          	jrne	L3511
2759                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2761  06a5 72195247      	bres	21063,#4
2763  06a9 2004          	jra	L1511
2764  06ab               L3511:
2765                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2767  06ab 72135249      	bres	21065,#1
2768  06af               L1511:
2769                     ; 726 }
2772  06af 85            	popw	x
2773  06b0 81            	ret
2786                     	xdef	_UART3_ClearITPendingBit
2787                     	xdef	_UART3_GetITStatus
2788                     	xdef	_UART3_ClearFlag
2789                     	xdef	_UART3_GetFlagStatus
2790                     	xdef	_UART3_SetAddress
2791                     	xdef	_UART3_SendBreak
2792                     	xdef	_UART3_SendData9
2793                     	xdef	_UART3_SendData8
2794                     	xdef	_UART3_ReceiveData9
2795                     	xdef	_UART3_ReceiveData8
2796                     	xdef	_UART3_WakeUpConfig
2797                     	xdef	_UART3_ReceiverWakeUpCmd
2798                     	xdef	_UART3_LINCmd
2799                     	xdef	_UART3_LINConfig
2800                     	xdef	_UART3_LINBreakDetectionConfig
2801                     	xdef	_UART3_ITConfig
2802                     	xdef	_UART3_Cmd
2803                     	xdef	_UART3_Init
2804                     	xdef	_UART3_DeInit
2805                     	xref	_assert_failed
2806                     	xref	_CLK_GetClockFreq
2807                     	switch	.const
2808  0008               L741:
2809  0008 7372635c7374  	dc.b	"src\stm8s_uart3.c",0
2810                     	xref.b	c_lreg
2811                     	xref.b	c_x
2831                     	xref	c_lsub
2832                     	xref	c_smul
2833                     	xref	c_ludv
2834                     	xref	c_rtol
2835                     	xref	c_llsh
2836                     	xref	c_lcmp
2837                     	xref	c_ltor
2838                     	end
