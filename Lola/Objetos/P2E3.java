/*
- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

    a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
    nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
    personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
    siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
    40 cupos de casting.

    Una vez finalizada la inscripción:
    b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.

NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.
 */

package Practica2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class P2E3 {

    public static void main(String[] args) {
        
        //matriz
        int df = 8; //filas (turnos)
        int dc = 5; //columnas (dias)
        Persona [][] matriz = new Persona[df][dc];
        
        //cargar matriz
        int j=0;
        int i=0;
        String nombre = "";
        
        while ((i<dc) && (!nombre.equals("ZZZ"))){ //DIA
            System.out.println("-----------------Dia "+(i+1));
            j=0;
            
            while ((j<df) && (!nombre.equals("ZZZ"))){ //TURNO
                
                nombre = GeneradorAleatorio.generarString(5);
                System.out.println("Nombre: "+nombre);
                
                int DNI = GeneradorAleatorio.generarInt(1000);
                System.out.println("DNI: "+DNI);
                
                int edad = GeneradorAleatorio.generarInt(100)+1;
                System.out.println("Edad: "+edad);
                
                Persona p = new Persona(nombre, DNI, edad);
                matriz[j][i] = p;
                j++;
            }
            i++;
        }
        
        //informar
        if (matriz[j][i]!=null){
            for (j=0; j<dc; j++){
                for (i=0; i<df; i++){
                   System.out.println("Dia: "+(j+1)+". Turno: "+(i+1)+". Nombre: "+(matriz[j][i]).getNombre());
                }    
            }
        }
        
    }
    
}
