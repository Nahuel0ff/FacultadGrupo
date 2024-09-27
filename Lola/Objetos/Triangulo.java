/*
   Clase triángulo tiene:
    - 3 Lados (double)
    - Color de relleno (string)
    - Color de línea (string)

    Métodos:
    - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
    - Calcular el perímetro y devolverlo (método calcularPerimetro)
    - Calcular el área y devolverla (método calcularArea)
 */
package Practica3;

public class Triangulo {
    
    // ATRIBUTOS //
    
    private double lado1, lado2, lado3;
    private String colorRelleno;
    private String colorLinea;
    
    
    
    // CONSTRUCTOR //

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    
    
    // MÉTODOS SETTERS //
    
    public void setLado1(double lado1){
        this.lado1 = lado1;
    }
    
    public void setLado2(double lado2){
        this.lado2 = lado2;
    }
    
    public void setLado3(double lado3){
        this.lado3 = lado3;
    }
    
    public void setColorRelleno(String colorRelleno){
        this.colorRelleno = colorRelleno;
    }
    
    public void setColorLinea(String colorLinea){
        this.colorLinea = colorLinea;
    }
    
    
    
    // MÉTODOS GETTERS //
    
    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }
    
    
    
    // CALCULAR PERÍMETRO Y DEVOLVERLO //
    
    public double calcularPerimetro(double lado1, double lado2, double lado3){
       double perimetro;
       perimetro = (lado1 + lado2 + lado3);
       
       return perimetro; 
    }
    
    
    
    // CALCULAR AREA Y DEVOLVERLA //
    
    public double calcularArea(double lado1, double lado2, double lado3){
       double area;
       double s;
       
       s = (lado1+lado2+lado3)/2;
       area = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
       return area; 
    }
}
