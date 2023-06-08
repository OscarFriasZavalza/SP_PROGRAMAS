#include <16F84A.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#use fast_io(B) // Configuramos los TRIS solo una vez, es la forma m?s r?pida de trabajar con los puertos
#use fast_io(A)


void frente(void) // Ambos motores al m?ximo de potencia
{
   output_high(PIN_B0);
   output_high(PIN_B3);
}

void izquierda(void) // La potencia del motor derecho es mayor a la del izquierdo
{
   output_low(PIN_B0);
   output_high(PIN_B3);
}

void derecha(void)
{
  output_high(PIN_B0);
   output_low(PIN_B3);
}


void detener(void)
{
output_low(PIN_B0);
output_low(pIN_B3);
}
void arrancar(void){
output_high(PIN_B2);
output_high(pIN_B5);
}
void main(void)
{ 
   int sensores = 0b00;
   set_tris_B(0b00000000); // Puerto B como salidas
   set_tris_A(0b11111111); // Puerto A como entradas digitales

   arrancar();

   // Direcci?n de los motores hacia adelante
   output_high(PIN_B0);
   output_low(PIN_B1);
   output_high(PIN_B3);
   output_low(PIN_B4);


   while (1)
   {
      sensores = input_A(); // Lectura de los sensores en el puerto A

      // Control del movimiento del robot en funci?n de los sensores
    
      if (sensores == 0b00)
         frente();
      if (sensores == 0b01)
         derecha();
      if(sensores==0b10)
         izquierda();
      if(sensores==0b11)
         detener();
      
  
   }
}
