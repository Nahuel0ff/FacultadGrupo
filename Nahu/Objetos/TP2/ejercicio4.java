package tema2;

import PaqueteLectura.Lector;

public class Ejercicio4 {

    public static void main(String[] args) {

        Persona[][] matriz = new Persona[5][8];
        int[] vectorCant = new int[5];
        

        for (int i = 0; i < 5; i++) {
            vectorCant[i] = 0;
        }

        int cant = 0;
        String nom;
        int edad, dni;

        System.out.println("Ingrese nombre (ZZZ para finalizar): ");
        nom = Lector.leerString();


        while (cant < 40 && !nom.equals("ZZZ")) {
            System.out.println("Ingrese edad: ");
            edad = Lector.leerInt();
            System.out.println("Ingrese DNI: ");
            dni = Lector.leerInt();
            System.out.println("Ingrese día (1 a 5): ");
            int dia = Lector.leerInt() - 1;
            if (dia >= 0 && dia < 5) {
                if (vectorCant[dia] < 8) {
                    matriz[dia][vectorCant[dia]] = new Persona(nom, dni, edad);
                    vectorCant[dia]++;
                    cant++;
                } else {
                    System.out.println("No quedan cupos disponibles en el día " + (dia + 1));
                }
            } else {
                System.out.println("Día inválido. Debe estar entre 1 y 5.");
            }

            System.out.println("Ingrese nombre (ZZZ para finalizar): ");
            nom = Lector.leerString();
        }

        System.out.println("Listado de inscriptos por día y turno:");
        for (int i = 0; i < 5; i++) {
            System.out.println("Día " + (i + 1) + ": " + vectorCant[i] + " inscriptos.");
            for (int j = 0; j < vectorCant[i]; j++) {
                System.out.println("  Turno " + (j + 1) + ": " + matriz[i][j].getNombre());
            }
        }
    }
}
