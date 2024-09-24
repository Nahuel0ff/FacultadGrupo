/*
UUtilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas.

La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:

    - Informe la cantidad de personas mayores de 65 años.
    - Muestre la representación de la persona con menor DNI
 */
package Practica2;

import PaqueteLectura.GeneradorAleatorio;

public class P2E2 {

    public static void main(String[] args) {
        //vector de personas
        
        Persona [] vector = new Persona[15];
        int i = 0;
        int df = 15;
        
        
        // crear vector
        
        int edad = GeneradorAleatorio.generarInt(100)+1;
        
        while ((i < df) && (edad!=0)){
            String nombre = GeneradorAleatorio.generarString(5);
            int DNI = GeneradorAleatorio.generarInt(1000);
            
            // se almacenaron los 3 datos, los guardo en el vector en la posicion i
            vector[i] = new Persona(nombre,DNI, edad);
            i++;
            edad = GeneradorAleatorio.generarInt(100)+1;
            
        }
        
        //informar la cantidad de personas mayores de 65 años
        //y la representación de la persona con menor DNI
        int cant = 0;
        int min = 9999;
        Persona personaMenorDNI = new Persona();
        
        for (int j=0; j<i ; j++){
            if (vector[j].getEdad() > 65){
                cant++;
            }
            if (vector[j].getDNI() < min){
                min = vector[j].getDNI();
                personaMenorDNI = vector[j];
            }
        }
        
        System.out.println("Hay "+cant+" personas mayores de 65.");
        System.out.println("Persona con menor DNI: " + personaMenorDNI.toString());
    }
    
}
