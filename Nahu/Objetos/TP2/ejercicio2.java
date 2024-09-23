
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
    
        GeneradorAleatorio.iniciar();
        
        Persona [] vector = new Persona [15];
        int edad = GeneradorAleatorio.generarInt(70);
        int dni =  GeneradorAleatorio.generarInt(99999999);
        int cant =0;
        int min = 99999999;
        Persona persoDniMenor = null;
        
        int i = 0;
        while (i <15 && edad !=0){
            vector[i]=new Persona("Juan",dni,edad);
                if (edad >= 65){
                cant++;
            }
            if (min > dni){
                persoDniMenor=vector[i];
                min=dni;
            }
            edad = GeneradorAleatorio.generarInt(70);
            dni =  GeneradorAleatorio.generarInt(99999999);
            i++;
        }

        System.out.println("La cantidad de personas mayores a 65 son de: "+cant);
        
        if (persoDniMenor != null){
            System.out.println("La persona con menor DNI es: "+persoDniMenor.toString());
            
        }
    }
    
}
