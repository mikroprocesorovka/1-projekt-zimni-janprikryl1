#include "stm8s.h"
#include "assert.h"
#include "delay.h"
#include "milis.h"
#include "stdio.h"
#include "stm8_hd44780.h"

//Ultrasonic
#define TI1_PORT GPIOD
#define TI1_PIN  GPIO_PIN_4

#define TRGG_PORT GPIOC
#define TRGG_PIN  GPIO_PIN_7
#define TRGG_ON   GPIO_WriteHigh(TRGG_PORT, TRGG_PIN);
#define TRGG_OFF  GPIO_WriteLow(TRGG_PORT, TRGG_PIN);
#define TRGG_REVERSE GPIO_WriteReverse(TRGG_PORT, TRGG_PIN);

#define MASURMENT_PERON 444    // maxim�ln� celkov� cas meren� (ms)
#define MAXIMALNI_VZDALENOST 400

//Tlacitko
#define BTN_PORT GPIOE
#define BTN_PIN  GPIO_PIN_4
#define BTN_PUSH (GPIO_ReadInputPin(BTN_PORT, BTN_PIN)==RESET) 

//UART komunikace
char putchar (char c)
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

  return (c);
}

char getchar (void) //funkce cte(prij�m� data) vstup z UART
{
  int c = 0;
  /* Loop until the Read data register flag is SET */
  while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
	c = UART1_ReceiveData8();
  return (c);
}


//Povoleni UART1 (Vyuzivane na komunikaci s PC)
void init_uart1(void)
{
    UART1_DeInit();         // smazat starou konfiguraci
		UART1_Init((uint32_t)115200, //Nova konfigurace
									UART1_WORDLENGTH_8D, 
									UART1_STOPBITS_1, 
									UART1_PARITY_NO,
									UART1_SYNCMODE_CLOCK_DISABLE, 
									UART1_MODE_TXRX_ENABLE);
}


void setup(void)
{
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);      // taktovat MCU na 16MHz

    init_milis(); //Rozbehnuti casovace milis
    init_uart1(); //Povoleni komunikace s PC

		GPIO_Init(BTN_PORT, BTN_PIN,GPIO_MODE_IN_FL_NO_IT); // Tlacitko jako vstup (vynulovani)
		//Ultrasonic
    /*----          trigger setup           ---------*/
    GPIO_Init(TRGG_PORT, TRGG_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);

    /*----           TIM2 setup           ---------*/
    GPIO_Init(TI1_PORT, TI1_PIN, GPIO_MODE_IN_FL_NO_IT);  // kan�l 1 jako vstup

    TIM2_TimeBaseInit(TIM2_PRESCALER_16, 0xFFFF );
    /*TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);*/
    TIM2_Cmd(ENABLE);
    TIM2_ICInit(TIM2_CHANNEL_1,        // nastavuji CH1 (CaptureRegistr1)
            TIM2_ICPOLARITY_RISING,    // n�be�n� hrana
            TIM2_ICSELECTION_DIRECTTI, // CaptureRegistr1 bude ovl�d�n z CH1
            TIM2_ICPSC_DIV1,           // delicka je vypnut�
            0                          // vstupn� filter je vypnut�
        );            
    TIM2_ICInit(TIM2_CHANNEL_2,        // nastavuji CH2 (CaptureRegistr2)
            TIM2_ICPOLARITY_FALLING,   // sestupn� hrana
            TIM2_ICSELECTION_INDIRECTTI, // CaptureRegistr2 bude ovl�d�n z CH1
            TIM2_ICPSC_DIV1,           // delicka je vypnut�
            0                          // vstupn� filter je vypnut�
        );            
}


typedef enum //Enum pro stavy snimace vzdalenosti
{
    TRGG_START,       // zah�jen� trigger impoulzu
    TRGG_WAIT,        // cek�n� na konec trrigger impoulzu
    MEASURMENT_WAIT   // ck�n� na dokoncen� meren�
} STATE_TypeDef;

void main(void)
{
		uint32_t pocet_mereni = 0;
    uint32_t mtime_ultrasonic = 0;
    uint32_t vzdalenost;
    STATE_TypeDef state = TRGG_START;
		
		char text[16];
		char mereni_text[16];
		
    setup();
    printf("Start programu\r\n"); //Uvitaci hlaska

		lcd_init(); //Inicializace lcd displeje
    lcd_gotoxy(0,0);
    lcd_puts("Start programu"); //Uvitaci hlaska


    while (1) {
        switch (state) { //Stav snimace
        case TRGG_START:
            if (milis() - mtime_ultrasonic > MASURMENT_PERON) {
                mtime_ultrasonic = milis();
                TRGG_ON;
                state = TRGG_WAIT;
            }
            break;
        case TRGG_WAIT:
            if (milis() - mtime_ultrasonic > 1) {
                TRGG_OFF;
                // sma�u v�echny vlajky
                TIM2_ClearFlag(TIM2_FLAG_CC1);
                TIM2_ClearFlag(TIM2_FLAG_CC2); 
                TIM2_ClearFlag(TIM2_FLAG_CC1OF); 
                TIM2_ClearFlag(TIM2_FLAG_CC2OF); 
                state = MEASURMENT_WAIT;
            }
            break;
        case MEASURMENT_WAIT:
             /* detekuji sestupnou hranu ECHO sign�lu; vzestupnou hranu 
              * detekovat nemus�m, zachycen� CC1 i CC2 probehne automaticky  */
            if (TIM2_GetFlagStatus(TIM2_FLAG_CC2) == RESET) {
                TIM2_ClearFlag(TIM2_FLAG_CC1);  // sma�u vlajku CC1
                TIM2_ClearFlag(TIM2_FLAG_CC2);  // sma�u vlajku CC2

                // d�lka impulzu v �s 
                vzdalenost = (TIM2_GetCapture2() - TIM2_GetCapture1()); 

								//Vypocet a vypsani vzdalenosti na PC a displej
                vzdalenost = (vzdalenost * 340)/ 20000; // FixPoint prepocet na cm -- zaokrouhluje v�dy dolu
                if (vzdalenost <= MAXIMALNI_VZDALENOST) {
                  printf("Vzdalenost: %lu cm\r\n", vzdalenost);
                  sprintf(text, "Vzdalenost:%lu cm", vzdalenost);
                  lcd_gotoxy(0,0);
                  lcd_puts(text);
                }
								
								//Vypsani pocet pokusu
								sprintf(mereni_text, "Zmereno:%lu", pocet_mereni++);
								lcd_gotoxy(0,1);
								lcd_puts(mereni_text);

                state = TRGG_START;
            }
            break;
        default:
            state = TRGG_START;
        }
				
				if (BTN_PUSH) { //Pokud je stisknuto talcitko - vynulovat pokusy a napsat nulu
					pocet_mereni = 0;
					lcd_gotoxy(8,1);
					lcd_puts("0       ");
				}
    }
}

