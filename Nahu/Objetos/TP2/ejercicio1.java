
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio1 {

    
  
    public static void main(String[] args) {
    
        System.out.println("Ingrese un nombre: ");
        String nom = Lector.leerString();
        System.out.println("Ingrese un DNI: ");
        int dni = Lector.leerInt();
        System.out.println("Ingrese una edad: ");
        int edad = Lector.leerInt();
        
        
        Persona personaUno = new Persona(nom,dni,edad);
        
        System.out.println(personaUno.toString());
        
    }
    
}
