package ejercicio4Tp1;

import PaqueteLectura.Lector;

public class ejercicio4 {

    public static void main(String[] args) {
        
        int[][] matrizEd = new int[8][4];
        
        System.out.println("Ingrese un número de piso entre 1 - 8; 9 para finalizar:");
        int piso = Lector.leerInt();
        
        while (piso != 9) {
            if (piso >= 1 && piso <= 8) { 
                System.out.println("Ingrese un número de oficina entre 1 - 4:");
                int oficina = Lector.leerInt();
                
                if (oficina >= 1 && oficina <= 4) { 
                    matrizEd[piso - 1][oficina - 1] += 1; 
                }
            }
            
            System.out.println("Ingrese un número de piso entre 1 - 8; 9 para finalizar:");
            piso = Lector.leerInt();
        }
     
        System.out.println("Cantidad de personas que concurrieron a cada oficina:");
        for (int i = 0; i < 8; i++) {
            for (int j = 0; j < 4; j++) {
                System.out.println("Piso " + (i + 1) + ", Oficina " + (j + 1) + ": " + matrizEd[i][j] + " personas");
            }
        }
    }
}
