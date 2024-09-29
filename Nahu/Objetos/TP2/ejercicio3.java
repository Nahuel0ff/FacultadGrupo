package tema2;

import PaqueteLectura.Lector;

public class ejercicio3 { //Las filas (dias) pueden no estar completas pero las columnas (turnos) siempre se completan
    public static void main(String[]args){
        Persona per;
        Persona[][] matriz = new Persona[5][8];
        int fila = 0;
        int columna = 0;
        int i;
        int j;
        String nom;
        
        System.out.print("Nombre: ");
        nom = Lector.leerString();
        while((fila < 5)&&(!nom.equals("ZZZ"))){
            System.out.print("Dni: ");
            int dni = (Lector.leerInt());
            System.out.print("Edad: ");
            int edad = (Lector.leerInt());
            per = new Persona(nom,dni,edad);
            matriz [fila][columna] = per;
            columna++;
            if(columna == 8){
                columna=0;
                fila++;
            }
            System.out.println("-------------------");
            System.out.print("Nombre: ");
            nom = Lector.leerString();
            
        } 
        
        for(i = 0; i<fila; i++){
            System.out.println("---Dia---"+i);
            for(j = 0; j<8; j++){
              System.out.println("-Turno: "+j);
              System.out.println("El nombre de la persona a entrevistar ese día y turno es: " + matriz[i][j].getNombre());
              System.out.println();
            }
           
        }
      }
    }
        
