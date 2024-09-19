package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] vectorAlturas;
        int DF=15;
        
        //Paso 3: Crear el vector para 15 double 
        vectorAlturas = new double[DF]; //del 0 al 14
        
        //Paso 4: Declarar indice y variables auxiliares a usar
          int i;
          double sumaAlturas = 0.0;
          
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
            for (i=0;i<DF;i++){
                System.out.println("Ingrese la altura del jugador "+i);
                vectorAlturas[i]=Lector.leerDouble(); 
                sumaAlturas += vectorAlturas[i];
            }
            
        //Paso 7: Calcular el promedio de alturas, informarlo
                double prom = sumaAlturas / DF;
                System.out.println("Este es el promedio de alturas: " + prom);
                
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
            int cant=0;
            for (i=0;i<DF;i++){
                    if (vectorAlturas[i] > prom){
                        cant++;  
                }
            }
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de jugadores que superan el promedio "+cant);
    }
    
}
