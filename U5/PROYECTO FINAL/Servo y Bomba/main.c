#include <16F84A.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#USE STANDARD_IO(A)
#USE STANDARD_IO(B)
#define SERVO_PIN PIN_B0
#define BOMBA_PIN PIN_B1


void main()
{
 

   while (1)
   {
      if(input(PIN_A0)==0){
       output_high(BOMBA_PIN);
         //prendemos servomotor
         output_high(SERVO_PIN); // Activar el servo
         delay_us(1000); // Retardo proporcional a la posici�n
         output_low(SERVO_PIN); // Desactivar el servo
         delay_ms(500); // Retardo entre posiciones
    
         output_high(SERVO_PIN); // Activar el servo
         delay_us(2000); // Retardo proporcional a la posici�n
         output_low(SERVO_PIN); // Desactivar el servo
         delay_ms(500); // Retardo entre posiciones
                
      }else{
         output_low(BOMBA_PIN);
         output_low(SERVO_PIN); // Desactivar el servo
      }
        
   }
}

