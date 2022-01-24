   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
 184                     ; 5 void ADC2_Select_Channel(ADC2_Channel_TypeDef ADC2_Channel){
 186                     	switch	.text
 187  0000               _ADC2_Select_Channel:
 189  0000 88            	push	a
 190  0001 88            	push	a
 191       00000001      OFST:	set	1
 194                     ; 6     uint8_t tmp = (ADC2->CSR) & (~ADC2_CSR_CH);
 196  0002 c65400        	ld	a,21504
 197  0005 a4f0          	and	a,#240
 198  0007 6b01          	ld	(OFST+0,sp),a
 200                     ; 7     tmp |= ADC2_Channel | ADC2_CSR_EOC;
 202  0009 7b02          	ld	a,(OFST+1,sp)
 203  000b aa80          	or	a,#128
 204  000d 1a01          	or	a,(OFST+0,sp)
 205  000f 6b01          	ld	(OFST+0,sp),a
 207                     ; 8     ADC2->CSR = tmp;
 209  0011 7b01          	ld	a,(OFST+0,sp)
 210  0013 c75400        	ld	21504,a
 211                     ; 9 }
 214  0016 85            	popw	x
 215  0017 81            	ret
 270                     ; 11 void ADC2_AlignConfig(ADC2_Align_TypeDef ADC2_Align){
 271                     	switch	.text
 272  0018               _ADC2_AlignConfig:
 276                     ; 12 	if(ADC2_Align){
 278  0018 4d            	tnz	a
 279  0019 2708          	jreq	L131
 280                     ; 13 		ADC2->CR2 |= (uint8_t)(ADC2_Align);
 282  001b ca5402        	or	a,21506
 283  001e c75402        	ld	21506,a
 285  0021 2004          	jra	L331
 286  0023               L131:
 287                     ; 15 		ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
 289  0023 72175402      	bres	21506,#3
 290  0027               L331:
 291                     ; 17 }
 294  0027 81            	ret
 307                     	xdef	_ADC2_AlignConfig
 308                     	xdef	_ADC2_Select_Channel
 327                     	end
