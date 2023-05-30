#include <16F84A.h>
#fuses XT, NOWDT
#use delay(clock = 4000000)
#include <stdio.h>
#include <stdlib.h>

//Registros a definir
   //Puerto B
   #byte TRISB=0x86
   #byte PORTB=0x06
 


void main(){
      TRISB=0x00;    //Todos los pines del puerto B como salidas
      PORTB=0x00; 
   
   while(1){
   //0grados
   if(RB0=1){
      _delay(350);
      RBO=0;
   }
   //90 grados
   if(RB1=1){
      _delay(1330);
      RB1=0;
   }
   //180 grados
      if(RB2=1){
      _delay(2150);
      RB2=0;
   }
   

}

}
