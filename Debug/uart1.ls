   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  48                     ; 12 void init_uart1(void)
  48                     ; 13 {
  50                     	switch	.text
  51  0000               _init_uart1:
  55                     ; 14     UART1_DeInit();         // smažu starou konfiguraci
  57  0000 cd0000        	call	_UART1_DeInit
  59                     ; 15     UART1_Init((uint32_t) 115200,
  59                     ; 16                UART1_WORDLENGTH_8D,
  59                     ; 17                UART1_STOPBITS_1,
  59                     ; 18                UART1_PARITY_NO,
  59                     ; 19                UART1_SYNCMODE_CLOCK_DISABLE,
  59                     ; 20                UART1_MODE_TXRX_ENABLE);
  61  0003 4b0c          	push	#12
  62  0005 4b80          	push	#128
  63  0007 4b00          	push	#0
  64  0009 4b00          	push	#0
  65  000b 4b00          	push	#0
  66  000d aec200        	ldw	x,#49664
  67  0010 89            	pushw	x
  68  0011 ae0001        	ldw	x,#1
  69  0014 89            	pushw	x
  70  0015 cd0000        	call	_UART1_Init
  72  0018 5b09          	addw	sp,#9
  73                     ; 21     UART1_Cmd(ENABLE);  // povolí UART1
  75  001a a601          	ld	a,#1
  76  001c cd0000        	call	_UART1_Cmd
  78                     ; 23     UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);   // povolí přerušení UART1 Rx
  80  001f 4b01          	push	#1
  81  0021 ae0205        	ldw	x,#517
  82  0024 cd0000        	call	_UART1_ITConfig
  84  0027 84            	pop	a
  85                     ; 24     enableInterrupts();
  88  0028 9a            rim
  90                     ; 25 }
  94  0029 81            	ret
 130                     ; 28 PUTCHAR_PROTOTYPE
 130                     ; 29 {
 131                     	switch	.text
 132  002a               _putchar:
 134  002a 88            	push	a
 135       00000000      OFST:	set	0
 138  002b               L14:
 139                     ; 31   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 141  002b ae0080        	ldw	x,#128
 142  002e cd0000        	call	_UART1_GetFlagStatus
 144  0031 4d            	tnz	a
 145  0032 27f7          	jreq	L14
 146                     ; 33   UART1_SendData8(c);
 148  0034 7b01          	ld	a,(OFST+1,sp)
 149  0036 cd0000        	call	_UART1_SendData8
 151                     ; 35   return (c);
 153  0039 7b01          	ld	a,(OFST+1,sp)
 156  003b 5b01          	addw	sp,#1
 157  003d 81            	ret
 193                     ; 43 GETCHAR_PROTOTYPE
 193                     ; 44 {
 194                     	switch	.text
 195  003e               _getchar:
 197  003e 88            	push	a
 198       00000001      OFST:	set	1
 201                     ; 46     char c = 0;
 204  003f               L56:
 205                     ; 52     while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
 207  003f ae0020        	ldw	x,#32
 208  0042 cd0000        	call	_UART1_GetFlagStatus
 210  0045 4d            	tnz	a
 211  0046 27f7          	jreq	L56
 212                     ; 53     c = UART1_ReceiveData8();
 214  0048 cd0000        	call	_UART1_ReceiveData8
 216  004b 6b01          	ld	(OFST+0,sp),a
 218                     ; 54     return (c);
 220  004d 7b01          	ld	a,(OFST+0,sp)
 223  004f 5b01          	addw	sp,#1
 224  0051 81            	ret
 237                     	xdef	_init_uart1
 238                     	xdef	_putchar
 239                     	xdef	_getchar
 240                     	xref	_UART1_GetFlagStatus
 241                     	xref	_UART1_SendData8
 242                     	xref	_UART1_ReceiveData8
 243                     	xref	_UART1_ITConfig
 244                     	xref	_UART1_Cmd
 245                     	xref	_UART1_Init
 246                     	xref	_UART1_DeInit
 265                     	end
