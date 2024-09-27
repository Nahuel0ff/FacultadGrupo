/*
    a) Definir una clase para representar triángulos. Un triángulo se caracteriza por el
    tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).

    Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
    Provea métodos para:
        - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
        - Calcular el perímetro y devolverlo (método calcularPerimetro)
        - Calcular el área y devolverla (método calcularArea)

    b) Realizar un programa que instancie un triángulo, le cargue información leída desde
    teclado e informe en consola el perímetro y el área.
    NOTA: Calcular el área con la fórmula del area , donde a, b y c
    son los lados. La función raíz cuadrada es Math.sqrt(#).
 */
package Practica3;

import PaqueteLectura.Lector;

public class P3E1 {

    
    public static void main(String[] args) {
        double l1, l2, l3;
        String colorR,colorL;
        
        System.out.print("Lados 1, 2 y 3 del triángulo: ");
        l1 = Lector.leerDouble();
        l2 = Lector.leerDouble();
        l3 = Lector.leerDouble();
        
        System.out.print("Color de relleno del triángulo: ");
        colorR = Lector.leerString();
        
        System.out.print("Color de linea del triángulo: ");
        colorL = Lector.leerString();
        
        Triangulo tri = new Triangulo (l1, l2, l3, colorR, colorL);
        
        System.out.println("Perímetro: "+tri.calcularPerimetro(l1, l2, l3)+ ". Área: "+ String.format("%.3f",tri.calcularArea(l1, l2, l3)));
        
    }
    
}
