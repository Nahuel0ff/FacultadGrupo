
package tema4;


public class Circulo extends Figura{
    private double radio;
    
    
    public Circulo(String unCR, String unCL, double unRadio) {
        super(unCR, unCL);
        setRadio(unRadio);
    }

    public double getRadio (){
        return radio;
    }
    
    
    private void setRadio (double unRadio){
        radio = unRadio;
    }
   
    
    @Override
    public double calcularArea() {
        double aux = Math.PI * Math.pow(this.getRadio(),2);
        return aux;
    }

    @Override
    public double calcularPerimetro() {
        double aux = 2 * Math.PI * this.getRadio();
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + " Radio " + getRadio() ;
        return aux;
    }
    
}
