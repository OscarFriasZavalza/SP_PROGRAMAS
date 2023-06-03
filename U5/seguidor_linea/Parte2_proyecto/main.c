#include <16F84A.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#use fast_io(B) // Configuramos los TRIS solo una vez, es la forma más rápida de trabajar con los puertos
#use fast_io(A)
#use standard_io(B)
#use standard_io(A)


#define bobina_1 PIN_B0
#define bobina_2 PIN_B1
#define bobina_3 PIN_B2
#define bobina_4 PIN_B3

#define pulsador_izq PIN_A2
#define pulsador_der PIN_A3

void pasos_izquierda(int velocidad);
void pasos_derecha(int velocidad);
void pasos_off(void);

void detener(void)
{
output_low(PIN_B4);
output_low(PIN_B5);
}
void sacar_chorro(void){
output_high(PIN_B4);
output_low(PIN_B5);
}
void meter(void){
output_low(PIN_B4);
output_high(PIN_B5);
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

void main(void)
{ 
   int entradas = 0b00;
   set_tris_B(0b00000000); // Puerto B como salidas
   set_tris_A(0b11111111); // Puerto A como entradas digitales
  // OUTPUT_B(0); // Inicializamos en 0 el puerto B


   while (1)
   {  
   //motor paso a paso codigo 
    pasos_off();
      
      if(input(pulsador_izq) == 1)
      {
         pasos_izquierda(2);
      }
      
      if(input(pulsador_der) == 1)
      {
         pasos_derecha(2);
      }
      //fin motor paso a paso codigo
      
      // Lectura de los sensores en el puerto A
      entradas = input_A(); 
      // Control del movimiento del robot en función de los sensores
      //controlamos sacar chorro
      if (entradas == 0b11){
         sacar_chorro();
      }
      //controlamos regresar chorrro
      if(entradas==0b01){
         meter();
      }
      //controlamos detener motor
      if(entradas==0b00){
         detener();
      }
    
      
   }
}
