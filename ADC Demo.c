#include <built_in.h>


unsigned int adc_result = 0;
char uart_buffer[10];


void close_all_leds(){
    ANSELA =0X00;
    TRISA=0X00;
    LATA=0X00;
    
    ANSELB =0X00;
    TRISB =0X00;
    LATB =0X00;
    
    //ANSELC =0X00;
    //TRISC =0X00;
   // LATC=0X00;
    
    ANSELD =0X00;
    TRISD =0X00;
    LATD =0X00;
    
    ANSELG =0X00;
    TRISG=0X00;
    LATG=0X00;
    
}
void main() {
  // 140MHz saat frekansini ayarla
  PLLFBD = 70;             // PLL multiplier M=70
  CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2

  ANSELA = 0x00;           // Tüm portlari dijital olarak ayarla
  ANSELB = 0x01;           // RB0 analog giris olarak ayarlandi
  ANSELC = 0x00;
  ANSELD = 0x00;
  ANSELE = 0x00;
  ANSELG = 0x00;

  TRISA = 0;               // PORTA çikis olarak ayarlandi
  TRISB0_bit = 1;          // PORTB.B0 giris olarak ayarlandi

  // UART baslat
  UART1_Init(9600);
  Delay_ms(100);
  UART1_Write_Text("UART Baslatildi!\r\n");

  // ADC baslat
  ADC1_Init();
  Delay_ms(100);
  UART1_Write_Text("ADC Baslatildi!\r\n");

  while(1) {
    LATA = ADC1_Get_Sample(0);  // ADC degerini PORTA'ya yaz
    Delay_ms(50);
  }
}
