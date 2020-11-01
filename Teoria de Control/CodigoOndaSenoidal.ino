#include <math.h>
void setup()
{
  pinMode(13, OUTPUT);
  pinMode(6,OUTPUT);
  Serial.begin(9600);
}

int time=0;
float tiempo_decimal;
float valor;
int valor_entero;
void loop()
{
	time =  millis();
  	tiempo_decimal=(float)time;
  	valor = 5*sin(2*3.14*3*tiempo_decimal);
  	valor = 100.00*valor;
  	valor_entero = trunc(valor);
  	
  	valor_entero = map(valor_entero,-500,500,0,255);
  	Serial.println(valor_entero);
  	analogWrite(6,valor_entero);
}