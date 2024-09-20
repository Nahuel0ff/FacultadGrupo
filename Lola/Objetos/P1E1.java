/*

 Analice el programa Ej01Tabla2.java, que carga un vector que representa la tabla
 del 2.
 Genere enteros aleatorios hasta obtener el número 11. Para cada número muestre
 el resultado de multiplicarlo por 2 (accediendo al vector).

 */
package Practica1;


import PaqueteLectura.GeneradorAleatorio;

public class P1E1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar(); //"mezclo el bolillero"
       
        int DF=11;  
        int [] tabla = new int[DF]; // indices de 0 a 10;
        int i, num;
        
        for (i=0;i<DF;i++){
            num = GeneradorAleatorio.generarInt(12);
            if (num != 11){
                tabla[i]= num;
                System.out.println("2x" +num+ "= "+ tabla[i]*2);
            }
            else{
               System.out.println("Num es 11!");
               i=11;
            }
        }
    }
    
}
