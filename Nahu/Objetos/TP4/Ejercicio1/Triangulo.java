package tema4;

public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    public Triangulo(String unCR, String unCL, double unLado1, double unLado2, double unLado3) {
        super(unCR, unCL);
        setLado1(unLado1);
        setLado2(unLado2);
        setLado3(unLado3);
    }
    
    private void setLado1(double unLado1){
        lado1= unLado1;
    }
    
    private void setLado2(double unLado2){
        lado2= unLado2;
    }
    
    private void setLado3(double unLado3){
        lado3= unLado3;
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
    
    
    @Override
    public double calcularArea() {
        double s = 2/(this.getLado1() + this.getLado2() + this.getLado3());
        double aux = s*((s - this.getLado1()) * (s - this.getLado2()) * (s - this.getLado3())) ;
        return Math.sqrt(aux);
    }

    @Override
    public double calcularPerimetro() {
        double aux = this.getLado1() + this.getLado2() + this.getLado3();
        return aux;
    }

    @Override
    public String toString() {
        String aux = super.toString() + " Lado 1: "+ this.getLado1()+ " Lado 2: "+ this.getLado2()+" Lado 3: "+this.getLado3();
        return aux;
                
    }
    
    
    
}
