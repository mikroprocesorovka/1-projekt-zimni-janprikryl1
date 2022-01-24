   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  15                     	bsct
  16  0000               _miliseconds:
  17  0000 0000          	dc.w	0
  59                     ; 7 uint16_t milis(void){
  61                     	switch	.text
  62  0000               _milis:
  64  0000 89            	pushw	x
  65       00000002      OFST:	set	2
  68                     ; 9 TIM4_ITConfig(TIM4_IT_UPDATE,DISABLE);
  70  0001 ae0100        	ldw	x,#256
  71  0004 cd0000        	call	_TIM4_ITConfig
  73                     ; 10 tmp = miliseconds;
  75  0007 be00          	ldw	x,_miliseconds
  76  0009 1f01          	ldw	(OFST-1,sp),x
  78                     ; 11 TIM4_ITConfig(TIM4_IT_UPDATE,ENABLE);
  80  000b ae0101        	ldw	x,#257
  81  000e cd0000        	call	_TIM4_ITConfig
  83                     ; 12 return tmp;
  85  0011 1e01          	ldw	x,(OFST-1,sp)
  88  0013 5b02          	addw	sp,#2
  89  0015 81            	ret
 118                     ; 16 void init_milis(void){
 119                     	switch	.text
 120  0016               _init_milis:
 124                     ; 17 TIM4_TimeBaseInit(PRESCALER,PERIOD); // (16MHz / 128) / 125 = 1000Hz
 126  0016 ae077c        	ldw	x,#1916
 127  0019 cd0000        	call	_TIM4_TimeBaseInit
 129                     ; 18 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 131  001c a601          	ld	a,#1
 132  001e cd0000        	call	_TIM4_ClearFlag
 134                     ; 19 TIM4_ITConfig(TIM4_IT_UPDATE,ENABLE);
 136  0021 ae0101        	ldw	x,#257
 137  0024 cd0000        	call	_TIM4_ITConfig
 139                     ; 20 ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1); // nízká priorita pøerušení
 141  0027 ae1701        	ldw	x,#5889
 142  002a cd0000        	call	_ITC_SetSoftwarePriority
 144                     ; 21 TIM4_Cmd(ENABLE);
 146  002d a601          	ld	a,#1
 147  002f cd0000        	call	_TIM4_Cmd
 149                     ; 22 enableInterrupts();
 152  0032 9a            rim
 154                     ; 23 }
 158  0033 81            	ret
 184                     ; 26 INTERRUPT TIM4_UPD_OVF_IRQHandler(){
 186                     	switch	.text
 187  0034               f_TIM4_UPD_OVF_IRQHandler:
 189  0034 8a            	push	cc
 190  0035 84            	pop	a
 191  0036 a4bf          	and	a,#191
 192  0038 88            	push	a
 193  0039 86            	pop	cc
 194  003a 3b0002        	push	c_x+2
 195  003d be00          	ldw	x,c_x
 196  003f 89            	pushw	x
 197  0040 3b0002        	push	c_y+2
 198  0043 be00          	ldw	x,c_y
 199  0045 89            	pushw	x
 202                     ; 27 TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 204  0046 a601          	ld	a,#1
 205  0048 cd0000        	call	_TIM4_ClearFlag
 207                     ; 28 miliseconds++;
 209  004b be00          	ldw	x,_miliseconds
 210  004d 1c0001        	addw	x,#1
 211  0050 bf00          	ldw	_miliseconds,x
 212                     ; 29 }
 215  0052 85            	popw	x
 216  0053 bf00          	ldw	c_y,x
 217  0055 320002        	pop	c_y+2
 218  0058 85            	popw	x
 219  0059 bf00          	ldw	c_x,x
 220  005b 320002        	pop	c_x+2
 221  005e 80            	iret
 244                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 245                     	xdef	_miliseconds
 246                     	xdef	_init_milis
 247                     	xdef	_milis
 248                     	xref	_TIM4_ClearFlag
 249                     	xref	_TIM4_ITConfig
 250                     	xref	_TIM4_Cmd
 251                     	xref	_TIM4_TimeBaseInit
 252                     	xref	_ITC_SetSoftwarePriority
 253                     	xref.b	c_x
 254                     	xref.b	c_y
 273                     	end
