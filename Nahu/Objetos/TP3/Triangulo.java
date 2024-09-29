/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author nahue
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String fondo;
    private String linea;
    
    public Triangulo (double primerLado, double segundoLado, double tercerLado, String colorFondo, String colorLinea){
        lado1 = primerLado;
        lado2 = segundoLado;
        lado3 = tercerLado;
        fondo = colorFondo;
        linea = colorLinea;
    }
    
    public double getLado1(){
        return lado1;
    } 
    
    public double getLado2(){
        return lado2;
    } 
    
    public double getLado3(){
        return lado3;
    } 
    
    public String getFondo(){
        return fondo;
    }
    
    public String getLinea(){
        return linea;
    }
    
    public void setLado1(double primerLado){
        lado1 = primerLado;
    }

     public void setLado2(double segundoLado){
        lado2 = segundoLado;
    }
    
    public void setLado3(double tercerLado){
        lado3 = tercerLado;
    }
    
    public void setFondo (String colorFondo){
        fondo = colorFondo;
    }
    
    public void setLinea (String colorLinea){
        linea = colorLinea;
    }
    
    public double calcularPerimetro(){
        double aux = lado1+lado2+lado3;
        return (aux);
    }
    
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (s - lado1) * (s - lado2) * (s - lado3));
    }
    
    
}
