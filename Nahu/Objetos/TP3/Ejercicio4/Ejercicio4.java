package tema3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4 {

    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        int n = 40;
        Hotel hotel = new Hotel(n);
        
        int cant = 0;
        while (cant < n){
            double precio = GeneradorAleatorio.generarDouble((6000.00)+2000.00);
            String nom = Lector.leerString();
            int dni = Lector.leerInt();
            int edad = Lector.leerInt();
            Cliente cli = new Cliente (nom,dni,edad);
            
            cant++;
        }
        
        Cliente c = new Cliente("Carlos",33444111,47);
        Habitacion hab1 = new Habitacion (3000.00,true,c);
        
       
        
        
        
        
        
        
        
        
        
        
        
    }
    
}
