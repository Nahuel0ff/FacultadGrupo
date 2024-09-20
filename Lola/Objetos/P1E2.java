/*
 - Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
  básquet y las almacene en un vector. Luego informe:
    - la altura promedio
    - la cantidad de jugadores con altura por encima del promedio

  NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
 */

package Practica1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class P1E2 {

    public static void main(String[] args) {
        //Paso 2 y 3: Crear el vector para 15 double
        int DF=15;
        double [] vector = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        double altura, prom;
        int i,cant;
        
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        prom = 0;
        
        for (i=0; i<DF; i++){
            System.out.println("Ingrese la altura del jugador "+(i+1)+":");
            altura = Lector.leerDouble();
            vector[i] = altura;
            prom = prom + vector[i];
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = prom/DF;
        System.out.println("El promedio de altura de los jugadores es: " + String.format("%.2f",prom));
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cant = 0;
        for (i=0; i<DF; i++){
            if (vector[i] > prom){
                cant++;
            }
        }
        
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores con altura mayor al promedio es de: " + cant);
        
    }
    
}
