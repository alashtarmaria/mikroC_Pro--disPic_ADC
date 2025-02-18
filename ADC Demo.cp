#line 1 "C:/Users/marya.koca/Desktop/ADC Demo/ADC Demo.c"
#line 1 "c:/users/marya.koca/documents/mikroelektronika/mikroc pro for dspic/include/built_in.h"
#line 4 "C:/Users/marya.koca/Desktop/ADC Demo/ADC Demo.c"
unsigned int adc_result = 0;
char uart_buffer[10];


void close_all_leds(){
 ANSELA =0X00;
 TRISA=0X00;
 LATA=0X00;

 ANSELB =0X00;
 TRISB =0X00;
 LATB =0X00;

 ANSELC =0X00;
 TRISC =0X00;
 LATC=0X00;

 ANSELD =0X00;
 TRISD =0X00;
 LATD =0X00;

 ANSELG =0X00;
 TRISG=0X00;
 LATG=0X00;

}
void main() {

 PLLFBD = 70;
 CLKDIV = 0x0000;
 close_all_leds();

 ANSELA = 0x00;
 ANSELB = 0x01;
 ANSELC = 0x00;
 ANSELD = 0x00;
 ANSELE = 0x00;
 ANSELG = 0x00;

 TRISA = 0;
 TRISB0_bit = 1;


 PPS_Mapping(100, _INPUT, _U1RX);
 PPS_Mapping(101, _OUTPUT, _U1TX);


 UART1_Init(9600);
 Delay_ms(500);

 UART1_Write_Text("UART Baslatildi!\r\n");


 ADC1_Init();
 Delay_ms(100);


 UART1_Write_Text("ADC Baslatildi!\r\n");





 while(1) {
 LATA = ADC1_Get_Sample(0);
 Delay_ms(50);
 }
}
