#include <16f84a.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#use standard_io(B)
#use standard_io(A)

#define bobina_1 PIN_B0
#define bobina_2 PIN_B1
#define bobina_3 PIN_B2
#define bobina_4 PIN_B3

#define pulsador_izq PIN_A0
#define pulsador_der PIN_A1

void pasos_izquierda(int velocidad);
void pasos_derecha(int velocidad);
void pasos_off(void);

void main()
{
   while(true)
   {
      pasos_off();
      
      if(input(pulsador_izq) == 1)
      {
         pasos_izquierda(15);
      }
      
      if(input(pulsador_der) == 1)
      {
         pasos_derecha(15);
      }
   }
}

void pasos_izquierda(int velocidad)
{
   output_low(bobina_1);
   output_low(bobina_2);
   output_high(bobina_3);
   output_high(bobina_4);
   delay_ms(velocidad);
   
   output_low(bobina_1);
   output_high(bobina_2);
   output_high(bobina_3);
   output_low(bobina_4);
   delay_ms(velocidad);
   
   output_high(bobina_1);
   output_high(bobina_2);
   output_low(bobina_3);
   output_low(bobina_4);
   delay_ms(velocidad);
   
   output_high(bobina_1);
   output_low(bobina_2);
   output_low(bobina_3);
   output_high(bobina_4);
   delay_ms(velocidad);
}

void pasos_derecha(int velocidad)
{
   output_high(bobina_1);
   output_high(bobina_2);
   output_low(bobina_3);
   output_low(bobina_4);
   delay_ms(velocidad);
   
   output_low(bobina_1);
   output_high(bobina_2);
   output_high(bobina_3);
   output_low(bobina_4);
   delay_ms(velocidad);
   
   output_low(bobina_1);
   output_low(bobina_2);
   output_high(bobina_3);
   output_high(bobina_4);
   delay_ms(velocidad);
   
   output_high(bobina_1);
   output_low(bobina_2);
   output_low(bobina_3);
   output_high(bobina_4);
   delay_ms(velocidad);
}

void pasos_off(void)
{
   output_low(bobina_1);
   output_low(bobina_2);
   output_low(bobina_3);
   output_low(bobina_4);
}
