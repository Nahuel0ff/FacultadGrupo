package tema4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4 {

// SINCERAMENTE DA RARA UNA PARTE PERO ES UN EMBOLE    
    
    public static void main(String[] args) {
        int z,y;
        SistemaAnual sistemaA;
        SistemaMes sistemaM;
        
        sistemaA = new SistemaAnual("La Plata",-34.921,57.955,2021,3);
        for (z=0;z<3;z++){
            for(y=0;y<12;y++){
                sistemaA.registrarTemp(GeneradorAleatorio.generarDouble(90), z, y);
            }
        }
        
        sistemaM = new SistemaMes("Mar del plata",-38.002,-57.556,2020,4);
         for(z=0;z<3;z++){
            for(y=0;y<12;y++){
                    sistemaM.registrarTemp(GeneradorAleatorio.generarDouble(90)-30,z,y);
                }
            }
        
        
        System.out.println(sistemaA.toString());
        System.out.println(sistemaM.toString());
        
        
        
    }
    
}
