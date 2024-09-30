
package tema3;


public class Circulo {
    
    private double radio;
    private String relleno;
    private String linea;
    
    public Circulo (double unRadio, String unColor, String unaLinea){
        radio = unRadio;
        relleno = unColor;
        linea = unaLinea;
    }
    
    public double getRadio(){
        return radio;
    }
    
    public String getColor(){
        return relleno;
    }
    
    public String getLinea(){
        return linea;
    }
    
    public void setRadio(double unRadio){
        radio = unRadio;
    }
    
    public void setColor (String unColor){
        relleno = unColor;
    }
    
    public void setLinea(String unaLinea){
        linea = unaLinea;
    }
    
    public double calcularPerimetro(){
        double aux = 2* Math.PI * radio;
        return aux;
    }
    
    public double calcularArea(){
        double aux = Math.PI * Math.pow(radio,2);
        return aux;
    }
    
    
    
    
    
    
    
    
    
}
