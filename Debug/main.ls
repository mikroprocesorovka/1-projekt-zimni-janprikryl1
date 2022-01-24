   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  55                     ; 10 void assert_failed(u8* file, u32 line)
  55                     ; 11 { 
  57                     	switch	.text
  58  0000               _assert_failed:
  62  0000               L72:
  63  0000 20fe          	jra	L72
 117                     ; 27 char putchar (char c)
 117                     ; 28 {
 118                     	switch	.text
 119  0002               _putchar:
 121  0002 88            	push	a
 122       00000000      OFST:	set	0
 125                     ; 30   UART1_SendData8(c);
 127  0003 cd0000        	call	_UART1_SendData8
 130  0006               L56:
 131                     ; 32   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 133  0006 ae0080        	ldw	x,#128
 134  0009 cd0000        	call	_UART1_GetFlagStatus
 136  000c 4d            	tnz	a
 137  000d 27f7          	jreq	L56
 138                     ; 34   return (c);
 140  000f 7b01          	ld	a,(OFST+1,sp)
 143  0011 5b01          	addw	sp,#1
 144  0013 81            	ret
 180                     ; 37 char getchar (void) //funkce cte(prij�m� data) vstup z UART
 180                     ; 38 {
 181                     	switch	.text
 182  0014               _getchar:
 184  0014 89            	pushw	x
 185       00000002      OFST:	set	2
 188                     ; 39   int c = 0;
 191  0015               L111:
 192                     ; 41   while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 194  0015 ae0020        	ldw	x,#32
 195  0018 cd0000        	call	_UART1_GetFlagStatus
 197  001b 4d            	tnz	a
 198  001c 27f7          	jreq	L111
 199                     ; 42 	c = UART1_ReceiveData8();
 201  001e cd0000        	call	_UART1_ReceiveData8
 203  0021 5f            	clrw	x
 204  0022 97            	ld	xl,a
 205  0023 1f01          	ldw	(OFST-1,sp),x
 207                     ; 43   return (c);
 209  0025 7b02          	ld	a,(OFST+0,sp)
 212  0027 85            	popw	x
 213  0028 81            	ret
 238                     ; 48 void init_uart1(void)
 238                     ; 49 {
 239                     	switch	.text
 240  0029               _init_uart1:
 244                     ; 50     UART1_DeInit();         // smazat starou konfiguraci
 246  0029 cd0000        	call	_UART1_DeInit
 248                     ; 51 		UART1_Init((uint32_t)115200, //Nova konfigurace
 248                     ; 52 									UART1_WORDLENGTH_8D, 
 248                     ; 53 									UART1_STOPBITS_1, 
 248                     ; 54 									UART1_PARITY_NO,
 248                     ; 55 									UART1_SYNCMODE_CLOCK_DISABLE, 
 248                     ; 56 									UART1_MODE_TXRX_ENABLE);
 250  002c 4b0c          	push	#12
 251  002e 4b80          	push	#128
 252  0030 4b00          	push	#0
 253  0032 4b00          	push	#0
 254  0034 4b00          	push	#0
 255  0036 aec200        	ldw	x,#49664
 256  0039 89            	pushw	x
 257  003a ae0001        	ldw	x,#1
 258  003d 89            	pushw	x
 259  003e cd0000        	call	_UART1_Init
 261  0041 5b09          	addw	sp,#9
 262                     ; 57 }
 265  0043 81            	ret
 295                     ; 60 void setup(void)
 295                     ; 61 {
 296                     	switch	.text
 297  0044               _setup:
 301                     ; 62     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);      // taktovat MCU na 16MHz
 303  0044 4f            	clr	a
 304  0045 cd0000        	call	_CLK_HSIPrescalerConfig
 306                     ; 64     init_milis(); //Rozbehnuti casovace milis
 308  0048 cd0000        	call	_init_milis
 310                     ; 65     init_uart1(); //Povoleni komunikace s PC
 312  004b addc          	call	_init_uart1
 314                     ; 67 		GPIO_Init(BTN_PORT, BTN_PIN,GPIO_MODE_IN_FL_NO_IT); // Tlacitko jako vstup (vynulovani)
 316  004d 4b00          	push	#0
 317  004f 4b10          	push	#16
 318  0051 ae5014        	ldw	x,#20500
 319  0054 cd0000        	call	_GPIO_Init
 321  0057 85            	popw	x
 322                     ; 70     GPIO_Init(TRGG_PORT, TRGG_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
 324  0058 4bc0          	push	#192
 325  005a 4b80          	push	#128
 326  005c ae500a        	ldw	x,#20490
 327  005f cd0000        	call	_GPIO_Init
 329  0062 85            	popw	x
 330                     ; 73     GPIO_Init(TI1_PORT, TI1_PIN, GPIO_MODE_IN_FL_NO_IT);  // kan�l 1 jako vstup
 332  0063 4b00          	push	#0
 333  0065 4b10          	push	#16
 334  0067 ae500f        	ldw	x,#20495
 335  006a cd0000        	call	_GPIO_Init
 337  006d 85            	popw	x
 338                     ; 75     TIM2_TimeBaseInit(TIM2_PRESCALER_16, 0xFFFF );
 340  006e aeffff        	ldw	x,#65535
 341  0071 89            	pushw	x
 342  0072 a604          	ld	a,#4
 343  0074 cd0000        	call	_TIM2_TimeBaseInit
 345  0077 85            	popw	x
 346                     ; 77     TIM2_Cmd(ENABLE);
 348  0078 a601          	ld	a,#1
 349  007a cd0000        	call	_TIM2_Cmd
 351                     ; 78     TIM2_ICInit(TIM2_CHANNEL_1,        // nastavuji CH1 (CaptureRegistr1)
 351                     ; 79             TIM2_ICPOLARITY_RISING,    // n�be�n� hrana
 351                     ; 80             TIM2_ICSELECTION_DIRECTTI, // CaptureRegistr1 bude ovl�d�n z CH1
 351                     ; 81             TIM2_ICPSC_DIV1,           // delicka je vypnut�
 351                     ; 82             0                          // vstupn� filter je vypnut�
 351                     ; 83         );            
 353  007d 4b00          	push	#0
 354  007f 4b00          	push	#0
 355  0081 4b01          	push	#1
 356  0083 5f            	clrw	x
 357  0084 cd0000        	call	_TIM2_ICInit
 359  0087 5b03          	addw	sp,#3
 360                     ; 84     TIM2_ICInit(TIM2_CHANNEL_2,        // nastavuji CH2 (CaptureRegistr2)
 360                     ; 85             TIM2_ICPOLARITY_FALLING,   // sestupn� hrana
 360                     ; 86             TIM2_ICSELECTION_INDIRECTTI, // CaptureRegistr2 bude ovl�d�n z CH1
 360                     ; 87             TIM2_ICPSC_DIV1,           // delicka je vypnut�
 360                     ; 88             0                          // vstupn� filter je vypnut�
 360                     ; 89         );            
 362  0089 4b00          	push	#0
 363  008b 4b00          	push	#0
 364  008d 4b02          	push	#2
 365  008f ae0144        	ldw	x,#324
 366  0092 cd0000        	call	_TIM2_ICInit
 368  0095 5b03          	addw	sp,#3
 369                     ; 90 }
 372  0097 81            	ret
 495                     .const:	section	.text
 496  0000               L02:
 497  0000 000001bd      	dc.l	445
 498  0004               L22:
 499  0004 00000002      	dc.l	2
 500  0008               L42:
 501  0008 00000154      	dc.l	340
 502  000c               L62:
 503  000c 00004e20      	dc.l	20000
 504  0010               L03:
 505  0010 00000191      	dc.l	401
 506                     ; 100 void main(void)
 506                     ; 101 {
 507                     	switch	.text
 508  0098               _main:
 510  0098 522f          	subw	sp,#47
 511       0000002f      OFST:	set	47
 514                     ; 102 		uint32_t pocet_mereni = 0;
 516  009a ae0000        	ldw	x,#0
 517  009d 1f25          	ldw	(OFST-10,sp),x
 518  009f ae0000        	ldw	x,#0
 519  00a2 1f23          	ldw	(OFST-12,sp),x
 521                     ; 103     uint32_t mtime_ultrasonic = 0;
 523  00a4 ae0000        	ldw	x,#0
 524  00a7 1f29          	ldw	(OFST-6,sp),x
 525  00a9 ae0000        	ldw	x,#0
 526  00ac 1f27          	ldw	(OFST-8,sp),x
 528                     ; 105     STATE_TypeDef state = TRGG_START;
 530  00ae 0f2b          	clr	(OFST-4,sp)
 532                     ; 110     setup();
 534  00b0 ad92          	call	_setup
 536                     ; 111     printf("Start programu\r\n"); //Uvitaci hlaska
 538  00b2 ae005f        	ldw	x,#L122
 539  00b5 cd0000        	call	_printf
 541                     ; 113 		lcd_init(); //Inicializace lcd displeje
 543  00b8 cd0000        	call	_lcd_init
 545                     ; 114     lcd_gotoxy(0,0);
 547  00bb 5f            	clrw	x
 548  00bc cd0000        	call	_lcd_gotoxy
 550                     ; 115     lcd_puts("Start programu"); //Uvitaci hlaska
 552  00bf ae0050        	ldw	x,#L322
 553  00c2 cd0000        	call	_lcd_puts
 555  00c5               L522:
 556                     ; 119         switch (state) { //Stav snimace
 558  00c5 7b2b          	ld	a,(OFST-4,sp)
 560                     ; 165         default:
 560                     ; 166             state = TRGG_START;
 561  00c7 4d            	tnz	a
 562  00c8 270e          	jreq	L531
 563  00ca 4a            	dec	a
 564  00cb 2741          	jreq	L731
 565  00cd 4a            	dec	a
 566  00ce 2602          	jrne	L43
 567  00d0 207d          	jp	L141
 568  00d2               L43:
 569  00d2               L341:
 572  00d2 0f2b          	clr	(OFST-4,sp)
 574  00d4 ac030203      	jpf	L332
 575  00d8               L531:
 576                     ; 120         case TRGG_START:
 576                     ; 121             if (milis() - mtime_ultrasonic > MASURMENT_PERON) {
 578  00d8 cd0000        	call	_milis
 580  00db cd0000        	call	c_uitolx
 582  00de 96            	ldw	x,sp
 583  00df 1c0027        	addw	x,#OFST-8
 584  00e2 cd0000        	call	c_lsub
 586  00e5 ae0000        	ldw	x,#L02
 587  00e8 cd0000        	call	c_lcmp
 589  00eb 2403          	jruge	L63
 590  00ed cc0203        	jp	L332
 591  00f0               L63:
 592                     ; 122                 mtime_ultrasonic = milis();
 594  00f0 cd0000        	call	_milis
 596  00f3 cd0000        	call	c_uitolx
 598  00f6 96            	ldw	x,sp
 599  00f7 1c0027        	addw	x,#OFST-8
 600  00fa cd0000        	call	c_rtol
 603                     ; 123                 TRGG_ON;
 605  00fd 4b80          	push	#128
 606  00ff ae500a        	ldw	x,#20490
 607  0102 cd0000        	call	_GPIO_WriteHigh
 609  0105 84            	pop	a
 610                     ; 124                 state = TRGG_WAIT;
 613  0106 a601          	ld	a,#1
 614  0108 6b2b          	ld	(OFST-4,sp),a
 616  010a ac030203      	jpf	L332
 617  010e               L731:
 618                     ; 127         case TRGG_WAIT:
 618                     ; 128             if (milis() - mtime_ultrasonic > 1) {
 620  010e cd0000        	call	_milis
 622  0111 cd0000        	call	c_uitolx
 624  0114 96            	ldw	x,sp
 625  0115 1c0027        	addw	x,#OFST-8
 626  0118 cd0000        	call	c_lsub
 628  011b ae0004        	ldw	x,#L22
 629  011e cd0000        	call	c_lcmp
 631  0121 2403          	jruge	L04
 632  0123 cc0203        	jp	L332
 633  0126               L04:
 634                     ; 129                 TRGG_OFF;
 636  0126 4b80          	push	#128
 637  0128 ae500a        	ldw	x,#20490
 638  012b cd0000        	call	_GPIO_WriteLow
 640  012e 84            	pop	a
 641                     ; 131                 TIM2_ClearFlag(TIM2_FLAG_CC1);
 644  012f ae0002        	ldw	x,#2
 645  0132 cd0000        	call	_TIM2_ClearFlag
 647                     ; 132                 TIM2_ClearFlag(TIM2_FLAG_CC2); 
 649  0135 ae0004        	ldw	x,#4
 650  0138 cd0000        	call	_TIM2_ClearFlag
 652                     ; 133                 TIM2_ClearFlag(TIM2_FLAG_CC1OF); 
 654  013b ae0200        	ldw	x,#512
 655  013e cd0000        	call	_TIM2_ClearFlag
 657                     ; 134                 TIM2_ClearFlag(TIM2_FLAG_CC2OF); 
 659  0141 ae0400        	ldw	x,#1024
 660  0144 cd0000        	call	_TIM2_ClearFlag
 662                     ; 135                 state = MEASURMENT_WAIT;
 664  0147 a602          	ld	a,#2
 665  0149 6b2b          	ld	(OFST-4,sp),a
 667  014b ac030203      	jpf	L332
 668  014f               L141:
 669                     ; 138         case MEASURMENT_WAIT:
 669                     ; 139              /* detekuji sestupnou hranu ECHO sign�lu; vzestupnou hranu 
 669                     ; 140               * detekovat nemus�m, zachycen� CC1 i CC2 probehne automaticky  */
 669                     ; 141             if (TIM2_GetFlagStatus(TIM2_FLAG_CC2) == RESET) {
 671  014f ae0004        	ldw	x,#4
 672  0152 cd0000        	call	_TIM2_GetFlagStatus
 674  0155 4d            	tnz	a
 675  0156 2703          	jreq	L24
 676  0158 cc0203        	jp	L332
 677  015b               L24:
 678                     ; 142                 TIM2_ClearFlag(TIM2_FLAG_CC1);  // sma�u vlajku CC1
 680  015b ae0002        	ldw	x,#2
 681  015e cd0000        	call	_TIM2_ClearFlag
 683                     ; 143                 TIM2_ClearFlag(TIM2_FLAG_CC2);  // sma�u vlajku CC2
 685  0161 ae0004        	ldw	x,#4
 686  0164 cd0000        	call	_TIM2_ClearFlag
 688                     ; 146                 vzdalenost = (TIM2_GetCapture2() - TIM2_GetCapture1()); 
 690  0167 cd0000        	call	_TIM2_GetCapture1
 692  016a 1f01          	ldw	(OFST-46,sp),x
 694  016c cd0000        	call	_TIM2_GetCapture2
 696  016f 72f001        	subw	x,(OFST-46,sp)
 697  0172 cd0000        	call	c_uitolx
 699  0175 96            	ldw	x,sp
 700  0176 1c002c        	addw	x,#OFST-3
 701  0179 cd0000        	call	c_rtol
 704                     ; 149                 vzdalenost = (vzdalenost * 340)/ 20000; // FixPoint prepocet na cm -- zaokrouhluje v�dy dolu
 706  017c 96            	ldw	x,sp
 707  017d 1c002c        	addw	x,#OFST-3
 708  0180 cd0000        	call	c_ltor
 710  0183 ae0008        	ldw	x,#L42
 711  0186 cd0000        	call	c_lmul
 713  0189 ae000c        	ldw	x,#L62
 714  018c cd0000        	call	c_ludv
 716  018f 96            	ldw	x,sp
 717  0190 1c002c        	addw	x,#OFST-3
 718  0193 cd0000        	call	c_rtol
 721                     ; 150                 if (vzdalenost <= MAXIMALNI_VZDALENOST) {
 723  0196 96            	ldw	x,sp
 724  0197 1c002c        	addw	x,#OFST-3
 725  019a cd0000        	call	c_ltor
 727  019d ae0010        	ldw	x,#L03
 728  01a0 cd0000        	call	c_lcmp
 730  01a3 242c          	jruge	L342
 731                     ; 151                   printf("Vzdalenost: %lu cm\r\n", vzdalenost);
 733  01a5 1e2e          	ldw	x,(OFST-1,sp)
 734  01a7 89            	pushw	x
 735  01a8 1e2e          	ldw	x,(OFST-1,sp)
 736  01aa 89            	pushw	x
 737  01ab ae003b        	ldw	x,#L542
 738  01ae cd0000        	call	_printf
 740  01b1 5b04          	addw	sp,#4
 741                     ; 152                   sprintf(text, "Vzdalenost:%lu cm", vzdalenost);
 743  01b3 1e2e          	ldw	x,(OFST-1,sp)
 744  01b5 89            	pushw	x
 745  01b6 1e2e          	ldw	x,(OFST-1,sp)
 746  01b8 89            	pushw	x
 747  01b9 ae0029        	ldw	x,#L742
 748  01bc 89            	pushw	x
 749  01bd 96            	ldw	x,sp
 750  01be 1c0009        	addw	x,#OFST-38
 751  01c1 cd0000        	call	_sprintf
 753  01c4 5b06          	addw	sp,#6
 754                     ; 153                   lcd_gotoxy(0,0);
 756  01c6 5f            	clrw	x
 757  01c7 cd0000        	call	_lcd_gotoxy
 759                     ; 154                   lcd_puts(text);
 761  01ca 96            	ldw	x,sp
 762  01cb 1c0003        	addw	x,#OFST-44
 763  01ce cd0000        	call	_lcd_puts
 765  01d1               L342:
 766                     ; 158 								sprintf(mereni_text, "Zmereno:%lu", pocet_mereni++);
 768  01d1 96            	ldw	x,sp
 769  01d2 1c0023        	addw	x,#OFST-12
 770  01d5 cd0000        	call	c_ltor
 772  01d8 96            	ldw	x,sp
 773  01d9 1c0023        	addw	x,#OFST-12
 774  01dc a601          	ld	a,#1
 775  01de cd0000        	call	c_lgadc
 778  01e1 be02          	ldw	x,c_lreg+2
 779  01e3 89            	pushw	x
 780  01e4 be00          	ldw	x,c_lreg
 781  01e6 89            	pushw	x
 782  01e7 ae001d        	ldw	x,#L152
 783  01ea 89            	pushw	x
 784  01eb 96            	ldw	x,sp
 785  01ec 1c0019        	addw	x,#OFST-22
 786  01ef cd0000        	call	_sprintf
 788  01f2 5b06          	addw	sp,#6
 789                     ; 159 								lcd_gotoxy(0,1);
 791  01f4 ae0001        	ldw	x,#1
 792  01f7 cd0000        	call	_lcd_gotoxy
 794                     ; 160 								lcd_puts(mereni_text);
 796  01fa 96            	ldw	x,sp
 797  01fb 1c0013        	addw	x,#OFST-28
 798  01fe cd0000        	call	_lcd_puts
 800                     ; 162                 state = TRGG_START;
 802  0201 0f2b          	clr	(OFST-4,sp)
 804  0203               L332:
 805                     ; 169 				if (BTN_PUSH) { //Pokud je stisknuto talcitko - vynulovat pokusy a napsat nulu
 807  0203 4b10          	push	#16
 808  0205 ae5014        	ldw	x,#20500
 809  0208 cd0000        	call	_GPIO_ReadInputPin
 811  020b 5b01          	addw	sp,#1
 812  020d 4d            	tnz	a
 813  020e 2703          	jreq	L44
 814  0210 cc00c5        	jp	L522
 815  0213               L44:
 816                     ; 170 					pocet_mereni = 0;
 818  0213 ae0000        	ldw	x,#0
 819  0216 1f25          	ldw	(OFST-10,sp),x
 820  0218 ae0000        	ldw	x,#0
 821  021b 1f23          	ldw	(OFST-12,sp),x
 823                     ; 171 					lcd_gotoxy(8,1);
 825  021d ae0801        	ldw	x,#2049
 826  0220 cd0000        	call	_lcd_gotoxy
 828                     ; 172 					lcd_puts("0       ");
 830  0223 ae0014        	ldw	x,#L552
 831  0226 cd0000        	call	_lcd_puts
 833  0229 acc500c5      	jpf	L522
 846                     	xdef	_main
 847                     	xdef	_setup
 848                     	xdef	_init_uart1
 849                     	xref	_lcd_puts
 850                     	xref	_lcd_gotoxy
 851                     	xref	_lcd_init
 852                     	xref	_sprintf
 853                     	xdef	_putchar
 854                     	xref	_printf
 855                     	xdef	_getchar
 856                     	xref	_init_milis
 857                     	xref	_milis
 858                     	xdef	_assert_failed
 859                     	xref	_UART1_GetFlagStatus
 860                     	xref	_UART1_SendData8
 861                     	xref	_UART1_ReceiveData8
 862                     	xref	_UART1_Init
 863                     	xref	_UART1_DeInit
 864                     	xref	_TIM2_ClearFlag
 865                     	xref	_TIM2_GetFlagStatus
 866                     	xref	_TIM2_GetCapture2
 867                     	xref	_TIM2_GetCapture1
 868                     	xref	_TIM2_Cmd
 869                     	xref	_TIM2_ICInit
 870                     	xref	_TIM2_TimeBaseInit
 871                     	xref	_GPIO_ReadInputPin
 872                     	xref	_GPIO_WriteLow
 873                     	xref	_GPIO_WriteHigh
 874                     	xref	_GPIO_Init
 875                     	xref	_CLK_HSIPrescalerConfig
 876                     	switch	.const
 877  0014               L552:
 878  0014 302020202020  	dc.b	"0       ",0
 879  001d               L152:
 880  001d 5a6d6572656e  	dc.b	"Zmereno:%lu",0
 881  0029               L742:
 882  0029 567a64616c65  	dc.b	"Vzdalenost:%lu cm",0
 883  003b               L542:
 884  003b 567a64616c65  	dc.b	"Vzdalenost: %lu cm"
 885  004d 0d0a00        	dc.b	13,10,0
 886  0050               L322:
 887  0050 537461727420  	dc.b	"Start programu",0
 888  005f               L122:
 889  005f 537461727420  	dc.b	"Start programu",13
 890  006e 0a00          	dc.b	10,0
 891                     	xref.b	c_lreg
 892                     	xref.b	c_x
 912                     	xref	c_lgadc
 913                     	xref	c_ludv
 914                     	xref	c_lmul
 915                     	xref	c_ltor
 916                     	xref	c_rtol
 917                     	xref	c_lcmp
 918                     	xref	c_lsub
 919                     	xref	c_uitolx
 920                     	end
