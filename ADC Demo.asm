
_close_all_leds:

;ADC Demo.c,8 :: 		void close_all_leds(){
;ADC Demo.c,9 :: 		ANSELA =0X00;
	CLR	ANSELA
;ADC Demo.c,10 :: 		TRISA=0X00;
	CLR	TRISA
;ADC Demo.c,11 :: 		LATA=0X00;
	CLR	LATA
;ADC Demo.c,13 :: 		ANSELB =0X00;
	CLR	ANSELB
;ADC Demo.c,14 :: 		TRISB =0X00;
	CLR	TRISB
;ADC Demo.c,15 :: 		LATB =0X00;
	CLR	LATB
;ADC Demo.c,17 :: 		ANSELC =0X00;
	CLR	ANSELC
;ADC Demo.c,18 :: 		TRISC =0X00;
	CLR	TRISC
;ADC Demo.c,19 :: 		LATC=0X00;
	CLR	LATC
;ADC Demo.c,21 :: 		ANSELD =0X00;
	CLR	ANSELD
;ADC Demo.c,22 :: 		TRISD =0X00;
	CLR	TRISD
;ADC Demo.c,23 :: 		LATD =0X00;
	CLR	LATD
;ADC Demo.c,25 :: 		ANSELG =0X00;
	CLR	ANSELG
;ADC Demo.c,26 :: 		TRISG=0X00;
	CLR	TRISG
;ADC Demo.c,27 :: 		LATG=0X00;
	CLR	LATG
;ADC Demo.c,29 :: 		}
L_end_close_all_leds:
	RETURN
; end of _close_all_leds

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;ADC Demo.c,30 :: 		void main() {
;ADC Demo.c,32 :: 		PLLFBD = 70;             // PLL multiplier M=70
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#70, W0
	MOV	WREG, PLLFBD
;ADC Demo.c,33 :: 		CLKDIV = 0x0000;         // PLL prescaler N1=2, PLL postscaler N2=2
	CLR	CLKDIV
;ADC Demo.c,34 :: 		close_all_leds();
	CALL	_close_all_leds
;ADC Demo.c,36 :: 		ANSELA = 0x00;           // Convert all I/O pins to digital
	CLR	ANSELA
;ADC Demo.c,37 :: 		ANSELB = 0x01;
	MOV	#1, W0
	MOV	WREG, ANSELB
;ADC Demo.c,38 :: 		ANSELC = 0x00;
	CLR	ANSELC
;ADC Demo.c,39 :: 		ANSELD = 0x00;
	CLR	ANSELD
;ADC Demo.c,40 :: 		ANSELE = 0x00;
	CLR	ANSELE
;ADC Demo.c,41 :: 		ANSELG = 0x00;
	CLR	ANSELG
;ADC Demo.c,43 :: 		TRISA = 0;               // Set PORTA as output
	CLR	TRISA
;ADC Demo.c,44 :: 		TRISB0_bit = 1;          // Set PORTB.B0 as input
	BSET	TRISB0_bit, BitPos(TRISB0_bit+0)
;ADC Demo.c,47 :: 		PPS_Mapping(100, _INPUT,  _U1RX);  // UART RX pin tanimlama
	MOV.B	#34, W12
	MOV.B	#1, W11
	MOV.B	#100, W10
	CALL	_PPS_Mapping
;ADC Demo.c,48 :: 		PPS_Mapping(101, _OUTPUT, _U1TX);  // UART TX pin tanimlama
	MOV.B	#1, W12
	CLR	W11
	MOV.B	#101, W10
	CALL	_PPS_Mapping
;ADC Demo.c,51 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;ADC Demo.c,52 :: 		Delay_ms(500);
	MOV	#107, W8
	MOV	#53247, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
	NOP
;ADC Demo.c,54 :: 		UART1_Write_Text("UART Baslatildi!\r\n");
	MOV	#lo_addr(?lstr1_ADC_32Demo), W10
	CALL	_UART1_Write_Text
;ADC Demo.c,57 :: 		ADC1_Init();
	CALL	_ADC1_Init
;ADC Demo.c,58 :: 		Delay_ms(100);
	MOV	#22, W8
	MOV	#23756, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
	NOP
	NOP
;ADC Demo.c,61 :: 		UART1_Write_Text("ADC Baslatildi!\r\n");
	MOV	#lo_addr(?lstr2_ADC_32Demo), W10
	CALL	_UART1_Write_Text
;ADC Demo.c,67 :: 		while(1) {
L_main4:
;ADC Demo.c,68 :: 		LATA = ADC1_Get_Sample(0);   // Get ADC value from corresponding channel
	CLR	W10
	CALL	_ADC1_Get_Sample
	MOV	WREG, LATA
;ADC Demo.c,69 :: 		Delay_ms(50);
	MOV	#11, W8
	MOV	#44645, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
	NOP
	NOP
	NOP
	NOP
;ADC Demo.c,70 :: 		}
	GOTO	L_main4
;ADC Demo.c,71 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
