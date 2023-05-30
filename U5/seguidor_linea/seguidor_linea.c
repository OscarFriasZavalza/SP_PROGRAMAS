#include <16F84A.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#use fast_io(B) // Configuramos los TRIS solo una vez, es la forma m�s r�pida de trabajar con los puertos
#use fast_io(A)

int pot_izq = 0; // Potencia del motor izquierdo
int pot_der = 0; // Potencia del motor derecho
int k_cerradas = 20; // Constante para curvas cerradas (0-255) 0 es curva muy cerrada, 255 es una recta --> Se recomienda usar un valor mayor a 20
int k = 150; // Constante para giro leve --> Se recomienda ajustar seg�n las caracter�sticas del robot

void frente(void) // Ambos motores al m�ximo de potencia
{
   pot_izq = 255;
   pot_der = 255;
}

void izquierda(void) // La potencia del motor derecho es mayor a la del izquierdo
{
   pot_izq = k;
   pot_der = 255;
}

void izquierda_cerrada(void)
{
   pot_izq = k_cerradas;
   pot_der = 255;
}

void derecha(void)
{
   pot_izq = 255;
   pot_der = k;
}

void derecha_cerrada(void)
{
   pot_izq = 255;
   pot_der = k_cerradas;
}

void main(void)
{ 
   int sensores = 0b000;
   set_tris_B(0b10000000); // Puerto B como salidas
   set_tris_A(0b11111111); // Puerto A como entradas digitales
  // OUTPUT_B(0); // Inicializamos en 0 el puerto B

   // Direcci�n de los motores hacia adelante
   output_high(PIN_B0);
   output_low(PIN_B1);
   output_high(PIN_B3);
   output_low(PIN_B4);

   while (1)
   {
      sensores = input_A(); // Lectura de los sensores en el puerto A

      // Control del movimiento del robot en funci�n de los sensores
      if (sensores == 0b001)
         derecha_cerrada();
      if (sensores == 0b011)
         derecha();
      if (sensores == 0b100)
         izquierda_cerrada();
      if (sensores == 0b110)
         izquierda();
      if(sensores==0b010)
         frente();
      // Control de los motores izquierdo y derecho mediante el ajuste de los pines B2 y B5
      output_high(PIN_B2); // Activa el motor izquierdo
      delay_us(pot_izq); // Retardo proporcionado por la potencia establecida en "pot_izq"

      output_low(PIN_B2); // Desactiva el motor izquierdo
      delay_us(255 - pot_izq); // Retardo complementario para mantener el ciclo de trabajo

      output_high(PIN_B5); // Activa el motor derecho
      delay_us(pot_der); // Retardo proporcionado por la potencia establecida en "pot_der"

      output_low(PIN_B5); // Desactiva el motor derecho
      delay_us(255 - pot_der); // Retardo complementario para mantener el ciclo de trabajo
      
      if(input_state(PIN_B7)==1){
         output_high(PIN_B6);
      } else output_low(PIN_b6);
   }
}

