package ejercicio4practica5;

public class Director extends Integrante {
    private int antiguedad;
    
    
    public Director(String nombre, int DNI, int edad,int antiguedad) {
        super(nombre, DNI, edad);
        setAntiguedad(antiguedad);
    }

    private int getAntiguedad() {
        return antiguedad;
    }

    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
   
    
    
    
    
}
