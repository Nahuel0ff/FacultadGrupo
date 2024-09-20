/*
    Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
    la matriz con números aleatorios entre 0 y 30.
    Luego realice las siguientes operaciones:

        - Mostrar el contenido de la matriz en consola.

        - Calcular e informar la suma de los elementos de la fila 1

        - Generar un vector de 5 posiciones donde cada posición j contiene la suma
        de los elementos de la columna j de la matriz. Luego, imprima el vector.

        - Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
        encontrarse indique su ubicación (fila y columna) en caso contrario
        imprima “No se encontró el elemento”.

    NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java
 */
package Practica1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class P1E3 {

    public static void main(String[] args) {
        //Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
         
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios
        int i, j;
        int df = 5;
        int dc = 5;
        int dfVec = 5;
        
        int matriz [][] = new int [df][dc];
        int vec [] = new int [dfVec];
        
        
        for (i=0; i<df; i++){
            for (j=0; j<dc;j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        
        
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0; i<df; i++){
            System.out.println("---------------------------");
            for (j=0; j<dc;j++){
                System.out.println("("+i+","+j+")" + matriz[i][j] + "|");
            }
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (i=0; i<1; i++){
            System.out.println("---------------------------");
            for (j=0; j<dc;j++){
                suma = suma + matriz[i][j];
            }
        }
        
        System.out.println("La suma de los elementos de la fila 1 es: " + suma);
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene
        //la suma de los elementos de la columna j de la matriz. Luego, imprima el vector.
        
        for (j=0; j<dfVec; j++){    //inicializo el vector en 0
              vec[j] = 0;
        }
        
        for (j=0; j<dfVec; j++){    //sumo las columnas y las guardo en el vector
            for (i=0; i<dfVec; i++){
                vec[j] = vec[j] + matriz[i][j];
            }
        }
        
        for (j=0; j<dfVec; j++){    //imprimo
            System.out.println("Pos "+j+": " + vec[j]);
        }
        
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz.
        //En caso de encontrarse indique su ubicación (fila y columna)
        //y en caso contrario imprima "No se encontró el elemento".
        
        int num;
        System.out.println("Ingresa un numero para buscarlo en la matriz: ");
        num = Lector.leerInt();
        
        for (i=0; i<df; i++){
            for (j=0; j<dc;j++){
                if (num == matriz[i][j]){
                    System.out.println("En la ubicacion ("+i+","+j+") se encuentra el numero: " + matriz[i][j] + " identico a " + num);
                }
            }
        }
        
    }
    
}
