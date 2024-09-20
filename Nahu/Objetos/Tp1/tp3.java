package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int [5][5];
        
        
        for (int i=0;i<5;i++){
            for (int j=0;j<5;j++){
                matriz[i][j]=GeneradorAleatorio.generarInt(31);
            }
        }
        
        //Paso 4. mostrar el contenido de la matriz en consola
         for (int i=0;i<5;i++){
            for (int j=0;j<5;j++){
                System.out.println("El numero es: "+matriz[i][j]+" en la fila: "+i+" y la columna: "+j);
            }
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        System.out.println("--------------------");
        int suma = 0;
        for (int j=0;j<5;j++){
               suma += matriz[1][j];
        }
        System.out.println("La suma total de la fila 1 es de: "+suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        System.out.println("----------");
        int [] vector = new int[5];
        
        for (int i=0; i<5;i++){
            for (int j=0;j<5;j++){
                vector[j]+= matriz[i][j];
            } 
        }
        
        for (int j=0;j<5;j++){
            System.out.println("La posicion: "+j+" contiene el valor: "+vector[j]);
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("Ingrese el numero a buscar: ");
        int num = Lector.leerInt();
        
        int col=0;
        int fila=0;
        boolean existe = false;
        
        for (int i =0; i<5 && !existe;i++){
            for (int j=0;j<5 && !existe;j++){
                if (matriz[i][j]==num){
                    existe=true;
                    fila=i;
                    col=j;
                }
            }
        }
        
        if (existe){
            System.out.println("Se encontró el numero: "+num+" en la fila"+fila+" y la columna "+col);
        }
        if (!existe){
            System.out.println("No se encontró el numero: "+num);
        }
    }
}
