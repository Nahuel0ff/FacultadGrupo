/*
 El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
 (con puntaje de 1 a 10) los siguientes aspectos:
    (0) Atención al cliente
    (1) Calidad de la comida
    (2) Precio
    (3) Ambiente.

    Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
    para cada uno de los aspectos y almacene la información en una estructura. Luego
    imprima la calificación promedio obtenida por cada aspecto
 */
package Practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class P1E5 {

    public static void main(String[] args) {
        
        //variables y type
        int i, j;
        
        int df = 4;      //dimension filas (aspectos)
        int dc = 5;      //dimension columnas (clientes)
        int matriz[][] = new int [df][dc];
        
        
        //cargar matriz
        System.out.println("ASPECTOS: (0) Atención al cliente // (1) Calidad de la comida // (2) Precio // (3) Ambiente.");
        for (i=0; i<dc;i++){
            System.out.println("Cliente "+(i+1)+":");
            for (j=0; j<df;j++){
                System.out.println("Puntaje aspecto "+j+":");
                matriz[j][i] = Lector.leerInt();
            }
        }
        
        //obtener promedio
        double prom = 0;
        
        for (j=0; j<df;j++){
            for (i=0; i<dc;i++){
               prom = prom + matriz[j][i];
            }
            
            prom = prom/dc;
            System.out.println("El promedio del aspecto "+j+" es: "+ String.format("%.2f",prom));
        }
        
    }
    
}
