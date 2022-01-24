   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  44                     ; 53 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  44                     ; 54 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 58 }
  53  0000 80            	iret
  75                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 67 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 71 }
  84  0001 80            	iret
 106                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 106                     ; 79 
 106                     ; 80 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 84 }
 115  0002 80            	iret
 137                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 137                     ; 92 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 96 }
 146  0003 80            	iret
 168                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 168                     ; 104 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 108 }
 177  0004 80            	iret
 200                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 200                     ; 116 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 120 }
 209  0005 80            	iret
 232                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 232                     ; 128 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 132 }
 241  0006 80            	iret
 264                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 264                     ; 140 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 144 }
 273  0007 80            	iret
 296                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 296                     ; 152 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 156 }
 305  0008 80            	iret
 328                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 328                     ; 164 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 168 }
 337  0009 80            	iret
 359                     ; 190  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 359                     ; 191  {
 360                     	switch	.text
 361  000a               f_CAN_RX_IRQHandler:
 365                     ; 195  }
 368  000a 80            	iret
 390                     ; 202  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 390                     ; 203  {
 391                     	switch	.text
 392  000b               f_CAN_TX_IRQHandler:
 396                     ; 207  }
 399  000b 80            	iret
 421                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 421                     ; 216 {
 422                     	switch	.text
 423  000c               f_SPI_IRQHandler:
 427                     ; 220 }
 430  000c 80            	iret
 453                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 453                     ; 228 {
 454                     	switch	.text
 455  000d               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 459                     ; 232 }
 462  000d 80            	iret
 485                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 485                     ; 240 {
 486                     	switch	.text
 487  000e               f_TIM1_CAP_COM_IRQHandler:
 491                     ; 244 }
 494  000e 80            	iret
 517                     ; 277  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 517                     ; 278  {
 518                     	switch	.text
 519  000f               f_TIM2_UPD_OVF_BRK_IRQHandler:
 523                     ; 282  }
 526  000f 80            	iret
 549                     ; 289  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 549                     ; 290  {
 550                     	switch	.text
 551  0010               f_TIM2_CAP_COM_IRQHandler:
 555                     ; 294  }
 558  0010 80            	iret
 581                     ; 304  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 581                     ; 305  {
 582                     	switch	.text
 583  0011               f_TIM3_UPD_OVF_BRK_IRQHandler:
 587                     ; 309  }
 590  0011 80            	iret
 613                     ; 316  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 613                     ; 317  {
 614                     	switch	.text
 615  0012               f_TIM3_CAP_COM_IRQHandler:
 619                     ; 321  }
 622  0012 80            	iret
 645                     ; 331  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 645                     ; 332  {
 646                     	switch	.text
 647  0013               f_UART1_TX_IRQHandler:
 651                     ; 336  }
 654  0013 80            	iret
 677                     ; 343  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 677                     ; 344  {
 678                     	switch	.text
 679  0014               f_UART1_RX_IRQHandler:
 683                     ; 348  }
 686  0014 80            	iret
 708                     ; 382 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 708                     ; 383 {
 709                     	switch	.text
 710  0015               f_I2C_IRQHandler:
 714                     ; 387 }
 717  0015 80            	iret
 740                     ; 421  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 740                     ; 422  {
 741                     	switch	.text
 742  0016               f_UART3_TX_IRQHandler:
 746                     ; 426  }
 749  0016 80            	iret
 772                     ; 433  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 772                     ; 434  {
 773                     	switch	.text
 774  0017               f_UART3_RX_IRQHandler:
 778                     ; 438  }
 781  0017 80            	iret
 803                     ; 447  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 803                     ; 448  {
 804                     	switch	.text
 805  0018               f_ADC2_IRQHandler:
 809                     ; 452  }
 812  0018 80            	iret
 835                     ; 500 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 835                     ; 501 {
 836                     	switch	.text
 837  0019               f_EEPROM_EEC_IRQHandler:
 841                     ; 505 }
 844  0019 80            	iret
 856                     	xdef	f_EEPROM_EEC_IRQHandler
 857                     	xdef	f_ADC2_IRQHandler
 858                     	xdef	f_UART3_TX_IRQHandler
 859                     	xdef	f_UART3_RX_IRQHandler
 860                     	xdef	f_I2C_IRQHandler
 861                     	xdef	f_UART1_RX_IRQHandler
 862                     	xdef	f_UART1_TX_IRQHandler
 863                     	xdef	f_TIM3_CAP_COM_IRQHandler
 864                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 865                     	xdef	f_TIM2_CAP_COM_IRQHandler
 866                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 867                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 868                     	xdef	f_TIM1_CAP_COM_IRQHandler
 869                     	xdef	f_SPI_IRQHandler
 870                     	xdef	f_CAN_TX_IRQHandler
 871                     	xdef	f_CAN_RX_IRQHandler
 872                     	xdef	f_EXTI_PORTE_IRQHandler
 873                     	xdef	f_EXTI_PORTD_IRQHandler
 874                     	xdef	f_EXTI_PORTC_IRQHandler
 875                     	xdef	f_EXTI_PORTB_IRQHandler
 876                     	xdef	f_EXTI_PORTA_IRQHandler
 877                     	xdef	f_CLK_IRQHandler
 878                     	xdef	f_AWU_IRQHandler
 879                     	xdef	f_TLI_IRQHandler
 880                     	xdef	f_TRAP_IRQHandler
 881                     	xdef	f_NonHandledInterrupt
 900                     	end
