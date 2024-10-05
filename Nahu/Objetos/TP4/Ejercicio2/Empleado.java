package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado (String unNombre, double unSueldo, int unAño){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unAño);
    }
    
    private void setNombre(String unNombre){
        nombre = unNombre;
    } 
    
    private void setSueldo(double unSueldo){
        sueldo = unSueldo;
    }
    
    private void setAntiguedad (int unAño){
        antiguedad = unAño;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public double getSueldo(){
        return sueldo;
    }
    
    public int getAntiguedad(){
        return antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public abstract double extra();
    
    public double calcularSueldoACobrar() {
        double aux = getSueldo() + ((getSueldo())*0.10)*getAntiguedad()+this.extra();
        return aux;
    }
    
    public String toString(){
        String aux = "El empleado: "+getNombre()+
                     " debe cobrar: "+this.calcularSueldoACobrar()+
                     " y tiene una efectividad de "+this.calcularEfectividad();
        return aux;
    }
    
    
    
}
