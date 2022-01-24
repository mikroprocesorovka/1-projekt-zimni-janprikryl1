   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  15                     	bsct
  16  0000               __Id:
  17  0000 00000000      	dc.l	0
  18  0004               __IDE:
  19  0004 00            	dc.b	0
  20  0005               __RTR:
  21  0005 00            	dc.b	0
  22  0006               __DLC:
  23  0006 00            	dc.b	0
  24  0007               __Data:
  25  0007 00            	dc.b	0
  26  0008 000000000000  	ds.b	7
  27  000f               __FMI:
  28  000f 00            	dc.b	0
  58                     ; 62 void CAN_DeInit(void)
  58                     ; 63 {
  60                     	switch	.text
  61  0000               _CAN_DeInit:
  65                     ; 65   CAN->MCR = CAN_MCR_INRQ;
  67  0000 35015420      	mov	21536,#1
  68                     ; 66   CAN->PSR = CAN_Page_Config;
  70  0004 35065427      	mov	21543,#6
  71                     ; 67   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  73  0008 4f            	clr	a
  74  0009 cd0b6c        	call	_CAN_OperatingModeRequest
  76                     ; 68   CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  78  000c 725f5428      	clr	21544
  79                     ; 69   CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  81  0010 725f5429      	clr	21545
  82                     ; 70   CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  84  0014 3540542c      	mov	21548,#64
  85                     ; 71   CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  87  0018 3523542d      	mov	21549,#35
  88                     ; 72   CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  90  001c 725f5430      	clr	21552
  91                     ; 73   CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  93  0020 725f5431      	clr	21553
  94                     ; 74   CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  96  0024 725f5432      	clr	21554
  97                     ; 75   CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  99  0028 725f5433      	clr	21555
 100                     ; 76   CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 102  002c 725f5434      	clr	21556
 103                     ; 77   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 105  0030 a601          	ld	a,#1
 106  0032 cd0b6c        	call	_CAN_OperatingModeRequest
 108                     ; 78   CAN->PSR = CAN_Page_RxFifo;
 110  0035 35075427      	mov	21543,#7
 111                     ; 79   CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 113  0039 725f5429      	clr	21545
 114                     ; 80   CAN->PSR = CAN_Page_TxMailBox0;
 116  003d 725f5427      	clr	21543
 117                     ; 81   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 119  0041 725f5429      	clr	21545
 120                     ; 82   CAN->PSR = CAN_Page_TxMailBox1;
 122  0045 35015427      	mov	21543,#1
 123                     ; 83   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 125  0049 725f5429      	clr	21545
 126                     ; 84   CAN->PSR = CAN_Page_TxMailBox2;
 128  004d 35055427      	mov	21543,#5
 129                     ; 85   CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 131  0051 725f5429      	clr	21545
 132                     ; 87   CAN->MCR = CAN_MCR_RESET_VALUE;
 134  0055 35025420      	mov	21536,#2
 135                     ; 88   CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 137  0059 35fd5421      	mov	21537,#253
 138                     ; 89   CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 140  005d 35ff5422      	mov	21538,#255
 141                     ; 90   CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 143  0061 35ff5424      	mov	21540,#255
 144                     ; 91   CAN->IER = CAN_IER_RESET_VALUE;
 146  0065 725f5425      	clr	21541
 147                     ; 92   CAN->DGR = CAN_DGR_RESET_VALUE;
 149  0069 350c5426      	mov	21542,#12
 150                     ; 93   CAN->PSR = CAN_PSR_RESET_VALUE;
 152  006d 725f5427      	clr	21543
 153                     ; 94 }
 156  0071 81            	ret
 707                     ; 106 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 707                     ; 107                                 CAN_Mode_TypeDef CAN_Mode,
 707                     ; 108                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 707                     ; 109                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 707                     ; 110                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 707                     ; 111                                 uint8_t CAN_Prescaler)
 707                     ; 112 {
 708                     	switch	.text
 709  0072               _CAN_Init:
 711  0072 89            	pushw	x
 712  0073 5204          	subw	sp,#4
 713       00000004      OFST:	set	4
 716                     ; 113   CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 718                     ; 114   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 720  0075 aeffff        	ldw	x,#65535
 721  0078 1f03          	ldw	(OFST-1,sp),x
 723                     ; 115   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 725  007a cd1069        	call	_CAN_GetSelectedPage
 727  007d 6b01          	ld	(OFST-3,sp),a
 729                     ; 119   assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 731  007f 0d05          	tnz	(OFST+1,sp)
 732  0081 270c          	jreq	L21
 733  0083 7b05          	ld	a,(OFST+1,sp)
 734  0085 a1fd          	cp	a,#253
 735  0087 2409          	jruge	L01
 736  0089 7b05          	ld	a,(OFST+1,sp)
 737  008b a104          	cp	a,#4
 738  008d 2503          	jrult	L01
 739  008f               L21:
 740  008f 4f            	clr	a
 741  0090 2010          	jra	L41
 742  0092               L01:
 743  0092 ae0077        	ldw	x,#119
 744  0095 89            	pushw	x
 745  0096 ae0000        	ldw	x,#0
 746  0099 89            	pushw	x
 747  009a ae0008        	ldw	x,#L103
 748  009d cd0000        	call	_assert_failed
 750  00a0 5b04          	addw	sp,#4
 751  00a2               L41:
 752                     ; 120   assert_param(IS_CAN_MODE_OK(CAN_Mode));
 754  00a2 0d06          	tnz	(OFST+2,sp)
 755  00a4 2712          	jreq	L02
 756  00a6 7b06          	ld	a,(OFST+2,sp)
 757  00a8 a101          	cp	a,#1
 758  00aa 270c          	jreq	L02
 759  00ac 7b06          	ld	a,(OFST+2,sp)
 760  00ae a102          	cp	a,#2
 761  00b0 2706          	jreq	L02
 762  00b2 7b06          	ld	a,(OFST+2,sp)
 763  00b4 a103          	cp	a,#3
 764  00b6 2603          	jrne	L61
 765  00b8               L02:
 766  00b8 4f            	clr	a
 767  00b9 2010          	jra	L22
 768  00bb               L61:
 769  00bb ae0078        	ldw	x,#120
 770  00be 89            	pushw	x
 771  00bf ae0000        	ldw	x,#0
 772  00c2 89            	pushw	x
 773  00c3 ae0008        	ldw	x,#L103
 774  00c6 cd0000        	call	_assert_failed
 776  00c9 5b04          	addw	sp,#4
 777  00cb               L22:
 778                     ; 121   assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 780  00cb 0d09          	tnz	(OFST+5,sp)
 781  00cd 2712          	jreq	L62
 782  00cf 7b09          	ld	a,(OFST+5,sp)
 783  00d1 a140          	cp	a,#64
 784  00d3 270c          	jreq	L62
 785  00d5 7b09          	ld	a,(OFST+5,sp)
 786  00d7 a180          	cp	a,#128
 787  00d9 2706          	jreq	L62
 788  00db 7b09          	ld	a,(OFST+5,sp)
 789  00dd a1c0          	cp	a,#192
 790  00df 2603          	jrne	L42
 791  00e1               L62:
 792  00e1 4f            	clr	a
 793  00e2 2010          	jra	L03
 794  00e4               L42:
 795  00e4 ae0079        	ldw	x,#121
 796  00e7 89            	pushw	x
 797  00e8 ae0000        	ldw	x,#0
 798  00eb 89            	pushw	x
 799  00ec ae0008        	ldw	x,#L103
 800  00ef cd0000        	call	_assert_failed
 802  00f2 5b04          	addw	sp,#4
 803  00f4               L03:
 804                     ; 122   assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 806  00f4 7b0a          	ld	a,(OFST+6,sp)
 807  00f6 a110          	cp	a,#16
 808  00f8 2403          	jruge	L23
 809  00fa 4f            	clr	a
 810  00fb 2010          	jra	L43
 811  00fd               L23:
 812  00fd ae007a        	ldw	x,#122
 813  0100 89            	pushw	x
 814  0101 ae0000        	ldw	x,#0
 815  0104 89            	pushw	x
 816  0105 ae0008        	ldw	x,#L103
 817  0108 cd0000        	call	_assert_failed
 819  010b 5b04          	addw	sp,#4
 820  010d               L43:
 821                     ; 123   assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 823  010d 7b0b          	ld	a,(OFST+7,sp)
 824  010f a110          	cp	a,#16
 825  0111 2506          	jrult	L24
 826  0113 7b0b          	ld	a,(OFST+7,sp)
 827  0115 a171          	cp	a,#113
 828  0117 2504          	jrult	L04
 829  0119               L24:
 830  0119 0d0b          	tnz	(OFST+7,sp)
 831  011b 2603          	jrne	L63
 832  011d               L04:
 833  011d 4f            	clr	a
 834  011e 2010          	jra	L44
 835  0120               L63:
 836  0120 ae007b        	ldw	x,#123
 837  0123 89            	pushw	x
 838  0124 ae0000        	ldw	x,#0
 839  0127 89            	pushw	x
 840  0128 ae0008        	ldw	x,#L103
 841  012b cd0000        	call	_assert_failed
 843  012e 5b04          	addw	sp,#4
 844  0130               L44:
 845                     ; 124   assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 847  0130 0d0c          	tnz	(OFST+8,sp)
 848  0132 2709          	jreq	L64
 849  0134 7b0c          	ld	a,(OFST+8,sp)
 850  0136 a141          	cp	a,#65
 851  0138 2403          	jruge	L64
 852  013a 4f            	clr	a
 853  013b 2010          	jra	L05
 854  013d               L64:
 855  013d ae007c        	ldw	x,#124
 856  0140 89            	pushw	x
 857  0141 ae0000        	ldw	x,#0
 858  0144 89            	pushw	x
 859  0145 ae0008        	ldw	x,#L103
 860  0148 cd0000        	call	_assert_failed
 862  014b 5b04          	addw	sp,#4
 863  014d               L05:
 864                     ; 127   CAN->MCR = CAN_MCR_INRQ;
 866  014d 35015420      	mov	21536,#1
 868  0151 2007          	jra	L703
 869  0153               L303:
 870                     ; 131     timeout--;
 872  0153 1e03          	ldw	x,(OFST-1,sp)
 873  0155 1d0001        	subw	x,#1
 874  0158 1f03          	ldw	(OFST-1,sp),x
 876  015a               L703:
 877                     ; 129   while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 879  015a c65421        	ld	a,21537
 880  015d a401          	and	a,#1
 881  015f a101          	cp	a,#1
 882  0161 2704          	jreq	L313
 884  0163 1e03          	ldw	x,(OFST-1,sp)
 885  0165 26ec          	jrne	L303
 886  0167               L313:
 887                     ; 135   if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 889  0167 c65421        	ld	a,21537
 890  016a a401          	and	a,#1
 891  016c a101          	cp	a,#1
 892  016e 270c          	jreq	L513
 893                     ; 138     InitStatus =  CAN_InitStatus_Failed;
 895  0170 0f02          	clr	(OFST-2,sp)
 898  0172               L713:
 899                     ; 172   CAN_SelectPage(can_page);
 901  0172 7b01          	ld	a,(OFST-3,sp)
 902  0174 cd106d        	call	_CAN_SelectPage
 904                     ; 175   return (CAN_InitStatus_TypeDef)InitStatus;
 906  0177 7b02          	ld	a,(OFST-2,sp)
 909  0179 5b06          	addw	sp,#6
 910  017b 81            	ret
 911  017c               L513:
 912                     ; 145     CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 914  017c c65420        	ld	a,21536
 915  017f 1a05          	or	a,(OFST+1,sp)
 916  0181 c75420        	ld	21536,a
 917                     ; 148     CAN->DGR |= (uint8_t)CAN_Mode ;
 919  0184 c65426        	ld	a,21542
 920  0187 1a06          	or	a,(OFST+2,sp)
 921  0189 c75426        	ld	21542,a
 922                     ; 149     CAN->PSR = CAN_Page_Config;
 924  018c 35065427      	mov	21543,#6
 925                     ; 150     CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 927  0190 7b0c          	ld	a,(OFST+8,sp)
 928  0192 4a            	dec	a
 929  0193 1a09          	or	a,(OFST+5,sp)
 930  0195 c7542c        	ld	21548,a
 931                     ; 151     CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 933  0198 7b0a          	ld	a,(OFST+6,sp)
 934  019a 1a0b          	or	a,(OFST+7,sp)
 935  019c c7542d        	ld	21549,a
 936                     ; 154     CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 938  019f 72115420      	bres	21536,#0
 939                     ; 156     timeout = 0xFFFF;
 941  01a3 aeffff        	ldw	x,#65535
 942  01a6 1f03          	ldw	(OFST-1,sp),x
 945  01a8 2007          	jra	L523
 946  01aa               L123:
 947                     ; 159       timeout--;
 949  01aa 1e03          	ldw	x,(OFST-1,sp)
 950  01ac 1d0001        	subw	x,#1
 951  01af 1f03          	ldw	(OFST-1,sp),x
 953  01b1               L523:
 954                     ; 157     while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 954                     ; 158     {
 954                     ; 159       timeout--;
 956  01b1 c65421        	ld	a,21537
 957  01b4 a401          	and	a,#1
 958  01b6 a101          	cp	a,#1
 959  01b8 2604          	jrne	L133
 961  01ba 1e03          	ldw	x,(OFST-1,sp)
 962  01bc 26ec          	jrne	L123
 963  01be               L133:
 964                     ; 162     if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 966  01be c65421        	ld	a,21537
 967  01c1 a401          	and	a,#1
 968  01c3 a101          	cp	a,#1
 969  01c5 2604          	jrne	L333
 970                     ; 164       InitStatus = CAN_InitStatus_Failed;
 972  01c7 0f02          	clr	(OFST-2,sp)
 975  01c9 20a7          	jra	L713
 976  01cb               L333:
 977                     ; 168       InitStatus = CAN_InitStatus_Success;
 979  01cb a601          	ld	a,#1
 980  01cd 6b02          	ld	(OFST-2,sp),a
 982  01cf 20a1          	jra	L713
1315                     ; 194 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1315                     ; 195                     FunctionalState CAN_FilterActivation,
1315                     ; 196                     CAN_FilterMode_TypeDef CAN_FilterMode,
1315                     ; 197                     CAN_FilterScale_TypeDef CAN_FilterScale,
1315                     ; 198                     uint8_t CAN_FilterID1,
1315                     ; 199                     uint8_t CAN_FilterID2,
1315                     ; 200                     uint8_t CAN_FilterID3,
1315                     ; 201                     uint8_t CAN_FilterID4,
1315                     ; 202                     uint8_t CAN_FilterIDMask1,
1315                     ; 203                     uint8_t CAN_FilterIDMask2,
1315                     ; 204                     uint8_t CAN_FilterIDMask3,
1315                     ; 205                     uint8_t CAN_FilterIDMask4)
1315                     ; 206 {
1316                     	switch	.text
1317  01d1               _CAN_FilterInit:
1319  01d1 89            	pushw	x
1320  01d2 5205          	subw	sp,#5
1321       00000005      OFST:	set	5
1324                     ; 207   uint8_t fact = 0;
1326                     ; 208   uint8_t fsc  = 0;
1328                     ; 209   uint8_t fmhl = 0;
1330                     ; 211   CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1332                     ; 212   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1334  01d4 cd1069        	call	_CAN_GetSelectedPage
1336  01d7 6b01          	ld	(OFST-4,sp),a
1338                     ; 215   assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1340  01d9 0d06          	tnz	(OFST+1,sp)
1341  01db 271e          	jreq	L65
1342  01dd 7b06          	ld	a,(OFST+1,sp)
1343  01df a101          	cp	a,#1
1344  01e1 2718          	jreq	L65
1345  01e3 7b06          	ld	a,(OFST+1,sp)
1346  01e5 a102          	cp	a,#2
1347  01e7 2712          	jreq	L65
1348  01e9 7b06          	ld	a,(OFST+1,sp)
1349  01eb a103          	cp	a,#3
1350  01ed 270c          	jreq	L65
1351  01ef 7b06          	ld	a,(OFST+1,sp)
1352  01f1 a104          	cp	a,#4
1353  01f3 2706          	jreq	L65
1354  01f5 7b06          	ld	a,(OFST+1,sp)
1355  01f7 a105          	cp	a,#5
1356  01f9 2603          	jrne	L45
1357  01fb               L65:
1358  01fb 4f            	clr	a
1359  01fc 2010          	jra	L06
1360  01fe               L45:
1361  01fe ae00d7        	ldw	x,#215
1362  0201 89            	pushw	x
1363  0202 ae0000        	ldw	x,#0
1364  0205 89            	pushw	x
1365  0206 ae0008        	ldw	x,#L103
1366  0209 cd0000        	call	_assert_failed
1368  020c 5b04          	addw	sp,#4
1369  020e               L06:
1370                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1372  020e 0d07          	tnz	(OFST+2,sp)
1373  0210 2706          	jreq	L46
1374  0212 7b07          	ld	a,(OFST+2,sp)
1375  0214 a101          	cp	a,#1
1376  0216 2603          	jrne	L26
1377  0218               L46:
1378  0218 4f            	clr	a
1379  0219 2010          	jra	L66
1380  021b               L26:
1381  021b ae00d8        	ldw	x,#216
1382  021e 89            	pushw	x
1383  021f ae0000        	ldw	x,#0
1384  0222 89            	pushw	x
1385  0223 ae0008        	ldw	x,#L103
1386  0226 cd0000        	call	_assert_failed
1388  0229 5b04          	addw	sp,#4
1389  022b               L66:
1390                     ; 217   assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1392  022b 0d0a          	tnz	(OFST+5,sp)
1393  022d 2712          	jreq	L27
1394  022f 7b0a          	ld	a,(OFST+5,sp)
1395  0231 a110          	cp	a,#16
1396  0233 270c          	jreq	L27
1397  0235 7b0a          	ld	a,(OFST+5,sp)
1398  0237 a111          	cp	a,#17
1399  0239 2706          	jreq	L27
1400  023b 7b0a          	ld	a,(OFST+5,sp)
1401  023d a101          	cp	a,#1
1402  023f 2603          	jrne	L07
1403  0241               L27:
1404  0241 4f            	clr	a
1405  0242 2010          	jra	L47
1406  0244               L07:
1407  0244 ae00d9        	ldw	x,#217
1408  0247 89            	pushw	x
1409  0248 ae0000        	ldw	x,#0
1410  024b 89            	pushw	x
1411  024c ae0008        	ldw	x,#L103
1412  024f cd0000        	call	_assert_failed
1414  0252 5b04          	addw	sp,#4
1415  0254               L47:
1416                     ; 218   assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1418  0254 0d0b          	tnz	(OFST+6,sp)
1419  0256 2712          	jreq	L001
1420  0258 7b0b          	ld	a,(OFST+6,sp)
1421  025a a102          	cp	a,#2
1422  025c 270c          	jreq	L001
1423  025e 7b0b          	ld	a,(OFST+6,sp)
1424  0260 a104          	cp	a,#4
1425  0262 2706          	jreq	L001
1426  0264 7b0b          	ld	a,(OFST+6,sp)
1427  0266 a106          	cp	a,#6
1428  0268 2603          	jrne	L67
1429  026a               L001:
1430  026a 4f            	clr	a
1431  026b 2010          	jra	L201
1432  026d               L67:
1433  026d ae00da        	ldw	x,#218
1434  0270 89            	pushw	x
1435  0271 ae0000        	ldw	x,#0
1436  0274 89            	pushw	x
1437  0275 ae0008        	ldw	x,#L103
1438  0278 cd0000        	call	_assert_failed
1440  027b 5b04          	addw	sp,#4
1441  027d               L201:
1442                     ; 221   if (CAN_FilterNumber == CAN_FilterNumber_0)
1444  027d 0d06          	tnz	(OFST+1,sp)
1445  027f 2610          	jrne	L535
1446                     ; 223     fact = 0x01;
1448  0281 a601          	ld	a,#1
1449  0283 6b03          	ld	(OFST-2,sp),a
1451                     ; 224     fsc  = 0x00;
1453  0285 0f04          	clr	(OFST-1,sp)
1455                     ; 225     fmhl = 0x03;
1457  0287 a603          	ld	a,#3
1458  0289 6b05          	ld	(OFST+0,sp),a
1460                     ; 227     can_page_filter = CAN_Page_Filter01;
1462  028b a602          	ld	a,#2
1463  028d 6b02          	ld	(OFST-3,sp),a
1466  028f 206c          	jra	L735
1467  0291               L535:
1468                     ; 229   else if (CAN_FilterNumber == CAN_FilterNumber_1)
1470  0291 7b06          	ld	a,(OFST+1,sp)
1471  0293 a101          	cp	a,#1
1472  0295 2612          	jrne	L145
1473                     ; 231     fact = 0x10;
1475  0297 a610          	ld	a,#16
1476  0299 6b03          	ld	(OFST-2,sp),a
1478                     ; 232     fsc  = 0x04;
1480  029b a604          	ld	a,#4
1481  029d 6b04          	ld	(OFST-1,sp),a
1483                     ; 233     fmhl = 0x0C;
1485  029f a60c          	ld	a,#12
1486  02a1 6b05          	ld	(OFST+0,sp),a
1488                     ; 235     can_page_filter = CAN_Page_Filter01;
1490  02a3 a602          	ld	a,#2
1491  02a5 6b02          	ld	(OFST-3,sp),a
1494  02a7 2054          	jra	L735
1495  02a9               L145:
1496                     ; 237   else if (CAN_FilterNumber == CAN_FilterNumber_2)
1498  02a9 7b06          	ld	a,(OFST+1,sp)
1499  02ab a102          	cp	a,#2
1500  02ad 2610          	jrne	L545
1501                     ; 239     fact = 0x01;
1503  02af a601          	ld	a,#1
1504  02b1 6b03          	ld	(OFST-2,sp),a
1506                     ; 240     fsc  = 0x00;
1508  02b3 0f04          	clr	(OFST-1,sp)
1510                     ; 241     fmhl = 0x30;
1512  02b5 a630          	ld	a,#48
1513  02b7 6b05          	ld	(OFST+0,sp),a
1515                     ; 243     can_page_filter = CAN_Page_Filter23;
1517  02b9 a603          	ld	a,#3
1518  02bb 6b02          	ld	(OFST-3,sp),a
1521  02bd 203e          	jra	L735
1522  02bf               L545:
1523                     ; 245   else if (CAN_FilterNumber == CAN_FilterNumber_3)
1525  02bf 7b06          	ld	a,(OFST+1,sp)
1526  02c1 a103          	cp	a,#3
1527  02c3 2612          	jrne	L155
1528                     ; 247     fact = 0x10;
1530  02c5 a610          	ld	a,#16
1531  02c7 6b03          	ld	(OFST-2,sp),a
1533                     ; 248     fsc  = 0x04;
1535  02c9 a604          	ld	a,#4
1536  02cb 6b04          	ld	(OFST-1,sp),a
1538                     ; 249     fmhl = 0xC0;
1540  02cd a6c0          	ld	a,#192
1541  02cf 6b05          	ld	(OFST+0,sp),a
1543                     ; 251     can_page_filter = CAN_Page_Filter23;
1545  02d1 a603          	ld	a,#3
1546  02d3 6b02          	ld	(OFST-3,sp),a
1549  02d5 2026          	jra	L735
1550  02d7               L155:
1551                     ; 253   else if (CAN_FilterNumber == CAN_FilterNumber_4)
1553  02d7 7b06          	ld	a,(OFST+1,sp)
1554  02d9 a104          	cp	a,#4
1555  02db 2610          	jrne	L555
1556                     ; 255     fact = 0x01;
1558  02dd a601          	ld	a,#1
1559  02df 6b03          	ld	(OFST-2,sp),a
1561                     ; 256     fsc  = 0x00;
1563  02e1 0f04          	clr	(OFST-1,sp)
1565                     ; 257     fmhl = 0x03;
1567  02e3 a603          	ld	a,#3
1568  02e5 6b05          	ld	(OFST+0,sp),a
1570                     ; 259     can_page_filter = CAN_Page_Filter45;
1572  02e7 a604          	ld	a,#4
1573  02e9 6b02          	ld	(OFST-3,sp),a
1576  02eb 2010          	jra	L735
1577  02ed               L555:
1578                     ; 263     fact = 0x10;
1580  02ed a610          	ld	a,#16
1581  02ef 6b03          	ld	(OFST-2,sp),a
1583                     ; 264     fsc  = 0x04;
1585  02f1 a604          	ld	a,#4
1586  02f3 6b04          	ld	(OFST-1,sp),a
1588                     ; 265     fmhl = 0x0C;
1590  02f5 a60c          	ld	a,#12
1591  02f7 6b05          	ld	(OFST+0,sp),a
1593                     ; 267     can_page_filter = CAN_Page_Filter45;
1595  02f9 a604          	ld	a,#4
1596  02fb 6b02          	ld	(OFST-3,sp),a
1598  02fd               L735:
1599                     ; 271   CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1601  02fd 4f            	clr	a
1602  02fe cd0b6c        	call	_CAN_OperatingModeRequest
1604                     ; 273   CAN->PSR = CAN_Page_Config;
1606  0301 35065427      	mov	21543,#6
1607                     ; 278   if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1609  0305 7b02          	ld	a,(OFST-3,sp)
1610  0307 a102          	cp	a,#2
1611  0309 262b          	jrne	L165
1612                     ; 281     CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1614  030b 7b04          	ld	a,(OFST-1,sp)
1615  030d 5f            	clrw	x
1616  030e 97            	ld	xl,a
1617  030f a606          	ld	a,#6
1618  0311 5d            	tnzw	x
1619  0312 2704          	jreq	L401
1620  0314               L601:
1621  0314 48            	sll	a
1622  0315 5a            	decw	x
1623  0316 26fc          	jrne	L601
1624  0318               L401:
1625  0318 1a03          	or	a,(OFST-2,sp)
1626  031a 43            	cpl	a
1627  031b c45432        	and	a,21554
1628  031e c75432        	ld	21554,a
1629                     ; 283     CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1631  0321 7b04          	ld	a,(OFST-1,sp)
1632  0323 5f            	clrw	x
1633  0324 97            	ld	xl,a
1634  0325 7b0b          	ld	a,(OFST+6,sp)
1635  0327 5d            	tnzw	x
1636  0328 2704          	jreq	L011
1637  032a               L211:
1638  032a 48            	sll	a
1639  032b 5a            	decw	x
1640  032c 26fc          	jrne	L211
1641  032e               L011:
1642  032e ca5432        	or	a,21554
1643  0331 c75432        	ld	21554,a
1645  0334 205a          	jra	L365
1646  0336               L165:
1647                     ; 285   else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1649  0336 7b02          	ld	a,(OFST-3,sp)
1650  0338 a103          	cp	a,#3
1651  033a 262b          	jrne	L565
1652                     ; 288     CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1654  033c 7b04          	ld	a,(OFST-1,sp)
1655  033e 5f            	clrw	x
1656  033f 97            	ld	xl,a
1657  0340 a606          	ld	a,#6
1658  0342 5d            	tnzw	x
1659  0343 2704          	jreq	L411
1660  0345               L611:
1661  0345 48            	sll	a
1662  0346 5a            	decw	x
1663  0347 26fc          	jrne	L611
1664  0349               L411:
1665  0349 1a03          	or	a,(OFST-2,sp)
1666  034b 43            	cpl	a
1667  034c c45433        	and	a,21555
1668  034f c75433        	ld	21555,a
1669                     ; 291     CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1671  0352 7b04          	ld	a,(OFST-1,sp)
1672  0354 5f            	clrw	x
1673  0355 97            	ld	xl,a
1674  0356 7b0b          	ld	a,(OFST+6,sp)
1675  0358 5d            	tnzw	x
1676  0359 2704          	jreq	L021
1677  035b               L221:
1678  035b 48            	sll	a
1679  035c 5a            	decw	x
1680  035d 26fc          	jrne	L221
1681  035f               L021:
1682  035f ca5433        	or	a,21555
1683  0362 c75433        	ld	21555,a
1685  0365 2029          	jra	L365
1686  0367               L565:
1687                     ; 297     CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1689  0367 7b04          	ld	a,(OFST-1,sp)
1690  0369 5f            	clrw	x
1691  036a 97            	ld	xl,a
1692  036b a606          	ld	a,#6
1693  036d 5d            	tnzw	x
1694  036e 2704          	jreq	L421
1695  0370               L621:
1696  0370 48            	sll	a
1697  0371 5a            	decw	x
1698  0372 26fc          	jrne	L621
1699  0374               L421:
1700  0374 1a03          	or	a,(OFST-2,sp)
1701  0376 43            	cpl	a
1702  0377 c45434        	and	a,21556
1703  037a c75434        	ld	21556,a
1704                     ; 300     CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1706  037d 7b04          	ld	a,(OFST-1,sp)
1707  037f 5f            	clrw	x
1708  0380 97            	ld	xl,a
1709  0381 7b0b          	ld	a,(OFST+6,sp)
1710  0383 5d            	tnzw	x
1711  0384 2704          	jreq	L031
1712  0386               L231:
1713  0386 48            	sll	a
1714  0387 5a            	decw	x
1715  0388 26fc          	jrne	L231
1716  038a               L031:
1717  038a ca5434        	or	a,21556
1718  038d c75434        	ld	21556,a
1719  0390               L365:
1720                     ; 306   if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1722  0390 7b02          	ld	a,(OFST-3,sp)
1723  0392 a104          	cp	a,#4
1724  0394 273d          	jreq	L175
1725                     ; 309     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1727  0396 0d0a          	tnz	(OFST+5,sp)
1728  0398 260b          	jrne	L375
1729                     ; 312       CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1731  039a 7b05          	ld	a,(OFST+0,sp)
1732  039c 43            	cpl	a
1733  039d c45430        	and	a,21552
1734  03a0 c75430        	ld	21552,a
1736  03a3 2069          	jra	L706
1737  03a5               L375:
1738                     ; 314     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1740  03a5 7b0a          	ld	a,(OFST+5,sp)
1741  03a7 a101          	cp	a,#1
1742  03a9 260a          	jrne	L775
1743                     ; 317       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1745  03ab c65430        	ld	a,21552
1746  03ae 1a05          	or	a,(OFST+0,sp)
1747  03b0 c75430        	ld	21552,a
1749  03b3 2059          	jra	L706
1750  03b5               L775:
1751                     ; 319     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1753  03b5 7b0a          	ld	a,(OFST+5,sp)
1754  03b7 a111          	cp	a,#17
1755  03b9 260c          	jrne	L306
1756                     ; 322       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1758  03bb 7b05          	ld	a,(OFST+0,sp)
1759  03bd a455          	and	a,#85
1760  03bf ca5430        	or	a,21552
1761  03c2 c75430        	ld	21552,a
1763  03c5 2047          	jra	L706
1764  03c7               L306:
1765                     ; 327       CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1767  03c7 7b05          	ld	a,(OFST+0,sp)
1768  03c9 a4aa          	and	a,#170
1769  03cb ca5430        	or	a,21552
1770  03ce c75430        	ld	21552,a
1771  03d1 203b          	jra	L706
1772  03d3               L175:
1773                     ; 336     if (CAN_FilterMode == CAN_FilterMode_IdMask)
1775  03d3 0d0a          	tnz	(OFST+5,sp)
1776  03d5 260b          	jrne	L116
1777                     ; 339       CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1779  03d7 7b05          	ld	a,(OFST+0,sp)
1780  03d9 43            	cpl	a
1781  03da c45431        	and	a,21553
1782  03dd c75431        	ld	21553,a
1784  03e0 202c          	jra	L706
1785  03e2               L116:
1786                     ; 341     else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1788  03e2 7b0a          	ld	a,(OFST+5,sp)
1789  03e4 a101          	cp	a,#1
1790  03e6 260a          	jrne	L516
1791                     ; 344       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1793  03e8 c65431        	ld	a,21553
1794  03eb 1a05          	or	a,(OFST+0,sp)
1795  03ed c75431        	ld	21553,a
1797  03f0 201c          	jra	L706
1798  03f2               L516:
1799                     ; 346     else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1801  03f2 7b0a          	ld	a,(OFST+5,sp)
1802  03f4 a111          	cp	a,#17
1803  03f6 260c          	jrne	L126
1804                     ; 349       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1806  03f8 7b05          	ld	a,(OFST+0,sp)
1807  03fa a455          	and	a,#85
1808  03fc ca5431        	or	a,21553
1809  03ff c75431        	ld	21553,a
1811  0402 200a          	jra	L706
1812  0404               L126:
1813                     ; 354       CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1815  0404 7b05          	ld	a,(OFST+0,sp)
1816  0406 a4aa          	and	a,#170
1817  0408 ca5431        	or	a,21553
1818  040b c75431        	ld	21553,a
1819  040e               L706:
1820                     ; 360   CAN->PSR = (uint8_t)can_page_filter;
1822  040e 7b02          	ld	a,(OFST-3,sp)
1823  0410 c75427        	ld	21543,a
1824                     ; 361   if (fsc != 0)
1826  0413 0d04          	tnz	(OFST-1,sp)
1827  0415 2603          	jrne	L431
1828  0417 cc04e3        	jp	L526
1829  041a               L431:
1830                     ; 364     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1832  041a 0d0b          	tnz	(OFST+6,sp)
1833  041c 262c          	jrne	L726
1834                     ; 366       CAN->Page.Filter.FR09 = CAN_FilterID1;
1836  041e 7b0c          	ld	a,(OFST+7,sp)
1837  0420 c75430        	ld	21552,a
1838                     ; 367       CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1840  0423 7b10          	ld	a,(OFST+11,sp)
1841  0425 c75431        	ld	21553,a
1842                     ; 368       CAN->Page.Filter.FR11 = CAN_FilterID2;
1844  0428 7b0d          	ld	a,(OFST+8,sp)
1845  042a c75432        	ld	21554,a
1846                     ; 369       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1848  042d 7b11          	ld	a,(OFST+12,sp)
1849  042f c75433        	ld	21555,a
1850                     ; 370       CAN->Page.Filter.FR13 = CAN_FilterID3;
1852  0432 7b0e          	ld	a,(OFST+9,sp)
1853  0434 c75434        	ld	21556,a
1854                     ; 371       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1856  0437 7b12          	ld	a,(OFST+13,sp)
1857  0439 c75435        	ld	21557,a
1858                     ; 372       CAN->Page.Filter.FR15 = CAN_FilterID4;
1860  043c 7b0f          	ld	a,(OFST+10,sp)
1861  043e c75436        	ld	21558,a
1862                     ; 373       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1864  0441 7b13          	ld	a,(OFST+14,sp)
1865  0443 c75437        	ld	21559,a
1867  0446 aca105a1      	jpf	L546
1868  044a               L726:
1869                     ; 375     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1871  044a 7b0b          	ld	a,(OFST+6,sp)
1872  044c a102          	cp	a,#2
1873  044e 262c          	jrne	L336
1874                     ; 377       CAN->Page.Filter.FR09 = CAN_FilterID1;
1876  0450 7b0c          	ld	a,(OFST+7,sp)
1877  0452 c75430        	ld	21552,a
1878                     ; 378       CAN->Page.Filter.FR10 = CAN_FilterID2;
1880  0455 7b0d          	ld	a,(OFST+8,sp)
1881  0457 c75431        	ld	21553,a
1882                     ; 379       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1884  045a 7b10          	ld	a,(OFST+11,sp)
1885  045c c75432        	ld	21554,a
1886                     ; 380       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1888  045f 7b11          	ld	a,(OFST+12,sp)
1889  0461 c75433        	ld	21555,a
1890                     ; 381       CAN->Page.Filter.FR13 = CAN_FilterID3;
1892  0464 7b0e          	ld	a,(OFST+9,sp)
1893  0466 c75434        	ld	21556,a
1894                     ; 382       CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1896  0469 7b12          	ld	a,(OFST+13,sp)
1897  046b c75435        	ld	21557,a
1898                     ; 383       CAN->Page.Filter.FR15 = CAN_FilterID4;
1900  046e 7b0f          	ld	a,(OFST+10,sp)
1901  0470 c75436        	ld	21558,a
1902                     ; 384       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1904  0473 7b13          	ld	a,(OFST+14,sp)
1905  0475 c75437        	ld	21559,a
1907  0478 aca105a1      	jpf	L546
1908  047c               L336:
1909                     ; 386     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1911  047c 7b0b          	ld	a,(OFST+6,sp)
1912  047e a104          	cp	a,#4
1913  0480 262c          	jrne	L736
1914                     ; 388       CAN->Page.Filter.FR09 = CAN_FilterID1;
1916  0482 7b0c          	ld	a,(OFST+7,sp)
1917  0484 c75430        	ld	21552,a
1918                     ; 389       CAN->Page.Filter.FR10 = CAN_FilterID2;
1920  0487 7b0d          	ld	a,(OFST+8,sp)
1921  0489 c75431        	ld	21553,a
1922                     ; 390       CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1924  048c 7b10          	ld	a,(OFST+11,sp)
1925  048e c75432        	ld	21554,a
1926                     ; 391       CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1928  0491 7b11          	ld	a,(OFST+12,sp)
1929  0493 c75433        	ld	21555,a
1930                     ; 392       CAN->Page.Filter.FR13 = CAN_FilterID3;
1932  0496 7b0e          	ld	a,(OFST+9,sp)
1933  0498 c75434        	ld	21556,a
1934                     ; 393       CAN->Page.Filter.FR14 = CAN_FilterID4;
1936  049b 7b0f          	ld	a,(OFST+10,sp)
1937  049d c75435        	ld	21557,a
1938                     ; 394       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1940  04a0 7b12          	ld	a,(OFST+13,sp)
1941  04a2 c75436        	ld	21558,a
1942                     ; 395       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1944  04a5 7b13          	ld	a,(OFST+14,sp)
1945  04a7 c75437        	ld	21559,a
1947  04aa aca105a1      	jpf	L546
1948  04ae               L736:
1949                     ; 397     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1951  04ae 7b0b          	ld	a,(OFST+6,sp)
1952  04b0 a106          	cp	a,#6
1953  04b2 2703          	jreq	L631
1954  04b4 cc05a1        	jp	L546
1955  04b7               L631:
1956                     ; 399       CAN->Page.Filter.FR09 = CAN_FilterID1;
1958  04b7 7b0c          	ld	a,(OFST+7,sp)
1959  04b9 c75430        	ld	21552,a
1960                     ; 400       CAN->Page.Filter.FR10 = CAN_FilterID2;
1962  04bc 7b0d          	ld	a,(OFST+8,sp)
1963  04be c75431        	ld	21553,a
1964                     ; 401       CAN->Page.Filter.FR11 = CAN_FilterID3;
1966  04c1 7b0e          	ld	a,(OFST+9,sp)
1967  04c3 c75432        	ld	21554,a
1968                     ; 402       CAN->Page.Filter.FR12 = CAN_FilterID4;
1970  04c6 7b0f          	ld	a,(OFST+10,sp)
1971  04c8 c75433        	ld	21555,a
1972                     ; 403       CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1974  04cb 7b10          	ld	a,(OFST+11,sp)
1975  04cd c75434        	ld	21556,a
1976                     ; 404       CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1978  04d0 7b11          	ld	a,(OFST+12,sp)
1979  04d2 c75435        	ld	21557,a
1980                     ; 405       CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1982  04d5 7b12          	ld	a,(OFST+13,sp)
1983  04d7 c75436        	ld	21558,a
1984                     ; 406       CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1986  04da 7b13          	ld	a,(OFST+14,sp)
1987  04dc c75437        	ld	21559,a
1988  04df aca105a1      	jpf	L546
1989  04e3               L526:
1990                     ; 412     if (CAN_FilterScale == CAN_FilterScale_8Bit)
1992  04e3 0d0b          	tnz	(OFST+6,sp)
1993  04e5 262c          	jrne	L746
1994                     ; 414       CAN->Page.Filter.FR01 = CAN_FilterID1;
1996  04e7 7b0c          	ld	a,(OFST+7,sp)
1997  04e9 c75428        	ld	21544,a
1998                     ; 415       CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
2000  04ec 7b10          	ld	a,(OFST+11,sp)
2001  04ee c75429        	ld	21545,a
2002                     ; 416       CAN->Page.Filter.FR03 = CAN_FilterID2;
2004  04f1 7b0d          	ld	a,(OFST+8,sp)
2005  04f3 c7542a        	ld	21546,a
2006                     ; 417       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2008  04f6 7b11          	ld	a,(OFST+12,sp)
2009  04f8 c7542b        	ld	21547,a
2010                     ; 418       CAN->Page.Filter.FR05 = CAN_FilterID3;
2012  04fb 7b0e          	ld	a,(OFST+9,sp)
2013  04fd c7542c        	ld	21548,a
2014                     ; 419       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2016  0500 7b12          	ld	a,(OFST+13,sp)
2017  0502 c7542d        	ld	21549,a
2018                     ; 420       CAN->Page.Filter.FR07 = CAN_FilterID4;
2020  0505 7b0f          	ld	a,(OFST+10,sp)
2021  0507 c7542e        	ld	21550,a
2022                     ; 421       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2024  050a 7b13          	ld	a,(OFST+14,sp)
2025  050c c7542f        	ld	21551,a
2027  050f aca105a1      	jpf	L546
2028  0513               L746:
2029                     ; 423     else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
2031  0513 7b0b          	ld	a,(OFST+6,sp)
2032  0515 a102          	cp	a,#2
2033  0517 262a          	jrne	L356
2034                     ; 425       CAN->Page.Filter.FR01 = CAN_FilterID1;
2036  0519 7b0c          	ld	a,(OFST+7,sp)
2037  051b c75428        	ld	21544,a
2038                     ; 426       CAN->Page.Filter.FR02 = CAN_FilterID2;
2040  051e 7b0d          	ld	a,(OFST+8,sp)
2041  0520 c75429        	ld	21545,a
2042                     ; 427       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2044  0523 7b10          	ld	a,(OFST+11,sp)
2045  0525 c7542a        	ld	21546,a
2046                     ; 428       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2048  0528 7b11          	ld	a,(OFST+12,sp)
2049  052a c7542b        	ld	21547,a
2050                     ; 429       CAN->Page.Filter.FR05 = CAN_FilterID3;
2052  052d 7b0e          	ld	a,(OFST+9,sp)
2053  052f c7542c        	ld	21548,a
2054                     ; 430       CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2056  0532 7b12          	ld	a,(OFST+13,sp)
2057  0534 c7542d        	ld	21549,a
2058                     ; 431       CAN->Page.Filter.FR07 = CAN_FilterID4;
2060  0537 7b0f          	ld	a,(OFST+10,sp)
2061  0539 c7542e        	ld	21550,a
2062                     ; 432       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2064  053c 7b13          	ld	a,(OFST+14,sp)
2065  053e c7542f        	ld	21551,a
2067  0541 205e          	jra	L546
2068  0543               L356:
2069                     ; 434     else if (CAN_FilterScale == CAN_FilterScale_16Bit)
2071  0543 7b0b          	ld	a,(OFST+6,sp)
2072  0545 a104          	cp	a,#4
2073  0547 262a          	jrne	L756
2074                     ; 436       CAN->Page.Filter.FR01 = CAN_FilterID1;
2076  0549 7b0c          	ld	a,(OFST+7,sp)
2077  054b c75428        	ld	21544,a
2078                     ; 437       CAN->Page.Filter.FR02 = CAN_FilterID2;
2080  054e 7b0d          	ld	a,(OFST+8,sp)
2081  0550 c75429        	ld	21545,a
2082                     ; 438       CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2084  0553 7b10          	ld	a,(OFST+11,sp)
2085  0555 c7542a        	ld	21546,a
2086                     ; 439       CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2088  0558 7b11          	ld	a,(OFST+12,sp)
2089  055a c7542b        	ld	21547,a
2090                     ; 440       CAN->Page.Filter.FR05 = CAN_FilterID3;
2092  055d 7b0e          	ld	a,(OFST+9,sp)
2093  055f c7542c        	ld	21548,a
2094                     ; 441       CAN->Page.Filter.FR06 = CAN_FilterID4;
2096  0562 7b0f          	ld	a,(OFST+10,sp)
2097  0564 c7542d        	ld	21549,a
2098                     ; 442       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2100  0567 7b12          	ld	a,(OFST+13,sp)
2101  0569 c7542e        	ld	21550,a
2102                     ; 443       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2104  056c 7b13          	ld	a,(OFST+14,sp)
2105  056e c7542f        	ld	21551,a
2107  0571 202e          	jra	L546
2108  0573               L756:
2109                     ; 445     else if (CAN_FilterScale == CAN_FilterScale_32Bit)
2111  0573 7b0b          	ld	a,(OFST+6,sp)
2112  0575 a106          	cp	a,#6
2113  0577 2628          	jrne	L546
2114                     ; 447       CAN->Page.Filter.FR01 = CAN_FilterID1;
2116  0579 7b0c          	ld	a,(OFST+7,sp)
2117  057b c75428        	ld	21544,a
2118                     ; 448       CAN->Page.Filter.FR02 = CAN_FilterID2;
2120  057e 7b0d          	ld	a,(OFST+8,sp)
2121  0580 c75429        	ld	21545,a
2122                     ; 449       CAN->Page.Filter.FR03 = CAN_FilterID3;
2124  0583 7b0e          	ld	a,(OFST+9,sp)
2125  0585 c7542a        	ld	21546,a
2126                     ; 450       CAN->Page.Filter.FR04 = CAN_FilterID4;
2128  0588 7b0f          	ld	a,(OFST+10,sp)
2129  058a c7542b        	ld	21547,a
2130                     ; 451       CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
2132  058d 7b10          	ld	a,(OFST+11,sp)
2133  058f c7542c        	ld	21548,a
2134                     ; 452       CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
2136  0592 7b11          	ld	a,(OFST+12,sp)
2137  0594 c7542d        	ld	21549,a
2138                     ; 453       CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2140  0597 7b12          	ld	a,(OFST+13,sp)
2141  0599 c7542e        	ld	21550,a
2142                     ; 454       CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2144  059c 7b13          	ld	a,(OFST+14,sp)
2145  059e c7542f        	ld	21551,a
2146  05a1               L546:
2147                     ; 463   CAN->PSR = CAN_Page_Config;
2149  05a1 35065427      	mov	21543,#6
2150                     ; 464   if (CAN_FilterActivation != DISABLE)
2152  05a5 0d07          	tnz	(OFST+2,sp)
2153  05a7 272a          	jreq	L566
2154                     ; 466     if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
2156  05a9 7b06          	ld	a,(OFST+1,sp)
2157  05ab a506          	bcp	a,#6
2158  05ad 260a          	jrne	L766
2159                     ; 467     {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
2161  05af c65432        	ld	a,21554
2162  05b2 1a03          	or	a,(OFST-2,sp)
2163  05b4 c75432        	ld	21554,a
2165  05b7 201a          	jra	L566
2166  05b9               L766:
2167                     ; 469     else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2169  05b9 7b06          	ld	a,(OFST+1,sp)
2170  05bb a406          	and	a,#6
2171  05bd a102          	cp	a,#2
2172  05bf 260a          	jrne	L376
2173                     ; 470     { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2175  05c1 c65433        	ld	a,21555
2176  05c4 1a03          	or	a,(OFST-2,sp)
2177  05c6 c75433        	ld	21555,a
2179  05c9 2008          	jra	L566
2180  05cb               L376:
2181                     ; 473     { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2183  05cb c65434        	ld	a,21556
2184  05ce 1a03          	or	a,(OFST-2,sp)
2185  05d0 c75434        	ld	21556,a
2186  05d3               L566:
2187                     ; 476   CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2189  05d3 a601          	ld	a,#1
2190  05d5 cd0b6c        	call	_CAN_OperatingModeRequest
2192                     ; 478   CAN_SelectPage(can_page);
2194  05d8 7b01          	ld	a,(OFST-4,sp)
2195  05da cd106d        	call	_CAN_SelectPage
2197                     ; 479 }
2200  05dd 5b07          	addw	sp,#7
2201  05df 81            	ret
2344                     ; 487 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2344                     ; 488 {
2345                     	switch	.text
2346  05e0               _CAN_ITConfig:
2348  05e0 89            	pushw	x
2349  05e1 5203          	subw	sp,#3
2350       00000003      OFST:	set	3
2353                     ; 489   uint8_t tmperrorinterrupt = 0;
2355                     ; 490   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2357  05e3 cd1069        	call	_CAN_GetSelectedPage
2359  05e6 6b02          	ld	(OFST-1,sp),a
2361                     ; 494   assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2363  05e8 1e04          	ldw	x,(OFST+1,sp)
2364  05ea 2711          	jreq	L241
2365  05ec 1e04          	ldw	x,(OFST+1,sp)
2366  05ee 01            	rrwa	x,a
2367  05ef a470          	and	a,#112
2368  05f1 01            	rrwa	x,a
2369  05f2 a4b0          	and	a,#176
2370  05f4 01            	rrwa	x,a
2371  05f5 a30000        	cpw	x,#0
2372  05f8 2603          	jrne	L241
2373  05fa 4f            	clr	a
2374  05fb 2010          	jra	L441
2375  05fd               L241:
2376  05fd ae01ee        	ldw	x,#494
2377  0600 89            	pushw	x
2378  0601 ae0000        	ldw	x,#0
2379  0604 89            	pushw	x
2380  0605 ae0008        	ldw	x,#L103
2381  0608 cd0000        	call	_assert_failed
2383  060b 5b04          	addw	sp,#4
2384  060d               L441:
2385                     ; 495   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2387  060d 0d08          	tnz	(OFST+5,sp)
2388  060f 2706          	jreq	L051
2389  0611 7b08          	ld	a,(OFST+5,sp)
2390  0613 a101          	cp	a,#1
2391  0615 2603          	jrne	L641
2392  0617               L051:
2393  0617 4f            	clr	a
2394  0618 2010          	jra	L251
2395  061a               L641:
2396  061a ae01ef        	ldw	x,#495
2397  061d 89            	pushw	x
2398  061e ae0000        	ldw	x,#0
2399  0621 89            	pushw	x
2400  0622 ae0008        	ldw	x,#L103
2401  0625 cd0000        	call	_assert_failed
2403  0628 5b04          	addw	sp,#4
2404  062a               L251:
2405                     ; 497   tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2407  062a 1e04          	ldw	x,(OFST+1,sp)
2408  062c 4f            	clr	a
2409  062d 01            	rrwa	x,a
2410  062e 48            	sll	a
2411  062f 59            	rlcw	x
2412  0630 9f            	ld	a,xl
2413  0631 6b03          	ld	(OFST+0,sp),a
2415                     ; 498   tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2415                     ; 499                                 (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2417  0633 7b03          	ld	a,(OFST+0,sp)
2418  0635 a40f          	and	a,#15
2419  0637 44            	srl	a
2420  0638 6b01          	ld	(OFST-2,sp),a
2422  063a 7b03          	ld	a,(OFST+0,sp)
2423  063c a4f0          	and	a,#240
2424  063e 1a01          	or	a,(OFST-2,sp)
2425  0640 6b03          	ld	(OFST+0,sp),a
2427                     ; 501   CAN->PSR = CAN_Page_Config;
2429  0642 35065427      	mov	21543,#6
2430                     ; 502   if (NewState != DISABLE)
2432  0646 0d08          	tnz	(OFST+5,sp)
2433  0648 2712          	jreq	L167
2434                     ; 505     CAN->IER |= (uint8_t)(CAN_IT);
2436  064a c65425        	ld	a,21541
2437  064d 1a05          	or	a,(OFST+2,sp)
2438  064f c75425        	ld	21541,a
2439                     ; 506     CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2441  0652 c65429        	ld	a,21545
2442  0655 1a03          	or	a,(OFST+0,sp)
2443  0657 c75429        	ld	21545,a
2445  065a 2012          	jra	L367
2446  065c               L167:
2447                     ; 511     CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2449  065c 7b05          	ld	a,(OFST+2,sp)
2450  065e 43            	cpl	a
2451  065f c45425        	and	a,21541
2452  0662 c75425        	ld	21541,a
2453                     ; 512     CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2455  0665 7b03          	ld	a,(OFST+0,sp)
2456  0667 43            	cpl	a
2457  0668 c45429        	and	a,21545
2458  066b c75429        	ld	21545,a
2459  066e               L367:
2460                     ; 515   CAN_SelectPage(can_page);
2462  066e 7b02          	ld	a,(OFST-1,sp)
2463  0670 cd106d        	call	_CAN_SelectPage
2465                     ; 516 }
2468  0673 5b05          	addw	sp,#5
2469  0675 81            	ret
2529                     ; 525 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2529                     ; 526 {
2530                     	switch	.text
2531  0676               _CAN_ST7CompatibilityCmd:
2533  0676 88            	push	a
2534       00000000      OFST:	set	0
2537                     ; 528   assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2539  0677 4d            	tnz	a
2540  0678 2704          	jreq	L061
2541  067a a110          	cp	a,#16
2542  067c 2603          	jrne	L651
2543  067e               L061:
2544  067e 4f            	clr	a
2545  067f 2010          	jra	L261
2546  0681               L651:
2547  0681 ae0210        	ldw	x,#528
2548  0684 89            	pushw	x
2549  0685 ae0000        	ldw	x,#0
2550  0688 89            	pushw	x
2551  0689 ae0008        	ldw	x,#L103
2552  068c cd0000        	call	_assert_failed
2554  068f 5b04          	addw	sp,#4
2555  0691               L261:
2556                     ; 530   CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2558  0691 72195426      	bres	21542,#4
2559                     ; 533   CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2561  0695 c65426        	ld	a,21542
2562  0698 1a01          	or	a,(OFST+1,sp)
2563  069a c75426        	ld	21542,a
2564                     ; 534 }
2567  069d 84            	pop	a
2568  069e 81            	ret
2616                     ; 541 void CAN_TTComModeCmd(FunctionalState NewState)
2616                     ; 542 {
2617                     	switch	.text
2618  069f               _CAN_TTComModeCmd:
2620  069f 88            	push	a
2621  06a0 88            	push	a
2622       00000001      OFST:	set	1
2625                     ; 543   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2627  06a1 cd1069        	call	_CAN_GetSelectedPage
2629  06a4 6b01          	ld	(OFST+0,sp),a
2631                     ; 545   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2633  06a6 0d02          	tnz	(OFST+1,sp)
2634  06a8 2706          	jreq	L071
2635  06aa 7b02          	ld	a,(OFST+1,sp)
2636  06ac a101          	cp	a,#1
2637  06ae 2603          	jrne	L661
2638  06b0               L071:
2639  06b0 4f            	clr	a
2640  06b1 2010          	jra	L271
2641  06b3               L661:
2642  06b3 ae0221        	ldw	x,#545
2643  06b6 89            	pushw	x
2644  06b7 ae0000        	ldw	x,#0
2645  06ba 89            	pushw	x
2646  06bb ae0008        	ldw	x,#L103
2647  06be cd0000        	call	_assert_failed
2649  06c1 5b04          	addw	sp,#4
2650  06c3               L271:
2651                     ; 546   if (NewState != DISABLE)
2653  06c3 0d02          	tnz	(OFST+1,sp)
2654  06c5 2726          	jreq	L5301
2655                     ; 549     CAN->MCR |= CAN_MCR_TTCM;
2657  06c7 721e5420      	bset	21536,#7
2658                     ; 551     CAN->PSR = CAN_Page_TxMailBox0;
2660  06cb 725f5427      	clr	21543
2661                     ; 552     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2663  06cf 721e5429      	bset	21545,#7
2664                     ; 553     CAN->PSR = CAN_Page_TxMailBox1;
2666  06d3 35015427      	mov	21543,#1
2667                     ; 554     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2669  06d7 721e5429      	bset	21545,#7
2670                     ; 555     CAN->PSR = CAN_Page_TxMailBox2;
2672  06db 35055427      	mov	21543,#5
2673                     ; 556     CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2675  06df 721e5429      	bset	21545,#7
2676                     ; 557     CAN->PSR = CAN_Page_RxFifo;
2678  06e3 35075427      	mov	21543,#7
2679                     ; 558     CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2681  06e7 721e5429      	bset	21545,#7
2683  06eb 2024          	jra	L7301
2684  06ed               L5301:
2685                     ; 563     CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2687  06ed 721f5420      	bres	21536,#7
2688                     ; 565     CAN->PSR = CAN_Page_TxMailBox0;
2690  06f1 725f5427      	clr	21543
2691                     ; 566     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2693  06f5 721f5429      	bres	21545,#7
2694                     ; 567     CAN->PSR = CAN_Page_TxMailBox1;
2696  06f9 35015427      	mov	21543,#1
2697                     ; 568     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2699  06fd 721f5429      	bres	21545,#7
2700                     ; 569     CAN->PSR = CAN_Page_TxMailBox2;
2702  0701 35055427      	mov	21543,#5
2703                     ; 570     CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2705  0705 721f5429      	bres	21545,#7
2706                     ; 571     CAN->PSR = CAN_Page_RxFifo;
2708  0709 35075427      	mov	21543,#7
2709                     ; 572     CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2711  070d 721f5429      	bres	21545,#7
2712  0711               L7301:
2713                     ; 575   CAN_SelectPage(can_page);
2715  0711 7b01          	ld	a,(OFST+0,sp)
2716  0713 cd106d        	call	_CAN_SelectPage
2718                     ; 576 }
2721  0716 85            	popw	x
2722  0717 81            	ret
2928                     .const:	section	.text
2929  0000               L602:
2930  0000 20000000      	dc.l	536870912
2931  0004               L412:
2932  0004 00000800      	dc.l	2048
2933                     ; 587 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2933                     ; 588                                   CAN_Id_TypeDef CAN_IDE,
2933                     ; 589                                   CAN_RTR_TypeDef CAN_RTR,
2933                     ; 590                                   uint8_t CAN_DLC,
2933                     ; 591                                   uint8_t *CAN_Data)
2933                     ; 592 {
2934                     	switch	.text
2935  0718               _CAN_Transmit:
2937  0718 5206          	subw	sp,#6
2938       00000006      OFST:	set	6
2941                     ; 593   CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2943                     ; 594   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2945  071a cd1069        	call	_CAN_GetSelectedPage
2947  071d 6b05          	ld	(OFST-1,sp),a
2949                     ; 596   assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2951  071f 0d0d          	tnz	(OFST+7,sp)
2952  0721 2706          	jreq	L002
2953  0723 7b0d          	ld	a,(OFST+7,sp)
2954  0725 a140          	cp	a,#64
2955  0727 2603          	jrne	L671
2956  0729               L002:
2957  0729 4f            	clr	a
2958  072a 2010          	jra	L202
2959  072c               L671:
2960  072c ae0254        	ldw	x,#596
2961  072f 89            	pushw	x
2962  0730 ae0000        	ldw	x,#0
2963  0733 89            	pushw	x
2964  0734 ae0008        	ldw	x,#L103
2965  0737 cd0000        	call	_assert_failed
2967  073a 5b04          	addw	sp,#4
2968  073c               L202:
2969                     ; 597   if (CAN_IDE != CAN_Id_Standard)
2971  073c 0d0d          	tnz	(OFST+7,sp)
2972  073e 2724          	jreq	L3511
2973                     ; 599     assert_param(IS_CAN_EXTID_OK(CAN_Id));
2975  0740 96            	ldw	x,sp
2976  0741 1c0009        	addw	x,#OFST+3
2977  0744 cd0000        	call	c_ltor
2979  0747 ae0000        	ldw	x,#L602
2980  074a cd0000        	call	c_lcmp
2982  074d 2403          	jruge	L402
2983  074f 4f            	clr	a
2984  0750 2010          	jra	L012
2985  0752               L402:
2986  0752 ae0257        	ldw	x,#599
2987  0755 89            	pushw	x
2988  0756 ae0000        	ldw	x,#0
2989  0759 89            	pushw	x
2990  075a ae0008        	ldw	x,#L103
2991  075d cd0000        	call	_assert_failed
2993  0760 5b04          	addw	sp,#4
2994  0762               L012:
2996  0762 2022          	jra	L5511
2997  0764               L3511:
2998                     ; 603     assert_param(IS_CAN_STDID_OK(CAN_Id));
3000  0764 96            	ldw	x,sp
3001  0765 1c0009        	addw	x,#OFST+3
3002  0768 cd0000        	call	c_ltor
3004  076b ae0004        	ldw	x,#L412
3005  076e cd0000        	call	c_lcmp
3007  0771 2403          	jruge	L212
3008  0773 4f            	clr	a
3009  0774 2010          	jra	L612
3010  0776               L212:
3011  0776 ae025b        	ldw	x,#603
3012  0779 89            	pushw	x
3013  077a ae0000        	ldw	x,#0
3014  077d 89            	pushw	x
3015  077e ae0008        	ldw	x,#L103
3016  0781 cd0000        	call	_assert_failed
3018  0784 5b04          	addw	sp,#4
3019  0786               L612:
3020  0786               L5511:
3021                     ; 605   assert_param(IS_CAN_RTR_OK(CAN_RTR));
3023  0786 0d0e          	tnz	(OFST+8,sp)
3024  0788 2706          	jreq	L222
3025  078a 7b0e          	ld	a,(OFST+8,sp)
3026  078c a120          	cp	a,#32
3027  078e 2603          	jrne	L022
3028  0790               L222:
3029  0790 4f            	clr	a
3030  0791 2010          	jra	L422
3031  0793               L022:
3032  0793 ae025d        	ldw	x,#605
3033  0796 89            	pushw	x
3034  0797 ae0000        	ldw	x,#0
3035  079a 89            	pushw	x
3036  079b ae0008        	ldw	x,#L103
3037  079e cd0000        	call	_assert_failed
3039  07a1 5b04          	addw	sp,#4
3040  07a3               L422:
3041                     ; 606   assert_param(IS_CAN_DLC_OK(CAN_DLC));
3043  07a3 7b0f          	ld	a,(OFST+9,sp)
3044  07a5 a109          	cp	a,#9
3045  07a7 2403          	jruge	L622
3046  07a9 4f            	clr	a
3047  07aa 2010          	jra	L032
3048  07ac               L622:
3049  07ac ae025e        	ldw	x,#606
3050  07af 89            	pushw	x
3051  07b0 ae0000        	ldw	x,#0
3052  07b3 89            	pushw	x
3053  07b4 ae0008        	ldw	x,#L103
3054  07b7 cd0000        	call	_assert_failed
3056  07ba 5b04          	addw	sp,#4
3057  07bc               L032:
3058                     ; 608   if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
3060  07bc c65423        	ld	a,21539
3061  07bf a404          	and	a,#4
3062  07c1 a104          	cp	a,#4
3063  07c3 2604          	jrne	L7511
3064                     ; 610     CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
3066  07c5 0f06          	clr	(OFST+0,sp)
3069  07c7 2022          	jra	L1611
3070  07c9               L7511:
3071                     ; 612   else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
3073  07c9 c65423        	ld	a,21539
3074  07cc a408          	and	a,#8
3075  07ce a108          	cp	a,#8
3076  07d0 2606          	jrne	L3611
3077                     ; 614     CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
3079  07d2 a601          	ld	a,#1
3080  07d4 6b06          	ld	(OFST+0,sp),a
3083  07d6 2013          	jra	L1611
3084  07d8               L3611:
3085                     ; 616   else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
3087  07d8 c65423        	ld	a,21539
3088  07db a410          	and	a,#16
3089  07dd a110          	cp	a,#16
3090  07df 2606          	jrne	L7611
3091                     ; 618     CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
3093  07e1 a605          	ld	a,#5
3094  07e3 6b06          	ld	(OFST+0,sp),a
3097  07e5 2004          	jra	L1611
3098  07e7               L7611:
3099                     ; 622     CAN_TxStatus = CAN_TxStatus_NoMailBox;
3101  07e7 a6f4          	ld	a,#244
3102  07e9 6b06          	ld	(OFST+0,sp),a
3104  07eb               L1611:
3105                     ; 624   if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
3107  07eb 7b06          	ld	a,(OFST+0,sp)
3108  07ed a1f4          	cp	a,#244
3109  07ef 2603          	jrne	L232
3110  07f1 cc08bd        	jp	L3711
3111  07f4               L232:
3112                     ; 626     CAN->PSR = (uint8_t)CAN_TxStatus;
3114  07f4 7b06          	ld	a,(OFST+0,sp)
3115  07f6 c75427        	ld	21543,a
3116                     ; 628     if (CAN_IDE != CAN_Id_Standard)
3118  07f9 0d0d          	tnz	(OFST+7,sp)
3119  07fb 273b          	jreq	L5711
3120                     ; 630       CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
3122  07fd 7b09          	ld	a,(OFST+3,sp)
3123  07ff a41f          	and	a,#31
3124  0801 6b09          	ld	(OFST+3,sp),a
3125                     ; 631       CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
3127  0803 7b0c          	ld	a,(OFST+6,sp)
3128  0805 c7542d        	ld	21549,a
3129                     ; 632       CAN_Id = CAN_Id>>8;
3131  0808 96            	ldw	x,sp
3132  0809 1c0009        	addw	x,#OFST+3
3133  080c a608          	ld	a,#8
3134  080e cd0000        	call	c_lgursh
3136                     ; 633       CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
3138  0811 7b0c          	ld	a,(OFST+6,sp)
3139  0813 c7542c        	ld	21548,a
3140                     ; 634       CAN_Id = CAN_Id>>8;
3142  0816 96            	ldw	x,sp
3143  0817 1c0009        	addw	x,#OFST+3
3144  081a a608          	ld	a,#8
3145  081c cd0000        	call	c_lgursh
3147                     ; 635       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
3149  081f 7b0c          	ld	a,(OFST+6,sp)
3150  0821 c7542b        	ld	21547,a
3151                     ; 636       CAN_Id = CAN_Id>>8;
3153  0824 96            	ldw	x,sp
3154  0825 1c0009        	addw	x,#OFST+3
3155  0828 a608          	ld	a,#8
3156  082a cd0000        	call	c_lgursh
3158                     ; 637       CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
3160  082d 7b0c          	ld	a,(OFST+6,sp)
3161  082f 1a0d          	or	a,(OFST+7,sp)
3162  0831 1a0e          	or	a,(OFST+8,sp)
3163  0833 c7542a        	ld	21546,a
3165  0836 203a          	jra	L7711
3166  0838               L5711:
3167                     ; 641       CAN_Id &= (uint16_t)CAN_STDID_SIZE;
3169  0838 7b0b          	ld	a,(OFST+5,sp)
3170  083a a407          	and	a,#7
3171  083c 6b0b          	ld	(OFST+5,sp),a
3172  083e 0f0a          	clr	(OFST+4,sp)
3173  0840 0f09          	clr	(OFST+3,sp)
3174                     ; 642       CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
3176  0842 7b0e          	ld	a,(OFST+8,sp)
3177  0844 b703          	ld	c_lreg+3,a
3178  0846 3f02          	clr	c_lreg+2
3179  0848 3f01          	clr	c_lreg+1
3180  084a 3f00          	clr	c_lreg
3181  084c 96            	ldw	x,sp
3182  084d 1c0001        	addw	x,#OFST-5
3183  0850 cd0000        	call	c_rtol
3186  0853 96            	ldw	x,sp
3187  0854 1c0009        	addw	x,#OFST+3
3188  0857 cd0000        	call	c_ltor
3190  085a a606          	ld	a,#6
3191  085c cd0000        	call	c_lursh
3193  085f 96            	ldw	x,sp
3194  0860 1c0001        	addw	x,#OFST-5
3195  0863 cd0000        	call	c_lor
3197  0866 b603          	ld	a,c_lreg+3
3198  0868 c7542a        	ld	21546,a
3199                     ; 643       CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
3201  086b 7b0c          	ld	a,(OFST+6,sp)
3202  086d 48            	sll	a
3203  086e 48            	sll	a
3204  086f c7542b        	ld	21547,a
3205  0872               L7711:
3206                     ; 647     CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
3208  0872 c65429        	ld	a,21545
3209  0875 a4f0          	and	a,#240
3210  0877 c75429        	ld	21545,a
3211                     ; 649     CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
3213  087a c65429        	ld	a,21545
3214  087d 1a0f          	or	a,(OFST+9,sp)
3215  087f c75429        	ld	21545,a
3216                     ; 651     CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
3218  0882 1e10          	ldw	x,(OFST+10,sp)
3219  0884 f6            	ld	a,(x)
3220  0885 c7542e        	ld	21550,a
3221                     ; 652     CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
3223  0888 1e10          	ldw	x,(OFST+10,sp)
3224  088a e601          	ld	a,(1,x)
3225  088c c7542f        	ld	21551,a
3226                     ; 653     CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
3228  088f 1e10          	ldw	x,(OFST+10,sp)
3229  0891 e602          	ld	a,(2,x)
3230  0893 c75430        	ld	21552,a
3231                     ; 654     CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
3233  0896 1e10          	ldw	x,(OFST+10,sp)
3234  0898 e603          	ld	a,(3,x)
3235  089a c75431        	ld	21553,a
3236                     ; 655     CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3238  089d 1e10          	ldw	x,(OFST+10,sp)
3239  089f e604          	ld	a,(4,x)
3240  08a1 c75432        	ld	21554,a
3241                     ; 656     CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3243  08a4 1e10          	ldw	x,(OFST+10,sp)
3244  08a6 e605          	ld	a,(5,x)
3245  08a8 c75433        	ld	21555,a
3246                     ; 657     CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3248  08ab 1e10          	ldw	x,(OFST+10,sp)
3249  08ad e606          	ld	a,(6,x)
3250  08af c75434        	ld	21556,a
3251                     ; 658     CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3253  08b2 1e10          	ldw	x,(OFST+10,sp)
3254  08b4 e607          	ld	a,(7,x)
3255  08b6 c75435        	ld	21557,a
3256                     ; 660     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3258  08b9 72105428      	bset	21544,#0
3259  08bd               L3711:
3260                     ; 663   CAN_SelectPage(can_page);
3262  08bd 7b05          	ld	a,(OFST-1,sp)
3263  08bf cd106d        	call	_CAN_SelectPage
3265                     ; 664   return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3267  08c2 7b06          	ld	a,(OFST+0,sp)
3270  08c4 5b06          	addw	sp,#6
3271  08c6 81            	ret
3358                     ; 672 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3358                     ; 673 {
3359                     	switch	.text
3360  08c7               _CAN_TransmitStatus:
3362  08c7 88            	push	a
3363  08c8 88            	push	a
3364       00000001      OFST:	set	1
3367                     ; 675   CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3369                     ; 676   uint8_t tmpstate=0;
3371  08c9 0f01          	clr	(OFST+0,sp)
3373                     ; 679   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3375  08cb 4d            	tnz	a
3376  08cc 2708          	jreq	L042
3377  08ce a101          	cp	a,#1
3378  08d0 2704          	jreq	L042
3379  08d2 a105          	cp	a,#5
3380  08d4 2603          	jrne	L632
3381  08d6               L042:
3382  08d6 4f            	clr	a
3383  08d7 2010          	jra	L242
3384  08d9               L632:
3385  08d9 ae02a7        	ldw	x,#679
3386  08dc 89            	pushw	x
3387  08dd ae0000        	ldw	x,#0
3388  08e0 89            	pushw	x
3389  08e1 ae0008        	ldw	x,#L103
3390  08e4 cd0000        	call	_assert_failed
3392  08e7 5b04          	addw	sp,#4
3393  08e9               L242:
3394                     ; 681   switch (CAN_TransmitMailbox)
3396  08e9 7b02          	ld	a,(OFST+1,sp)
3398                     ; 694     break;
3399  08eb 4d            	tnz	a
3400  08ec 2709          	jreq	L1021
3401  08ee 4a            	dec	a
3402  08ef 2718          	jreq	L3021
3403  08f1 a004          	sub	a,#4
3404  08f3 2728          	jreq	L5021
3405  08f5               L7021:
3406                     ; 692   default:
3406                     ; 693     tstate = CAN_TxStatus_Failed;
3408                     ; 694     break;
3410  08f5 203a          	jra	L5621
3411  08f7               L1021:
3412                     ; 683   case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3414  08f7 c65422        	ld	a,21538
3415  08fa a411          	and	a,#17
3416  08fc 6b01          	ld	(OFST+0,sp),a
3418                     ; 684   tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3420  08fe c65423        	ld	a,21539
3421  0901 a404          	and	a,#4
3422  0903 1a01          	or	a,(OFST+0,sp)
3423  0905 6b01          	ld	(OFST+0,sp),a
3425                     ; 685   break;
3427  0907 2028          	jra	L5621
3428  0909               L3021:
3429                     ; 686   case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3431  0909 c65422        	ld	a,21538
3432  090c a422          	and	a,#34
3433  090e 44            	srl	a
3434  090f 6b01          	ld	(OFST+0,sp),a
3436                     ; 687   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3438  0911 c65423        	ld	a,21539
3439  0914 a408          	and	a,#8
3440  0916 44            	srl	a
3441  0917 1a01          	or	a,(OFST+0,sp)
3442  0919 6b01          	ld	(OFST+0,sp),a
3444                     ; 688   break;
3446  091b 2014          	jra	L5621
3447  091d               L5021:
3448                     ; 689   case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3450  091d c65422        	ld	a,21538
3451  0920 a444          	and	a,#68
3452  0922 44            	srl	a
3453  0923 44            	srl	a
3454  0924 6b01          	ld	(OFST+0,sp),a
3456                     ; 690   tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3458  0926 c65423        	ld	a,21539
3459  0929 a410          	and	a,#16
3460  092b 44            	srl	a
3461  092c 44            	srl	a
3462  092d 1a01          	or	a,(OFST+0,sp)
3463  092f 6b01          	ld	(OFST+0,sp),a
3465                     ; 691   break;
3467  0931               L5621:
3468                     ; 697   switch (tmpstate)
3470  0931 7b01          	ld	a,(OFST+0,sp)
3472                     ; 713     break;
3473  0933 4d            	tnz	a
3474  0934 2711          	jreq	L1121
3475  0936 a004          	sub	a,#4
3476  0938 271f          	jreq	L7121
3477  093a 4a            	dec	a
3478  093b 2710          	jreq	L3121
3479  093d a010          	sub	a,#16
3480  093f 2712          	jreq	L5121
3481  0941               L1221:
3482                     ; 711   default:
3482                     ; 712     tstate = CAN_TxStatus_Failed;
3484  0941 a6f0          	ld	a,#240
3485  0943 6b01          	ld	(OFST+0,sp),a
3487                     ; 713     break;
3489  0945 2016          	jra	L1721
3490  0947               L1121:
3491                     ; 700   case (0x00): tstate = CAN_TxStatus_Pending;
3493  0947 a6f2          	ld	a,#242
3494  0949 6b01          	ld	(OFST+0,sp),a
3496                     ; 701   break;
3498  094b 2010          	jra	L1721
3499  094d               L3121:
3500                     ; 703   case (0x05): tstate = CAN_TxStatus_Failed;
3502  094d a6f0          	ld	a,#240
3503  094f 6b01          	ld	(OFST+0,sp),a
3505                     ; 704   break;
3507  0951 200a          	jra	L1721
3508  0953               L5121:
3509                     ; 706   case (0x15): tstate = CAN_TxStatus_Ok;
3511  0953 a6f1          	ld	a,#241
3512  0955 6b01          	ld	(OFST+0,sp),a
3514                     ; 707   break;
3516  0957 2004          	jra	L1721
3517  0959               L7121:
3518                     ; 709   case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3520  0959 a6f5          	ld	a,#245
3521  095b 6b01          	ld	(OFST+0,sp),a
3523                     ; 710   break;
3525  095d               L1721:
3526                     ; 716   return (CAN_TxStatus_TypeDef)tstate;
3528  095d 7b01          	ld	a,(OFST+0,sp)
3531  095f 85            	popw	x
3532  0960 81            	ret
3581                     ; 724 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3581                     ; 725 {
3582                     	switch	.text
3583  0961               _CAN_CancelTransmit:
3585  0961 88            	push	a
3586  0962 88            	push	a
3587       00000001      OFST:	set	1
3590                     ; 726   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3592  0963 cd1069        	call	_CAN_GetSelectedPage
3594  0966 6b01          	ld	(OFST+0,sp),a
3596                     ; 728   assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3598  0968 0d02          	tnz	(OFST+1,sp)
3599  096a 270c          	jreq	L052
3600  096c 7b02          	ld	a,(OFST+1,sp)
3601  096e a101          	cp	a,#1
3602  0970 2706          	jreq	L052
3603  0972 7b02          	ld	a,(OFST+1,sp)
3604  0974 a105          	cp	a,#5
3605  0976 2603          	jrne	L642
3606  0978               L052:
3607  0978 4f            	clr	a
3608  0979 2010          	jra	L252
3609  097b               L642:
3610  097b ae02d8        	ldw	x,#728
3611  097e 89            	pushw	x
3612  097f ae0000        	ldw	x,#0
3613  0982 89            	pushw	x
3614  0983 ae0008        	ldw	x,#L103
3615  0986 cd0000        	call	_assert_failed
3617  0989 5b04          	addw	sp,#4
3618  098b               L252:
3619                     ; 730   CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3621  098b 7b02          	ld	a,(OFST+1,sp)
3622  098d c75427        	ld	21543,a
3623                     ; 732   CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3625  0990 72125428      	bset	21544,#1
3626                     ; 734   CAN_SelectPage(can_page);
3628  0994 7b01          	ld	a,(OFST+0,sp)
3629  0996 cd106d        	call	_CAN_SelectPage
3631                     ; 735 }
3634  0999 85            	popw	x
3635  099a 81            	ret
3658                     ; 742 void CAN_FIFORelease(void)
3658                     ; 743 {
3659                     	switch	.text
3660  099b               _CAN_FIFORelease:
3664                     ; 745   CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3666  099b 35205424      	mov	21540,#32
3667                     ; 746 }
3670  099f 81            	ret
3744                     ; 752 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3744                     ; 753 {
3745                     	switch	.text
3746  09a0               _CAN_MessagePending:
3748  09a0 88            	push	a
3749       00000001      OFST:	set	1
3752                     ; 754   CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3754                     ; 755   msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3756  09a1 c65424        	ld	a,21540
3757  09a4 a403          	and	a,#3
3758  09a6 6b01          	ld	(OFST+0,sp),a
3760                     ; 756   return (CAN_NbrPendingMessage_TypeDef)msgpending;
3762  09a8 7b01          	ld	a,(OFST+0,sp)
3765  09aa 5b01          	addw	sp,#1
3766  09ac 81            	ret
3837                     ; 767 void CAN_Receive(void)
3837                     ; 768 {
3838                     	switch	.text
3839  09ad               _CAN_Receive:
3841  09ad 520d          	subw	sp,#13
3842       0000000d      OFST:	set	13
3845                     ; 769   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3847  09af cd1069        	call	_CAN_GetSelectedPage
3849  09b2 6b01          	ld	(OFST-12,sp),a
3851                     ; 770   uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3857                     ; 773   CAN->PSR = CAN_Page_RxFifo;
3859  09b4 35075427      	mov	21543,#7
3860                     ; 776   _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3862  09b8 c6542a        	ld	a,21546
3863  09bb a440          	and	a,#64
3864  09bd b704          	ld	__IDE,a
3865                     ; 777   if (_IDE != CAN_Id_Standard)
3867  09bf 3d04          	tnz	__IDE
3868  09c1 2602          	jrne	L262
3869  09c3 207d          	jp	L1141
3870  09c5               L262:
3871                     ; 779     temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3873  09c5 c6542c        	ld	a,21548
3874  09c8 5f            	clrw	x
3875  09c9 97            	ld	xl,a
3876  09ca 90ae0100      	ldw	y,#256
3877  09ce cd0000        	call	c_umul
3879  09d1 96            	ldw	x,sp
3880  09d2 1c0006        	addw	x,#OFST-7
3881  09d5 cd0000        	call	c_rtol
3884                     ; 780     temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3886  09d8 c6542b        	ld	a,21547
3887  09db b703          	ld	c_lreg+3,a
3888  09dd 3f02          	clr	c_lreg+2
3889  09df 3f01          	clr	c_lreg+1
3890  09e1 3f00          	clr	c_lreg
3891  09e3 be02          	ldw	x,c_lreg+2
3892  09e5 bf00          	ldw	c_lreg,x
3893  09e7 5f            	clrw	x
3894  09e8 bf02          	ldw	c_lreg+2,x
3895  09ea 96            	ldw	x,sp
3896  09eb 1c000a        	addw	x,#OFST-3
3897  09ee cd0000        	call	c_rtol
3900                     ; 781     temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3902  09f1 c6542a        	ld	a,21546
3903  09f4 b703          	ld	c_lreg+3,a
3904  09f6 3f02          	clr	c_lreg+2
3905  09f8 3f01          	clr	c_lreg+1
3906  09fa 3f00          	clr	c_lreg
3907  09fc b603          	ld	a,c_lreg+3
3908  09fe a41f          	and	a,#31
3909  0a00 b703          	ld	c_lreg+3,a
3910  0a02 3f02          	clr	c_lreg+2
3911  0a04 3f01          	clr	c_lreg+1
3912  0a06 3f00          	clr	c_lreg
3913  0a08 a618          	ld	a,#24
3914  0a0a cd0000        	call	c_llsh
3916  0a0d 96            	ldw	x,sp
3917  0a0e 1c0002        	addw	x,#OFST-11
3918  0a11 cd0000        	call	c_rtol
3921                     ; 783     _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3923  0a14 c6542d        	ld	a,21549
3924  0a17 b703          	ld	c_lreg+3,a
3925  0a19 3f02          	clr	c_lreg+2
3926  0a1b 3f01          	clr	c_lreg+1
3927  0a1d 3f00          	clr	c_lreg
3928  0a1f 96            	ldw	x,sp
3929  0a20 1c0006        	addw	x,#OFST-7
3930  0a23 cd0000        	call	c_lor
3932  0a26 96            	ldw	x,sp
3933  0a27 1c000a        	addw	x,#OFST-3
3934  0a2a cd0000        	call	c_lor
3936  0a2d 96            	ldw	x,sp
3937  0a2e 1c0002        	addw	x,#OFST-11
3938  0a31 cd0000        	call	c_lor
3940  0a34 b600          	ld	a,c_lreg
3941  0a36 a41f          	and	a,#31
3942  0a38 b700          	ld	c_lreg,a
3943  0a3a ae0000        	ldw	x,#__Id
3944  0a3d cd0000        	call	c_rtol
3947  0a40 204c          	jra	L3141
3948  0a42               L1141:
3949                     ; 787     temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3951  0a42 c6542a        	ld	a,21546
3952  0a45 5f            	clrw	x
3953  0a46 a41f          	and	a,#31
3954  0a48 5f            	clrw	x
3955  0a49 02            	rlwa	x,a
3956  0a4a 58            	sllw	x
3957  0a4b 58            	sllw	x
3958  0a4c 58            	sllw	x
3959  0a4d 58            	sllw	x
3960  0a4e 58            	sllw	x
3961  0a4f 58            	sllw	x
3962  0a50 cd0000        	call	c_uitolx
3964  0a53 96            	ldw	x,sp
3965  0a54 1c0006        	addw	x,#OFST-7
3966  0a57 cd0000        	call	c_rtol
3969                     ; 788     temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3971  0a5a c6542b        	ld	a,21547
3972  0a5d 5f            	clrw	x
3973  0a5e 97            	ld	xl,a
3974  0a5f 54            	srlw	x
3975  0a60 54            	srlw	x
3976  0a61 9f            	ld	a,xl
3977  0a62 5f            	clrw	x
3978  0a63 a43f          	and	a,#63
3979  0a65 5f            	clrw	x
3980  0a66 cd0000        	call	c_uitol
3982  0a69 96            	ldw	x,sp
3983  0a6a 1c000a        	addw	x,#OFST-3
3984  0a6d cd0000        	call	c_rtol
3987                     ; 790     _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3989  0a70 96            	ldw	x,sp
3990  0a71 1c0006        	addw	x,#OFST-7
3991  0a74 cd0000        	call	c_ltor
3993  0a77 96            	ldw	x,sp
3994  0a78 1c000a        	addw	x,#OFST-3
3995  0a7b cd0000        	call	c_lor
3997  0a7e b602          	ld	a,c_lreg+2
3998  0a80 a407          	and	a,#7
3999  0a82 b702          	ld	c_lreg+2,a
4000  0a84 3f01          	clr	c_lreg+1
4001  0a86 3f00          	clr	c_lreg
4002  0a88 ae0000        	ldw	x,#__Id
4003  0a8b cd0000        	call	c_rtol
4005  0a8e               L3141:
4006                     ; 793   _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
4008  0a8e c6542a        	ld	a,21546
4009  0a91 a420          	and	a,#32
4010  0a93 b705          	ld	__RTR,a
4011                     ; 796   _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
4013  0a95 c65429        	ld	a,21545
4014  0a98 a40f          	and	a,#15
4015  0a9a b706          	ld	__DLC,a
4016                     ; 799   _FMI = CAN->Page.RxFIFO.MFMI;
4018  0a9c 555428000f    	mov	__FMI,21544
4019                     ; 802   _Data[0] = CAN->Page.RxFIFO.MDAR1;
4021  0aa1 55542e0007    	mov	__Data,21550
4022                     ; 803   _Data[1] = CAN->Page.RxFIFO.MDAR2;
4024  0aa6 55542f0008    	mov	__Data+1,21551
4025                     ; 804   _Data[2] = CAN->Page.RxFIFO.MDAR3;
4027  0aab 5554300009    	mov	__Data+2,21552
4028                     ; 805   _Data[3] = CAN->Page.RxFIFO.MDAR4;
4030  0ab0 555431000a    	mov	__Data+3,21553
4031                     ; 806   _Data[4] = CAN->Page.RxFIFO.MDAR5;
4033  0ab5 555432000b    	mov	__Data+4,21554
4034                     ; 807   _Data[5] = CAN->Page.RxFIFO.MDAR6;
4036  0aba 555433000c    	mov	__Data+5,21555
4037                     ; 808   _Data[6] = CAN->Page.RxFIFO.MDAR7;
4039  0abf 555434000d    	mov	__Data+6,21556
4040                     ; 809   _Data[7] = CAN->Page.RxFIFO.MDAR8;
4042  0ac4 555435000e    	mov	__Data+7,21557
4043                     ; 812   CAN_FIFORelease();
4045  0ac9 cd099b        	call	_CAN_FIFORelease
4047                     ; 814   CAN_SelectPage(can_page);
4049  0acc 7b01          	ld	a,(OFST-12,sp)
4050  0ace cd106d        	call	_CAN_SelectPage
4052                     ; 815 }
4055  0ad1 5b0d          	addw	sp,#13
4056  0ad3 81            	ret
4080                     ; 825 uint32_t CAN_GetReceivedId(void)
4080                     ; 826 {
4081                     	switch	.text
4082  0ad4               _CAN_GetReceivedId:
4086                     ; 827   return (_Id);
4088  0ad4 ae0000        	ldw	x,#__Id
4089  0ad7 cd0000        	call	c_ltor
4093  0ada 81            	ret
4118                     ; 838 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
4118                     ; 839 {
4119                     	switch	.text
4120  0adb               _CAN_GetReceivedIDE:
4124                     ; 840   return (CAN_Id_TypeDef)(_IDE);
4126  0adb b604          	ld	a,__IDE
4129  0add 81            	ret
4154                     ; 851 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
4154                     ; 852 {
4155                     	switch	.text
4156  0ade               _CAN_GetReceivedRTR:
4160                     ; 853   return (CAN_RTR_TypeDef)(_RTR);
4162  0ade b605          	ld	a,__RTR
4165  0ae0 81            	ret
4189                     ; 864 uint8_t CAN_GetReceivedDLC(void)
4189                     ; 865 {
4190                     	switch	.text
4191  0ae1               _CAN_GetReceivedDLC:
4195                     ; 866   return (_DLC);
4197  0ae1 b606          	ld	a,__DLC
4200  0ae3 81            	ret
4237                     ; 878 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
4237                     ; 879 {
4238                     	switch	.text
4239  0ae4               _CAN_GetReceivedData:
4241  0ae4 88            	push	a
4242       00000000      OFST:	set	0
4245                     ; 880   assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
4247  0ae5 a109          	cp	a,#9
4248  0ae7 2403          	jruge	L672
4249  0ae9 4f            	clr	a
4250  0aea 2010          	jra	L003
4251  0aec               L672:
4252  0aec ae0370        	ldw	x,#880
4253  0aef 89            	pushw	x
4254  0af0 ae0000        	ldw	x,#0
4255  0af3 89            	pushw	x
4256  0af4 ae0008        	ldw	x,#L103
4257  0af7 cd0000        	call	_assert_failed
4259  0afa 5b04          	addw	sp,#4
4260  0afc               L003:
4261                     ; 881   return (_Data[CAN_DataIndex]);
4263  0afc 7b01          	ld	a,(OFST+1,sp)
4264  0afe 5f            	clrw	x
4265  0aff 97            	ld	xl,a
4266  0b00 e607          	ld	a,(__Data,x)
4269  0b02 5b01          	addw	sp,#1
4270  0b04 81            	ret
4294                     ; 892 uint8_t CAN_GetReceivedFMI(void)
4294                     ; 893 {
4295                     	switch	.text
4296  0b05               _CAN_GetReceivedFMI:
4300                     ; 894   return (_FMI);
4302  0b05 b60f          	ld	a,__FMI
4305  0b07 81            	ret
4352                     ; 902 uint16_t CAN_GetMessageTimeStamp(void)
4352                     ; 903 {
4353                     	switch	.text
4354  0b08               _CAN_GetMessageTimeStamp:
4356  0b08 5203          	subw	sp,#3
4357       00000003      OFST:	set	3
4360                     ; 904   uint16_t timestamp = 0;
4362                     ; 905   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4364  0b0a cd1069        	call	_CAN_GetSelectedPage
4366  0b0d 6b01          	ld	(OFST-2,sp),a
4368                     ; 908   CAN->PSR = CAN_Page_RxFifo;
4370  0b0f 35075427      	mov	21543,#7
4371                     ; 910   timestamp = CAN->Page.RxFIFO.MTSRL;
4373  0b13 c65436        	ld	a,21558
4374  0b16 5f            	clrw	x
4375  0b17 97            	ld	xl,a
4376  0b18 1f02          	ldw	(OFST-1,sp),x
4378                     ; 911   timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4380  0b1a c65437        	ld	a,21559
4381  0b1d 5f            	clrw	x
4382  0b1e 97            	ld	xl,a
4383  0b1f 4f            	clr	a
4384  0b20 02            	rlwa	x,a
4385  0b21 01            	rrwa	x,a
4386  0b22 1a03          	or	a,(OFST+0,sp)
4387  0b24 01            	rrwa	x,a
4388  0b25 1a02          	or	a,(OFST-1,sp)
4389  0b27 01            	rrwa	x,a
4390  0b28 1f02          	ldw	(OFST-1,sp),x
4392                     ; 914   CAN_SelectPage(can_page);
4394  0b2a 7b01          	ld	a,(OFST-2,sp)
4395  0b2c cd106d        	call	_CAN_SelectPage
4397                     ; 916   return (uint16_t)(timestamp);
4399  0b2f 1e02          	ldw	x,(OFST-1,sp)
4402  0b31 5b03          	addw	sp,#3
4403  0b33 81            	ret
4459                     ; 924 CAN_Sleep_TypeDef CAN_Sleep(void)
4459                     ; 925 {
4460                     	switch	.text
4461  0b34               _CAN_Sleep:
4463  0b34 88            	push	a
4464       00000001      OFST:	set	1
4467                     ; 926   CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4469  0b35 0f01          	clr	(OFST+0,sp)
4471                     ; 929   CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4473  0b37 c65420        	ld	a,21536
4474  0b3a a4fe          	and	a,#254
4475  0b3c aa02          	or	a,#2
4476  0b3e c75420        	ld	21536,a
4477                     ; 932   if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4479  0b41 c65421        	ld	a,21537
4480  0b44 a403          	and	a,#3
4481  0b46 a102          	cp	a,#2
4482  0b48 2604          	jrne	L3551
4483                     ; 935     sleepstatus =  CAN_Sleep_Ok;
4485  0b4a a601          	ld	a,#1
4486  0b4c 6b01          	ld	(OFST+0,sp),a
4488  0b4e               L3551:
4489                     ; 939   return (CAN_Sleep_TypeDef) sleepstatus;
4491  0b4e 7b01          	ld	a,(OFST+0,sp)
4494  0b50 5b01          	addw	sp,#1
4495  0b52 81            	ret
4551                     ; 947 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4551                     ; 948 {
4552                     	switch	.text
4553  0b53               _CAN_WakeUp:
4555  0b53 88            	push	a
4556       00000001      OFST:	set	1
4559                     ; 949   CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4561  0b54 0f01          	clr	(OFST+0,sp)
4563                     ; 952   CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4565  0b56 72135420      	bres	21536,#1
4566                     ; 955   if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4568  0b5a c65421        	ld	a,21537
4569  0b5d a402          	and	a,#2
4570  0b5f a102          	cp	a,#2
4571  0b61 2704          	jreq	L3061
4572                     ; 958     wakeupstatus = CAN_WakeUp_Ok;
4574  0b63 a601          	ld	a,#1
4575  0b65 6b01          	ld	(OFST+0,sp),a
4577  0b67               L3061:
4578                     ; 962   return (CAN_WakeUp_TypeDef)wakeupstatus;
4580  0b67 7b01          	ld	a,(OFST+0,sp)
4583  0b69 5b01          	addw	sp,#1
4584  0b6b 81            	ret
4692                     ; 974 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4692                     ; 975 {
4693                     	switch	.text
4694  0b6c               _CAN_OperatingModeRequest:
4696  0b6c 88            	push	a
4697  0b6d 5203          	subw	sp,#3
4698       00000003      OFST:	set	3
4701                     ; 976   uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4703  0b6f aeffff        	ldw	x,#65535
4704  0b72 1f02          	ldw	(OFST-1,sp),x
4706                     ; 977   uint8_t modestatus = 0;
4708                     ; 979   assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4710  0b74 4d            	tnz	a
4711  0b75 2708          	jreq	L613
4712  0b77 a101          	cp	a,#1
4713  0b79 2704          	jreq	L613
4714  0b7b a102          	cp	a,#2
4715  0b7d 2603          	jrne	L413
4716  0b7f               L613:
4717  0b7f 4f            	clr	a
4718  0b80 2010          	jra	L023
4719  0b82               L413:
4720  0b82 ae03d3        	ldw	x,#979
4721  0b85 89            	pushw	x
4722  0b86 ae0000        	ldw	x,#0
4723  0b89 89            	pushw	x
4724  0b8a ae0008        	ldw	x,#L103
4725  0b8d cd0000        	call	_assert_failed
4727  0b90 5b04          	addw	sp,#4
4728  0b92               L023:
4729                     ; 981   if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4731  0b92 0d04          	tnz	(OFST+1,sp)
4732  0b94 2633          	jrne	L5561
4733                     ; 984     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4735  0b96 c65420        	ld	a,21536
4736  0b99 a4fd          	and	a,#253
4737  0b9b aa01          	or	a,#1
4738  0b9d c75420        	ld	21536,a
4740  0ba0 2007          	jra	L3661
4741  0ba2               L7561:
4742                     ; 989       timeout--;
4744  0ba2 1e02          	ldw	x,(OFST-1,sp)
4745  0ba4 1d0001        	subw	x,#1
4746  0ba7 1f02          	ldw	(OFST-1,sp),x
4748  0ba9               L3661:
4749                     ; 987     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4751  0ba9 c65421        	ld	a,21537
4752  0bac a403          	and	a,#3
4753  0bae a101          	cp	a,#1
4754  0bb0 2704          	jreq	L7661
4756  0bb2 1e02          	ldw	x,(OFST-1,sp)
4757  0bb4 26ec          	jrne	L7561
4758  0bb6               L7661:
4759                     ; 991     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4761  0bb6 c65421        	ld	a,21537
4762  0bb9 a403          	and	a,#3
4763  0bbb a101          	cp	a,#1
4764  0bbd 2704          	jreq	L1761
4765                     ; 993       modestatus = CAN_ModeStatus_Failed;
4767  0bbf 0f01          	clr	(OFST-2,sp)
4770  0bc1 2074          	jra	L5761
4771  0bc3               L1761:
4772                     ; 997       modestatus = CAN_ModeStatus_Success;  
4774  0bc3 a601          	ld	a,#1
4775  0bc5 6b01          	ld	(OFST-2,sp),a
4777  0bc7 206e          	jra	L5761
4778  0bc9               L5561:
4779                     ; 1001   else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4781  0bc9 7b04          	ld	a,(OFST+1,sp)
4782  0bcb a101          	cp	a,#1
4783  0bcd 262d          	jrne	L7761
4784                     ; 1004     CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4786  0bcf c65420        	ld	a,21536
4787  0bd2 a4fc          	and	a,#252
4788  0bd4 c75420        	ld	21536,a
4790  0bd7 2007          	jra	L3071
4791  0bd9               L1071:
4792                     ; 1009       timeout--;
4794  0bd9 1e02          	ldw	x,(OFST-1,sp)
4795  0bdb 1d0001        	subw	x,#1
4796  0bde 1f02          	ldw	(OFST-1,sp),x
4798  0be0               L3071:
4799                     ; 1007     while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4801  0be0 c65421        	ld	a,21537
4802  0be3 a503          	bcp	a,#3
4803  0be5 2704          	jreq	L7071
4805  0be7 1e02          	ldw	x,(OFST-1,sp)
4806  0be9 26ee          	jrne	L1071
4807  0beb               L7071:
4808                     ; 1011     if ((CAN->MSR & CAN_MODE_MASK) != 0)
4810  0beb c65421        	ld	a,21537
4811  0bee a503          	bcp	a,#3
4812  0bf0 2704          	jreq	L1171
4813                     ; 1013       modestatus = CAN_ModeStatus_Failed;
4815  0bf2 0f01          	clr	(OFST-2,sp)
4818  0bf4 2041          	jra	L5761
4819  0bf6               L1171:
4820                     ; 1017       modestatus = CAN_ModeStatus_Success;  
4822  0bf6 a601          	ld	a,#1
4823  0bf8 6b01          	ld	(OFST-2,sp),a
4825  0bfa 203b          	jra	L5761
4826  0bfc               L7761:
4827                     ; 1020   else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4829  0bfc 7b04          	ld	a,(OFST+1,sp)
4830  0bfe a102          	cp	a,#2
4831  0c00 2633          	jrne	L7171
4832                     ; 1023     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4834  0c02 c65420        	ld	a,21536
4835  0c05 a4fe          	and	a,#254
4836  0c07 aa02          	or	a,#2
4837  0c09 c75420        	ld	21536,a
4839  0c0c 2007          	jra	L5271
4840  0c0e               L1271:
4841                     ; 1028       timeout--;
4843  0c0e 1e02          	ldw	x,(OFST-1,sp)
4844  0c10 1d0001        	subw	x,#1
4845  0c13 1f02          	ldw	(OFST-1,sp),x
4847  0c15               L5271:
4848                     ; 1026     while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4850  0c15 c65421        	ld	a,21537
4851  0c18 a403          	and	a,#3
4852  0c1a a102          	cp	a,#2
4853  0c1c 2704          	jreq	L1371
4855  0c1e 1e02          	ldw	x,(OFST-1,sp)
4856  0c20 26ec          	jrne	L1271
4857  0c22               L1371:
4858                     ; 1030     if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4860  0c22 c65421        	ld	a,21537
4861  0c25 a403          	and	a,#3
4862  0c27 a102          	cp	a,#2
4863  0c29 2704          	jreq	L3371
4864                     ; 1032       modestatus = CAN_ModeStatus_Failed;  
4866  0c2b 0f01          	clr	(OFST-2,sp)
4869  0c2d 2008          	jra	L5761
4870  0c2f               L3371:
4871                     ; 1036       modestatus = CAN_ModeStatus_Success;  
4873  0c2f a601          	ld	a,#1
4874  0c31 6b01          	ld	(OFST-2,sp),a
4876  0c33 2002          	jra	L5761
4877  0c35               L7171:
4878                     ; 1041     modestatus = CAN_ModeStatus_Failed;
4880  0c35 0f01          	clr	(OFST-2,sp)
4882  0c37               L5761:
4883                     ; 1043   return (CAN_ModeStatus_TypeDef)(modestatus);
4885  0c37 7b01          	ld	a,(OFST-2,sp)
4888  0c39 5b04          	addw	sp,#4
4889  0c3b 81            	ret
5008                     ; 1051 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
5008                     ; 1052 {
5009                     	switch	.text
5010  0c3c               _CAN_GetLastErrorCode:
5012  0c3c 89            	pushw	x
5013       00000002      OFST:	set	2
5016                     ; 1053   CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
5018                     ; 1054   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5020  0c3d cd1069        	call	_CAN_GetSelectedPage
5022  0c40 6b01          	ld	(OFST-1,sp),a
5024                     ; 1056   CAN->PSR = CAN_Page_Config;
5026  0c42 35065427      	mov	21543,#6
5027                     ; 1057   errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
5029  0c46 c65428        	ld	a,21544
5030  0c49 a470          	and	a,#112
5031  0c4b 6b02          	ld	(OFST+0,sp),a
5033                     ; 1060   CAN_SelectPage(can_page);
5035  0c4d 7b01          	ld	a,(OFST-1,sp)
5036  0c4f cd106d        	call	_CAN_SelectPage
5038                     ; 1062   return (CAN_ErrorCode_TypeDef)(errcode);
5040  0c52 7b02          	ld	a,(OFST+0,sp)
5043  0c54 85            	popw	x
5044  0c55 81            	ret
5175                     ; 1077 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
5175                     ; 1078 {
5176                     	switch	.text
5177  0c56               _CAN_ClearFlag:
5179  0c56 89            	pushw	x
5180  0c57 88            	push	a
5181       00000001      OFST:	set	1
5184                     ; 1079   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5186                     ; 1081   assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
5188  0c58 a33401        	cpw	x,#13313
5189  0c5b 271e          	jreq	L033
5190  0c5d a33402        	cpw	x,#13314
5191  0c60 2719          	jreq	L033
5192  0c62 a33404        	cpw	x,#13316
5193  0c65 2714          	jreq	L033
5194  0c67 a33208        	cpw	x,#12808
5195  0c6a 270f          	jreq	L033
5196  0c6c a33210        	cpw	x,#12816
5197  0c6f 270a          	jreq	L033
5198  0c71 a33108        	cpw	x,#12552
5199  0c74 2705          	jreq	L033
5200  0c76 a33070        	cpw	x,#12400
5201  0c79 2603          	jrne	L623
5202  0c7b               L033:
5203  0c7b 4f            	clr	a
5204  0c7c 2010          	jra	L233
5205  0c7e               L623:
5206  0c7e ae0439        	ldw	x,#1081
5207  0c81 89            	pushw	x
5208  0c82 ae0000        	ldw	x,#0
5209  0c85 89            	pushw	x
5210  0c86 ae0008        	ldw	x,#L103
5211  0c89 cd0000        	call	_assert_failed
5213  0c8c 5b04          	addw	sp,#4
5214  0c8e               L233:
5215                     ; 1082   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5217  0c8e 7b02          	ld	a,(OFST+1,sp)
5218  0c90 a507          	bcp	a,#7
5219  0c92 2731          	jreq	L3602
5220                     ; 1084     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5222  0c94 1e02          	ldw	x,(OFST+1,sp)
5223  0c96 01            	rrwa	x,a
5224  0c97 a40b          	and	a,#11
5225  0c99 01            	rrwa	x,a
5226  0c9a a402          	and	a,#2
5227  0c9c 01            	rrwa	x,a
5228  0c9d a30000        	cpw	x,#0
5229  0ca0 2707          	jreq	L5602
5230                     ; 1087       CAN->RFR = (uint8_t)(CAN_Flag);
5232  0ca2 7b03          	ld	a,(OFST+2,sp)
5233  0ca4 c75424        	ld	21540,a
5235  0ca7 202e          	jra	L5702
5236  0ca9               L5602:
5237                     ; 1089     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5239  0ca9 1e02          	ldw	x,(OFST+1,sp)
5240  0cab 01            	rrwa	x,a
5241  0cac a403          	and	a,#3
5242  0cae 01            	rrwa	x,a
5243  0caf a404          	and	a,#4
5244  0cb1 01            	rrwa	x,a
5245  0cb2 a30000        	cpw	x,#0
5246  0cb5 2707          	jreq	L1702
5247                     ; 1092       CAN->TSR = (uint8_t)(CAN_Flag);
5249  0cb7 7b03          	ld	a,(OFST+2,sp)
5250  0cb9 c75422        	ld	21538,a
5252  0cbc 2019          	jra	L5702
5253  0cbe               L1702:
5254                     ; 1097       CAN->MSR = (uint8_t)(CAN_Flag);
5256  0cbe 7b03          	ld	a,(OFST+2,sp)
5257  0cc0 c75421        	ld	21537,a
5258  0cc3 2012          	jra	L5702
5259  0cc5               L3602:
5260                     ; 1103     can_page = CAN_GetSelectedPage();
5262  0cc5 cd1069        	call	_CAN_GetSelectedPage
5264  0cc8 6b01          	ld	(OFST+0,sp),a
5266                     ; 1106     CAN->PSR = CAN_Page_Config;
5268  0cca 35065427      	mov	21543,#6
5269                     ; 1107     CAN->Page.Config.ESR = (uint8_t)RESET;
5271  0cce 725f5428      	clr	21544
5272                     ; 1110     CAN_SelectPage(can_page);
5274  0cd2 7b01          	ld	a,(OFST+0,sp)
5275  0cd4 cd106d        	call	_CAN_SelectPage
5277  0cd7               L5702:
5278                     ; 1112 }
5281  0cd7 5b03          	addw	sp,#3
5282  0cd9 81            	ret
5361                     ; 1119 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5361                     ; 1120 {
5362                     	switch	.text
5363  0cda               _CAN_GetFlagStatus:
5365  0cda 89            	pushw	x
5366  0cdb 89            	pushw	x
5367       00000002      OFST:	set	2
5370                     ; 1121   FlagStatus bitstatus = RESET;
5372                     ; 1122   CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5374                     ; 1125   assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5376  0cdc a33401        	cpw	x,#13313
5377  0cdf 2732          	jreq	L043
5378  0ce1 a33402        	cpw	x,#13314
5379  0ce4 272d          	jreq	L043
5380  0ce6 a33404        	cpw	x,#13316
5381  0ce9 2728          	jreq	L043
5382  0ceb a31203        	cpw	x,#4611
5383  0cee 2723          	jreq	L043
5384  0cf0 a33208        	cpw	x,#12808
5385  0cf3 271e          	jreq	L043
5386  0cf5 a33210        	cpw	x,#12816
5387  0cf8 2719          	jreq	L043
5388  0cfa a33108        	cpw	x,#12552
5389  0cfd 2714          	jreq	L043
5390  0cff a31001        	cpw	x,#4097
5391  0d02 270f          	jreq	L043
5392  0d04 a31002        	cpw	x,#4098
5393  0d07 270a          	jreq	L043
5394  0d09 a31004        	cpw	x,#4100
5395  0d0c 2705          	jreq	L043
5396  0d0e a33070        	cpw	x,#12400
5397  0d11 2603          	jrne	L633
5398  0d13               L043:
5399  0d13 4f            	clr	a
5400  0d14 2010          	jra	L243
5401  0d16               L633:
5402  0d16 ae0465        	ldw	x,#1125
5403  0d19 89            	pushw	x
5404  0d1a ae0000        	ldw	x,#0
5405  0d1d 89            	pushw	x
5406  0d1e ae0008        	ldw	x,#L103
5407  0d21 cd0000        	call	_assert_failed
5409  0d24 5b04          	addw	sp,#4
5410  0d26               L243:
5411                     ; 1127   if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5413  0d26 7b03          	ld	a,(OFST+1,sp)
5414  0d28 a507          	bcp	a,#7
5415  0d2a 276d          	jreq	L5312
5416                     ; 1129     if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5418  0d2c 1e03          	ldw	x,(OFST+1,sp)
5419  0d2e 01            	rrwa	x,a
5420  0d2f a40b          	and	a,#11
5421  0d31 01            	rrwa	x,a
5422  0d32 a402          	and	a,#2
5423  0d34 01            	rrwa	x,a
5424  0d35 a30000        	cpw	x,#0
5425  0d38 271b          	jreq	L7312
5426                     ; 1132       if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5428  0d3a c65424        	ld	a,21540
5429  0d3d 5f            	clrw	x
5430  0d3e 97            	ld	xl,a
5431  0d3f 01            	rrwa	x,a
5432  0d40 1404          	and	a,(OFST+2,sp)
5433  0d42 01            	rrwa	x,a
5434  0d43 1403          	and	a,(OFST+1,sp)
5435  0d45 01            	rrwa	x,a
5436  0d46 a30000        	cpw	x,#0
5437  0d49 2706          	jreq	L1412
5438                     ; 1135         bitstatus = SET;
5440  0d4b a601          	ld	a,#1
5441  0d4d 6b02          	ld	(OFST+0,sp),a
5444  0d4f 206f          	jra	L3612
5445  0d51               L1412:
5446                     ; 1140         bitstatus = RESET;
5448  0d51 0f02          	clr	(OFST+0,sp)
5450  0d53 206b          	jra	L3612
5451  0d55               L7312:
5452                     ; 1144     else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5454  0d55 1e03          	ldw	x,(OFST+1,sp)
5455  0d57 01            	rrwa	x,a
5456  0d58 a403          	and	a,#3
5457  0d5a 01            	rrwa	x,a
5458  0d5b a404          	and	a,#4
5459  0d5d 01            	rrwa	x,a
5460  0d5e a30000        	cpw	x,#0
5461  0d61 271b          	jreq	L7412
5462                     ; 1147       if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5464  0d63 c65422        	ld	a,21538
5465  0d66 5f            	clrw	x
5466  0d67 97            	ld	xl,a
5467  0d68 01            	rrwa	x,a
5468  0d69 1404          	and	a,(OFST+2,sp)
5469  0d6b 01            	rrwa	x,a
5470  0d6c 1403          	and	a,(OFST+1,sp)
5471  0d6e 01            	rrwa	x,a
5472  0d6f a30000        	cpw	x,#0
5473  0d72 2706          	jreq	L1512
5474                     ; 1150         bitstatus = SET;
5476  0d74 a601          	ld	a,#1
5477  0d76 6b02          	ld	(OFST+0,sp),a
5480  0d78 2046          	jra	L3612
5481  0d7a               L1512:
5482                     ; 1155         bitstatus = RESET;
5484  0d7a 0f02          	clr	(OFST+0,sp)
5486  0d7c 2042          	jra	L3612
5487  0d7e               L7412:
5488                     ; 1161       if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5490  0d7e c65421        	ld	a,21537
5491  0d81 5f            	clrw	x
5492  0d82 97            	ld	xl,a
5493  0d83 01            	rrwa	x,a
5494  0d84 1404          	and	a,(OFST+2,sp)
5495  0d86 01            	rrwa	x,a
5496  0d87 1403          	and	a,(OFST+1,sp)
5497  0d89 01            	rrwa	x,a
5498  0d8a a30000        	cpw	x,#0
5499  0d8d 2706          	jreq	L7512
5500                     ; 1164         bitstatus = SET;
5502  0d8f a601          	ld	a,#1
5503  0d91 6b02          	ld	(OFST+0,sp),a
5506  0d93 202b          	jra	L3612
5507  0d95               L7512:
5508                     ; 1169         bitstatus = RESET;
5510  0d95 0f02          	clr	(OFST+0,sp)
5512  0d97 2027          	jra	L3612
5513  0d99               L5312:
5514                     ; 1176     can_page = CAN_GetSelectedPage();
5516  0d99 cd1069        	call	_CAN_GetSelectedPage
5518  0d9c 6b01          	ld	(OFST-1,sp),a
5520                     ; 1178     CAN->PSR = CAN_Page_Config;
5522  0d9e 35065427      	mov	21543,#6
5523                     ; 1179     if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5525  0da2 c65428        	ld	a,21544
5526  0da5 5f            	clrw	x
5527  0da6 97            	ld	xl,a
5528  0da7 01            	rrwa	x,a
5529  0da8 1404          	and	a,(OFST+2,sp)
5530  0daa 01            	rrwa	x,a
5531  0dab 1403          	and	a,(OFST+1,sp)
5532  0dad 01            	rrwa	x,a
5533  0dae a30000        	cpw	x,#0
5534  0db1 2706          	jreq	L5612
5535                     ; 1182       bitstatus = SET;
5537  0db3 a601          	ld	a,#1
5538  0db5 6b02          	ld	(OFST+0,sp),a
5541  0db7 2002          	jra	L7612
5542  0db9               L5612:
5543                     ; 1187       bitstatus = RESET;
5545  0db9 0f02          	clr	(OFST+0,sp)
5547  0dbb               L7612:
5548                     ; 1190     CAN_SelectPage(can_page);
5550  0dbb 7b01          	ld	a,(OFST-1,sp)
5551  0dbd cd106d        	call	_CAN_SelectPage
5553  0dc0               L3612:
5554                     ; 1195   return  (FlagStatus)bitstatus;
5556  0dc0 7b02          	ld	a,(OFST+0,sp)
5559  0dc2 5b04          	addw	sp,#4
5560  0dc4 81            	ret
5620                     ; 1203 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5620                     ; 1204 {
5621                     	switch	.text
5622  0dc5               _CAN_GetITStatus:
5624  0dc5 89            	pushw	x
5625  0dc6 89            	pushw	x
5626       00000002      OFST:	set	2
5629                     ; 1205   ITStatus pendingbitstatus = RESET;
5631                     ; 1206   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5633  0dc7 cd1069        	call	_CAN_GetSelectedPage
5635  0dca 6b01          	ld	(OFST-1,sp),a
5637                     ; 1209   assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5639  0dcc 1e03          	ldw	x,(OFST+1,sp)
5640  0dce a30001        	cpw	x,#1
5641  0dd1 273f          	jreq	L053
5642  0dd3 1e03          	ldw	x,(OFST+1,sp)
5643  0dd5 a30002        	cpw	x,#2
5644  0dd8 2738          	jreq	L053
5645  0dda 1e03          	ldw	x,(OFST+1,sp)
5646  0ddc a30004        	cpw	x,#4
5647  0ddf 2731          	jreq	L053
5648  0de1 1e03          	ldw	x,(OFST+1,sp)
5649  0de3 a30008        	cpw	x,#8
5650  0de6 272a          	jreq	L053
5651  0de8 1e03          	ldw	x,(OFST+1,sp)
5652  0dea a30080        	cpw	x,#128
5653  0ded 2723          	jreq	L053
5654  0def 1e03          	ldw	x,(OFST+1,sp)
5655  0df1 a34000        	cpw	x,#16384
5656  0df4 271c          	jreq	L053
5657  0df6 1e03          	ldw	x,(OFST+1,sp)
5658  0df8 a30100        	cpw	x,#256
5659  0dfb 2715          	jreq	L053
5660  0dfd 1e03          	ldw	x,(OFST+1,sp)
5661  0dff a30200        	cpw	x,#512
5662  0e02 270e          	jreq	L053
5663  0e04 1e03          	ldw	x,(OFST+1,sp)
5664  0e06 a30400        	cpw	x,#1024
5665  0e09 2707          	jreq	L053
5666  0e0b 1e03          	ldw	x,(OFST+1,sp)
5667  0e0d a30800        	cpw	x,#2048
5668  0e10 2603          	jrne	L643
5669  0e12               L053:
5670  0e12 4f            	clr	a
5671  0e13 2010          	jra	L253
5672  0e15               L643:
5673  0e15 ae04b9        	ldw	x,#1209
5674  0e18 89            	pushw	x
5675  0e19 ae0000        	ldw	x,#0
5676  0e1c 89            	pushw	x
5677  0e1d ae0008        	ldw	x,#L103
5678  0e20 cd0000        	call	_assert_failed
5680  0e23 5b04          	addw	sp,#4
5681  0e25               L253:
5682                     ; 1212   switch (CAN_IT)
5684  0e25 1e03          	ldw	x,(OFST+1,sp)
5686                     ; 1325     break;
5687  0e27 5a            	decw	x
5688  0e28 2746          	jreq	L1712
5689  0e2a 5a            	decw	x
5690  0e2b 2760          	jreq	L3712
5691  0e2d 1d0002        	subw	x,#2
5692  0e30 2778          	jreq	L5712
5693  0e32 1d0004        	subw	x,#4
5694  0e35 2603          	jrne	L453
5695  0e37 cc0ec7        	jp	L7712
5696  0e3a               L453:
5697  0e3a 1d0078        	subw	x,#120
5698  0e3d 2603          	jrne	L653
5699  0e3f cc0ee4        	jp	L1022
5700  0e42               L653:
5701  0e42 1d0080        	subw	x,#128
5702  0e45 2603          	jrne	L063
5703  0e47 cc0f1e        	jp	L5022
5704  0e4a               L063:
5705  0e4a 1d0100        	subw	x,#256
5706  0e4d 2603          	jrne	L263
5707  0e4f cc0f3b        	jp	L7022
5708  0e52               L263:
5709  0e52 1d0200        	subw	x,#512
5710  0e55 2603          	jrne	L463
5711  0e57 cc0f58        	jp	L1122
5712  0e5a               L463:
5713  0e5a 1d0400        	subw	x,#1024
5714  0e5d 2603          	jrne	L663
5715  0e5f cc0f75        	jp	L3122
5716  0e62               L663:
5717  0e62 1d3800        	subw	x,#14336
5718  0e65 2603          	jrne	L073
5719  0e67 cc0f01        	jp	L3022
5720  0e6a               L073:
5721  0e6a               L5122:
5722                     ; 1323   default :
5722                     ; 1324     pendingbitstatus = RESET;
5724  0e6a 0f02          	clr	(OFST+0,sp)
5726                     ; 1325     break;
5728  0e6c ac900f90      	jpf	L7422
5729  0e70               L1712:
5730                     ; 1214   case CAN_IT_TME:
5730                     ; 1215     if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5732  0e70 c65425        	ld	a,21541
5733  0e73 a501          	bcp	a,#1
5734  0e75 2710          	jreq	L1522
5735                     ; 1217       pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5737  0e77 c65422        	ld	a,21538
5738  0e7a ae0007        	ldw	x,#7
5739  0e7d 95            	ld	xh,a
5740  0e7e cd1071        	call	L3_CheckITStatus
5742  0e81 6b02          	ld	(OFST+0,sp),a
5745  0e83 ac900f90      	jpf	L7422
5746  0e87               L1522:
5747                     ; 1221       pendingbitstatus = RESET;
5749  0e87 0f02          	clr	(OFST+0,sp)
5751  0e89 ac900f90      	jpf	L7422
5752  0e8d               L3712:
5753                     ; 1225   case CAN_IT_FMP:
5753                     ; 1226     if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5755  0e8d c65425        	ld	a,21541
5756  0e90 a502          	bcp	a,#2
5757  0e92 2710          	jreq	L5522
5758                     ; 1228       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5760  0e94 c65424        	ld	a,21540
5761  0e97 ae0003        	ldw	x,#3
5762  0e9a 95            	ld	xh,a
5763  0e9b cd1071        	call	L3_CheckITStatus
5765  0e9e 6b02          	ld	(OFST+0,sp),a
5768  0ea0 ac900f90      	jpf	L7422
5769  0ea4               L5522:
5770                     ; 1232       pendingbitstatus = RESET;
5772  0ea4 0f02          	clr	(OFST+0,sp)
5774  0ea6 ac900f90      	jpf	L7422
5775  0eaa               L5712:
5776                     ; 1235   case CAN_IT_FF:
5776                     ; 1236     if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5778  0eaa c65425        	ld	a,21541
5779  0ead a504          	bcp	a,#4
5780  0eaf 2710          	jreq	L1622
5781                     ; 1238       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5783  0eb1 c65424        	ld	a,21540
5784  0eb4 ae0008        	ldw	x,#8
5785  0eb7 95            	ld	xh,a
5786  0eb8 cd1071        	call	L3_CheckITStatus
5788  0ebb 6b02          	ld	(OFST+0,sp),a
5791  0ebd ac900f90      	jpf	L7422
5792  0ec1               L1622:
5793                     ; 1242       pendingbitstatus = RESET;
5795  0ec1 0f02          	clr	(OFST+0,sp)
5797  0ec3 ac900f90      	jpf	L7422
5798  0ec7               L7712:
5799                     ; 1245   case CAN_IT_FOV:
5799                     ; 1246     if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5801  0ec7 c65425        	ld	a,21541
5802  0eca a508          	bcp	a,#8
5803  0ecc 2710          	jreq	L5622
5804                     ; 1248       pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5806  0ece c65424        	ld	a,21540
5807  0ed1 ae0010        	ldw	x,#16
5808  0ed4 95            	ld	xh,a
5809  0ed5 cd1071        	call	L3_CheckITStatus
5811  0ed8 6b02          	ld	(OFST+0,sp),a
5814  0eda ac900f90      	jpf	L7422
5815  0ede               L5622:
5816                     ; 1252       pendingbitstatus = RESET;
5818  0ede 0f02          	clr	(OFST+0,sp)
5820  0ee0 ac900f90      	jpf	L7422
5821  0ee4               L1022:
5822                     ; 1255   case CAN_IT_WKU:
5822                     ; 1256     if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5824  0ee4 c65425        	ld	a,21541
5825  0ee7 a580          	bcp	a,#128
5826  0ee9 2710          	jreq	L1722
5827                     ; 1258       pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5829  0eeb c65421        	ld	a,21537
5830  0eee ae0008        	ldw	x,#8
5831  0ef1 95            	ld	xh,a
5832  0ef2 cd1071        	call	L3_CheckITStatus
5834  0ef5 6b02          	ld	(OFST+0,sp),a
5837  0ef7 ac900f90      	jpf	L7422
5838  0efb               L1722:
5839                     ; 1262       pendingbitstatus = RESET;
5841  0efb 0f02          	clr	(OFST+0,sp)
5843  0efd ac900f90      	jpf	L7422
5844  0f01               L3022:
5845                     ; 1266   case CAN_IT_ERR:
5845                     ; 1267     CAN->PSR = CAN_Page_Config;
5847  0f01 35065427      	mov	21543,#6
5848                     ; 1268     if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5850  0f05 c65429        	ld	a,21545
5851  0f08 a580          	bcp	a,#128
5852  0f0a 270e          	jreq	L5722
5853                     ; 1270       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5855  0f0c c65428        	ld	a,21544
5856  0f0f ae0077        	ldw	x,#119
5857  0f12 95            	ld	xh,a
5858  0f13 cd1071        	call	L3_CheckITStatus
5860  0f16 6b02          	ld	(OFST+0,sp),a
5863  0f18 2076          	jra	L7422
5864  0f1a               L5722:
5865                     ; 1274       pendingbitstatus = RESET;
5867  0f1a 0f02          	clr	(OFST+0,sp)
5869  0f1c 2072          	jra	L7422
5870  0f1e               L5022:
5871                     ; 1278   case CAN_IT_EWG:
5871                     ; 1279     CAN->PSR = CAN_Page_Config;
5873  0f1e 35065427      	mov	21543,#6
5874                     ; 1280     if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5876  0f22 c65429        	ld	a,21545
5877  0f25 a501          	bcp	a,#1
5878  0f27 270e          	jreq	L1032
5879                     ; 1282       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5881  0f29 c65428        	ld	a,21544
5882  0f2c ae0001        	ldw	x,#1
5883  0f2f 95            	ld	xh,a
5884  0f30 cd1071        	call	L3_CheckITStatus
5886  0f33 6b02          	ld	(OFST+0,sp),a
5889  0f35 2059          	jra	L7422
5890  0f37               L1032:
5891                     ; 1286       pendingbitstatus = RESET;
5893  0f37 0f02          	clr	(OFST+0,sp)
5895  0f39 2055          	jra	L7422
5896  0f3b               L7022:
5897                     ; 1290   case CAN_IT_EPV:
5897                     ; 1291     CAN->PSR = CAN_Page_Config;
5899  0f3b 35065427      	mov	21543,#6
5900                     ; 1292     if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5902  0f3f c65429        	ld	a,21545
5903  0f42 a502          	bcp	a,#2
5904  0f44 270e          	jreq	L5032
5905                     ; 1294       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5907  0f46 c65428        	ld	a,21544
5908  0f49 ae0002        	ldw	x,#2
5909  0f4c 95            	ld	xh,a
5910  0f4d cd1071        	call	L3_CheckITStatus
5912  0f50 6b02          	ld	(OFST+0,sp),a
5915  0f52 203c          	jra	L7422
5916  0f54               L5032:
5917                     ; 1298       pendingbitstatus = RESET;
5919  0f54 0f02          	clr	(OFST+0,sp)
5921  0f56 2038          	jra	L7422
5922  0f58               L1122:
5923                     ; 1301   case CAN_IT_BOF:
5923                     ; 1302     CAN->PSR = CAN_Page_Config;
5925  0f58 35065427      	mov	21543,#6
5926                     ; 1303     if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5928  0f5c c65429        	ld	a,21545
5929  0f5f a504          	bcp	a,#4
5930  0f61 270e          	jreq	L1132
5931                     ; 1305       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5933  0f63 c65428        	ld	a,21544
5934  0f66 ae0004        	ldw	x,#4
5935  0f69 95            	ld	xh,a
5936  0f6a cd1071        	call	L3_CheckITStatus
5938  0f6d 6b02          	ld	(OFST+0,sp),a
5941  0f6f 201f          	jra	L7422
5942  0f71               L1132:
5943                     ; 1309       pendingbitstatus = RESET;
5945  0f71 0f02          	clr	(OFST+0,sp)
5947  0f73 201b          	jra	L7422
5948  0f75               L3122:
5949                     ; 1312   case CAN_IT_LEC:
5949                     ; 1313     CAN->PSR = CAN_Page_Config;
5951  0f75 35065427      	mov	21543,#6
5952                     ; 1314     if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5954  0f79 c65429        	ld	a,21545
5955  0f7c a510          	bcp	a,#16
5956  0f7e 270e          	jreq	L5132
5957                     ; 1316       pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5959  0f80 c65428        	ld	a,21544
5960  0f83 ae0070        	ldw	x,#112
5961  0f86 95            	ld	xh,a
5962  0f87 cd1071        	call	L3_CheckITStatus
5964  0f8a 6b02          	ld	(OFST+0,sp),a
5967  0f8c 2002          	jra	L7422
5968  0f8e               L5132:
5969                     ; 1320       pendingbitstatus = RESET;
5971  0f8e 0f02          	clr	(OFST+0,sp)
5973  0f90               L7422:
5974                     ; 1328   CAN_SelectPage(can_page);
5976  0f90 7b01          	ld	a,(OFST-1,sp)
5977  0f92 cd106d        	call	_CAN_SelectPage
5979                     ; 1330   return  (ITStatus)pendingbitstatus;
5981  0f95 7b02          	ld	a,(OFST+0,sp)
5984  0f97 5b04          	addw	sp,#4
5985  0f99 81            	ret
6034                     ; 1348 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
6034                     ; 1349 {
6035                     	switch	.text
6036  0f9a               _CAN_ClearITPendingBit:
6038  0f9a 89            	pushw	x
6039  0f9b 88            	push	a
6040       00000001      OFST:	set	1
6043                     ; 1350   CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
6045  0f9c cd1069        	call	_CAN_GetSelectedPage
6047  0f9f 6b01          	ld	(OFST+0,sp),a
6049                     ; 1352   assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
6051  0fa1 1e02          	ldw	x,(OFST+1,sp)
6052  0fa3 a30001        	cpw	x,#1
6053  0fa6 2738          	jreq	L673
6054  0fa8 1e02          	ldw	x,(OFST+1,sp)
6055  0faa a30004        	cpw	x,#4
6056  0fad 2731          	jreq	L673
6057  0faf 1e02          	ldw	x,(OFST+1,sp)
6058  0fb1 a30008        	cpw	x,#8
6059  0fb4 272a          	jreq	L673
6060  0fb6 1e02          	ldw	x,(OFST+1,sp)
6061  0fb8 a30080        	cpw	x,#128
6062  0fbb 2723          	jreq	L673
6063  0fbd 1e02          	ldw	x,(OFST+1,sp)
6064  0fbf a34000        	cpw	x,#16384
6065  0fc2 271c          	jreq	L673
6066  0fc4 1e02          	ldw	x,(OFST+1,sp)
6067  0fc6 a30100        	cpw	x,#256
6068  0fc9 2715          	jreq	L673
6069  0fcb 1e02          	ldw	x,(OFST+1,sp)
6070  0fcd a30200        	cpw	x,#512
6071  0fd0 270e          	jreq	L673
6072  0fd2 1e02          	ldw	x,(OFST+1,sp)
6073  0fd4 a30400        	cpw	x,#1024
6074  0fd7 2707          	jreq	L673
6075  0fd9 1e02          	ldw	x,(OFST+1,sp)
6076  0fdb a30800        	cpw	x,#2048
6077  0fde 2603          	jrne	L473
6078  0fe0               L673:
6079  0fe0 4f            	clr	a
6080  0fe1 2010          	jra	L004
6081  0fe3               L473:
6082  0fe3 ae0548        	ldw	x,#1352
6083  0fe6 89            	pushw	x
6084  0fe7 ae0000        	ldw	x,#0
6085  0fea 89            	pushw	x
6086  0feb ae0008        	ldw	x,#L103
6087  0fee cd0000        	call	_assert_failed
6089  0ff1 5b04          	addw	sp,#4
6090  0ff3               L004:
6091                     ; 1354   switch (CAN_IT)
6093  0ff3 1e02          	ldw	x,(OFST+1,sp)
6095                     ; 1395   default :
6095                     ; 1396     break;
6096  0ff5 5a            	decw	x
6097  0ff6 272a          	jreq	L1232
6098  0ff8 1d0003        	subw	x,#3
6099  0ffb 272b          	jreq	L3232
6100  0ffd 1d0004        	subw	x,#4
6101  1000 272c          	jreq	L5232
6102  1002 1d0078        	subw	x,#120
6103  1005 272d          	jreq	L7232
6104  1007 1d0080        	subw	x,#128
6105  100a 273c          	jreq	L3332
6106  100c 1d0100        	subw	x,#256
6107  100f 273d          	jreq	L5332
6108  1011 1d0200        	subw	x,#512
6109  1014 273e          	jreq	L7332
6110  1016 1d0400        	subw	x,#1024
6111  1019 273f          	jreq	L1432
6112  101b 1d3800        	subw	x,#14336
6113  101e 271a          	jreq	L1332
6114  1020 2040          	jra	L1732
6115  1022               L1232:
6116                     ; 1356   case CAN_IT_TME:
6116                     ; 1357     CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
6118  1022 35075422      	mov	21538,#7
6119                     ; 1358     break;
6121  1026 203a          	jra	L1732
6122  1028               L3232:
6123                     ; 1360   case CAN_IT_FF:
6123                     ; 1361     CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
6125  1028 35085424      	mov	21540,#8
6126                     ; 1362     break;
6128  102c 2034          	jra	L1732
6129  102e               L5232:
6130                     ; 1364   case CAN_IT_FOV:
6130                     ; 1365     CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
6132  102e 35105424      	mov	21540,#16
6133                     ; 1366     break;
6135  1032 202e          	jra	L1732
6136  1034               L7232:
6137                     ; 1368   case CAN_IT_WKU:
6137                     ; 1369     CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
6139  1034 35085421      	mov	21537,#8
6140                     ; 1370     break;
6142  1038 2028          	jra	L1732
6143  103a               L1332:
6144                     ; 1372   case CAN_IT_ERR:
6144                     ; 1373     CAN->PSR = CAN_Page_Config;
6146  103a 35065427      	mov	21543,#6
6147                     ; 1374     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6149  103e 725f5428      	clr	21544
6150                     ; 1375     CAN->MSR = CAN_MSR_ERRI;
6152  1042 35045421      	mov	21537,#4
6153                     ; 1376     break;
6155  1046 201a          	jra	L1732
6156  1048               L3332:
6157                     ; 1378   case CAN_IT_EWG:
6157                     ; 1379     CAN->MSR = CAN_MSR_ERRI;
6159  1048 35045421      	mov	21537,#4
6160                     ; 1380     break;
6162  104c 2014          	jra	L1732
6163  104e               L5332:
6164                     ; 1382   case CAN_IT_EPV:
6164                     ; 1383     CAN->MSR = CAN_MSR_ERRI;
6166  104e 35045421      	mov	21537,#4
6167                     ; 1384     break;
6169  1052 200e          	jra	L1732
6170  1054               L7332:
6171                     ; 1386   case CAN_IT_BOF:
6171                     ; 1387     CAN->MSR = CAN_MSR_ERRI;
6173  1054 35045421      	mov	21537,#4
6174                     ; 1388     break;
6176  1058 2008          	jra	L1732
6177  105a               L1432:
6178                     ; 1390   case CAN_IT_LEC:
6178                     ; 1391     CAN->PSR = CAN_Page_Config;
6180  105a 35065427      	mov	21543,#6
6181                     ; 1392     CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6183  105e 725f5428      	clr	21544
6184                     ; 1393     break;
6186  1062               L3432:
6187                     ; 1395   default :
6187                     ; 1396     break;
6189  1062               L1732:
6190                     ; 1399   CAN_SelectPage(can_page);
6192  1062 7b01          	ld	a,(OFST+0,sp)
6193  1064 ad07          	call	_CAN_SelectPage
6195                     ; 1400 }
6198  1066 5b03          	addw	sp,#3
6199  1068 81            	ret
6224                     ; 1407 CAN_Page_TypeDef CAN_GetSelectedPage(void)
6224                     ; 1408 {
6225                     	switch	.text
6226  1069               _CAN_GetSelectedPage:
6230                     ; 1409   return (CAN_Page_TypeDef)(CAN->PSR);
6232  1069 c65427        	ld	a,21543
6235  106c 81            	ret
6270                     ; 1417 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
6270                     ; 1418 {
6271                     	switch	.text
6272  106d               _CAN_SelectPage:
6276                     ; 1419   CAN->PSR = (uint8_t)CAN_Page;
6278  106d c75427        	ld	21543,a
6279                     ; 1420 }
6282  1070 81            	ret
6336                     ; 1428 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
6336                     ; 1429 {
6337                     	switch	.text
6338  1071               L3_CheckITStatus:
6340  1071 89            	pushw	x
6341  1072 88            	push	a
6342       00000001      OFST:	set	1
6345                     ; 1430   ITStatus pendingbitstatus = RESET;
6347                     ; 1431   if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
6349  1073 9f            	ld	a,xl
6350  1074 1402          	and	a,(OFST+1,sp)
6351  1076 2706          	jreq	L7442
6352                     ; 1434     pendingbitstatus = SET;
6354  1078 a601          	ld	a,#1
6355  107a 6b01          	ld	(OFST+0,sp),a
6358  107c 2002          	jra	L1542
6359  107e               L7442:
6360                     ; 1439     pendingbitstatus = RESET;
6362  107e 0f01          	clr	(OFST+0,sp)
6364  1080               L1542:
6365                     ; 1441   return (ITStatus)pendingbitstatus;
6367  1080 7b01          	ld	a,(OFST+0,sp)
6370  1082 5b03          	addw	sp,#3
6371  1084 81            	ret
6441                     	xdef	__FMI
6442                     	xdef	__Data
6443                     	xdef	__DLC
6444                     	xdef	__RTR
6445                     	xdef	__IDE
6446                     	xdef	__Id
6447                     	xdef	_CAN_ClearITPendingBit
6448                     	xdef	_CAN_GetITStatus
6449                     	xdef	_CAN_ClearFlag
6450                     	xdef	_CAN_GetFlagStatus
6451                     	xdef	_CAN_SelectPage
6452                     	xdef	_CAN_GetSelectedPage
6453                     	xdef	_CAN_GetLastErrorCode
6454                     	xdef	_CAN_OperatingModeRequest
6455                     	xdef	_CAN_WakeUp
6456                     	xdef	_CAN_Sleep
6457                     	xdef	_CAN_GetMessageTimeStamp
6458                     	xdef	_CAN_GetReceivedFMI
6459                     	xdef	_CAN_GetReceivedData
6460                     	xdef	_CAN_GetReceivedDLC
6461                     	xdef	_CAN_GetReceivedRTR
6462                     	xdef	_CAN_GetReceivedIDE
6463                     	xdef	_CAN_GetReceivedId
6464                     	xdef	_CAN_Receive
6465                     	xdef	_CAN_MessagePending
6466                     	xdef	_CAN_FIFORelease
6467                     	xdef	_CAN_CancelTransmit
6468                     	xdef	_CAN_TransmitStatus
6469                     	xdef	_CAN_TTComModeCmd
6470                     	xdef	_CAN_Transmit
6471                     	xdef	_CAN_ST7CompatibilityCmd
6472                     	xdef	_CAN_ITConfig
6473                     	xdef	_CAN_FilterInit
6474                     	xdef	_CAN_Init
6475                     	xdef	_CAN_DeInit
6476                     	xref	_assert_failed
6477                     	switch	.const
6478  0008               L103:
6479  0008 7372635c7374  	dc.b	"src\stm8s_can.c",0
6480                     	xref.b	c_lreg
6481                     	xref.b	c_x
6482                     	xref.b	c_y
6502                     	xref	c_uitol
6503                     	xref	c_uitolx
6504                     	xref	c_llsh
6505                     	xref	c_umul
6506                     	xref	c_lor
6507                     	xref	c_rtol
6508                     	xref	c_lursh
6509                     	xref	c_lgursh
6510                     	xref	c_lcmp
6511                     	xref	c_ltor
6512                     	end
