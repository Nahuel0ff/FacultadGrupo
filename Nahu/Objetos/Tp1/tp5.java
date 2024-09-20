package ejercicio5Tp1;

import PaqueteLectura.Lector;


public class ejercicio5 {
 
    public static void main(String[] args) {
        
        int [][] matriz = new int [5][4];
        double [] vectorProm = new double [4];
        
        
        for (int i=0;i<5;i++){
            System.out.println("Cliente " + (i + 1) + ":");
            for (int j=0;j<4;j++){
                System.out.println("Ingrese la calificacion de del 1 al 10 en la categoria: "+(j+ 1));
                matriz[i][j]= Lector.leerInt();
            }

        }
        
        for (int i=0;i<5;i++){
            for (int j=0;j<4;j++){
                vectorProm [j]+=matriz[i][j];
            }
        }
        
        for (int i=0;i<4;i++){
            vectorProm [i]= vectorProm [i]/5;
        }
        
        for (int i=0;i<4;i++){
          System.out.println("Los promedios son: "+vectorProm [i]);
        }
        
    }
    
}
