/*
    - Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
   (1..4).

    Realice un programa que permita informar la cantidad de personas que
   concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
   edificio de la siguiente manera:

   A cada persona se le pide el nro. de piso y nro. de
   oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
   de piso 9. Al finalizar la llegada de personas, informe lo pedido.

 */
package Practica1;

//paquetes necesarios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class P1E4 {

  
    public static void main(String[] args) {
        
        //variables y type
        int df=8; //dimension filas (pisos)
        int dc=4; //dimension columnas (oficinas)
        int matriz[][] = new int[df][dc];
        
        int i, j;
        int piso, ofi;
        
        //inicializo matriz en 0
        for (i=0;i<df;i++){
            for (j=0; j<dc; j++){
                matriz[i][j] = 0;
            }
        }
        
        //cargo matriz
        System.out.println("Ingrese una oficina y piso:");
        System.out.print("Oficina (0 a 3): ");
        ofi = Lector.leerInt();
        System.out.print("Piso (0 a 7): ");
        piso = Lector.leerInt();
        
        while ((piso != 9) && (ofi <= dc)) {
            matriz[piso][ofi] = matriz[piso][ofi] + 1;
            
            System.out.println("Ingrese una oficina y piso:");
            System.out.print("Oficina (0 a 3): ");
            ofi = Lector.leerInt();
            System.out.print("Piso (0 a 7): ");
            piso = Lector.leerInt();
        }
        
        for (i=0;i<df;i++){
            for (j=0; j<dc; j++){
                System.out.println("Al piso "+i+" oficina "+j+" concurrieron " + matriz[i][j]+ " persona/s");
            }
        }
    }
    
}
