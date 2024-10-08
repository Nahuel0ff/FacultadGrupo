package ejercicio4practica5;

public class Corista extends Integrante {
    private int tonoFund;
    
    public Corista(String nombre, int DNI, int edad,int tonoFund) {
        super(nombre, DNI, edad);
        setTonoFund(tonoFund);
    }

    private int getTonoFund() {
        return tonoFund;
    }

    private void setTonoFund(int tonoFund) {
        this.tonoFund = tonoFund;
    }
    
    
    
    
    
}
