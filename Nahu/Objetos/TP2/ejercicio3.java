package tema2;

import PaqueteLectura.Lector;

public class Ejercicio3 {

    public static void main(String[] args) {
        
        Persona [][] matriz = new Persona [5][8];
        int cant = 0;
        String nom = "";
        int edad, dni;
        
        for (int i = 0; i < 5 && cant < 40 && !nom.equals("ZZZ"); i++) {
            for (int j = 0; j < 8 && cant < 40 && !nom.equals("ZZZ"); j++) {
                System.out.println("Ingrese nombre (ZZZ para finalizar): ");
                nom = Lector.leerString();
                if (!nom.equals("ZZZ")) { 
                    System.out.println("Ingrese edad: ");
                    edad = Lector.leerInt();
                    System.out.println("Ingrese DNI: ");
                    dni = Lector.leerInt();
                    matriz[i][j] = new Persona(nom, dni, edad);
                    cant++;
                }
            }
        }
        
        System.out.println("Listado de inscriptos por día y turno:");
        for (int i = 0; i < 5; i++) {  
            for (int j = 0; j < 8; j++) {  
                if (matriz[i][j] != null) {
                    System.out.println("Día " + (i + 1) + ", Turno " + (j + 1) + ": " + matriz[i][j].getNombre());
                }
            }
        }
    }
}
