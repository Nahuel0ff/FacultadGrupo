package ejercicio5Tp1;

import PaqueteLectura.GeneradorAleatorio;


public class ejercicio5 {
 
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
         
        int [][] matriz = new int [4][5];

        for (int i=0;i<4;i++){
         System.out.println("Cliente "+ (i+1)+" :");
         for (int j=0;j<5;j++){
           System.out.println("Ingrese la calificacion del 1 al 10 en la categoria: "+(j+1));
           matriz[i][j]= GeneradorAleatorio.generarInt(11);
         }
        }
        
        for (int i=0;i<4;i++){
           double suma =0;
           for (int j=0;j<5;j++){
               suma +=matriz[i][j];
           }
          System.out.println("Los promedios son: "+suma/5);
        }


        
    }
    
}





     
        /*
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

     */ 
     //TODO ESTO ESTA MAL//

