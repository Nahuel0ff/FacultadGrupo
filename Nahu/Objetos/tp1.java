package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        int num;
        
        do{
            num = GeneradorAleatorio.generarInt(12);
            if (num < DF) {
                System.out.println("2 x " + num + " = "+ tabla2[num]);
            }
    
        } while (num != 11);
         System.out.println("¡Número 11 encontrado, fin del programa!");

    }
    
}
