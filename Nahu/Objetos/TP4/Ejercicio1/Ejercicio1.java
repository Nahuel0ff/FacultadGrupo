
package tema4;


public class Ejercicio1 {

   
    public static void main(String[] args) {
       
        Circulo circulito = new Circulo ("Rojo","Azul",2.0);
        Triangulo tri = new Triangulo ("Rojo","Azul",1.5,15.0,4.0);
        
        
        System.out.println(circulito.toString());
        System.out.println(tri.toString());
        
        tri.setDespintar();
        
        System.out.println(tri.toString());
        
        
        
    }
    
}
