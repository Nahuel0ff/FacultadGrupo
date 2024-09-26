/*
 Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
    a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
    y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
    siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
    La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
    casting.

 Una vez finalizada la inscripción:
    b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
    persona a entrevistar en cada turno asignado.

 */
package Practica2;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class P2E4 {

    public static void main(String[] args) {
      // variables y types
      int df=5;
      int dc=8;
      
      Persona matriz[][] = new Persona[df][dc]; //matriz 5x8
      int vTurnos[] = new int[df]; //vector [5] (cuenta la cantidad de turnos por día)
      
      String nombre;
      int DNI, edad, dia;
      
      int i=0;
      int j=0;
      int cupos = 0;
      // inciso a
      System.out.println("[]Nombre: ");
      nombre = Lector.leerString();
      
    
      while (!nombre.equals("zzz") && (cupos < 40)){
        
        System.out.println("DIA: ");
        dia = (Lector.leerInt())-1;
        
        if ((dia >= 0) && (dia < 5)){
            
            
            if (vTurnos[dia]<8){
                System.out.println("[]DNI: ");
                DNI = Lector.leerInt();
                System.out.println("[]Edad: ");
                edad = Lector.leerInt();
                
                matriz[dia][vTurnos[dia]] = new Persona(nombre,DNI,edad);
                cupos++;
                vTurnos[dia]++;
            }
            else{
                System.out.println("No hay más turnos disponibles ese día.");
            }
        }
        else {
            System.out.println("Día invalido. Debe ser entre 1 y 5.");
        }
          
        System.out.println("[]Nombre: ");
        nombre = Lector.leerString();
        
        } 
      
       // inciso b
       for (i=0;i< 5;i++){
           System.out.println("Dia: "+(i+1)+". Cantidad inscriptos: "+vTurnos[i]);
            for (j=0;j<vTurnos[i];j++){
               System.out.println("Turno: "+(j+1)+". Nombre: "+matriz[i][j].getNombre());
           }
           
       }
    }
}
