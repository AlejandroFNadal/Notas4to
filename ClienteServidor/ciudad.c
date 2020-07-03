#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    FILE *fichero;
    
    
    fichero = fopen("ciudades.txt", "w+");
    
    
    int count = 1;
    while(count < 92){
        fprintf(fichero,"{\n");
        fprintf(fichero,"\"idCiudad\":%d",count);
        fprintf(fichero,",\n\"nombreCiudad\":\"\",\n");
        fprintf(fichero,"\"latitud\":,\n");
        fprintf(fichero,"\"longitud\":\n},\n");
        count += 1;
    }
    fclose(fichero);
}