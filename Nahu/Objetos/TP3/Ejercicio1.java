package tema3;

import PaqueteLectura.Lector;

public class Ejercicio1 {

    public static void main(String[] args) {
    
        
        
        double lado1 = Lector.leerDouble();
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        String fondo = Lector.leerString();
        String linea = Lector.leerString();
        
        Triangulo triangulo = new Triangulo(lado1,lado2,lado3,fondo,linea);
        
        System.out.println(triangulo.calcularArea());
        System.out.println(triangulo.calcularPerimetro());
    }
    
}
