/*
    Programador tiene nombre, dni, sueldo, cantidad de lineas de codigo por hora y un lenguaje de preferencia.
 */
package Parciales;


public class Programador {
    
    // ATRIBUTOS //
    
    private String nombre;
    private int dni;
    private double sueldo;
    private int cantLineas;
    private String lenguaje;
    
    
   
    // CONSTRUCTORES //
 
    public Programador (String nombre, int dni, double sueldo, int cantLineas, String lenguaje){
        this.setNombre(nombre);
        this.setDni(dni);
        this.setSueldo(sueldo);
        this.setCantLineas(cantLineas);
        this.setLenguaje(lenguaje);
    }
    
    
    // MÉTODOS //

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getCantLineas() {
        return cantLineas;
    }

    public void setCantLineas(int cantLineas) {
        this.cantLineas = cantLineas;
    }

    public String getLenguaje() {
        return lenguaje;
    }

    public void setLenguaje(String lenguaje) {
        this.lenguaje = lenguaje;
    }
    
    
    
    public double calcularSueldoFinal(){
        double sueldoFinal=this.getSueldo();
        
        if (this.getCantLineas()>200)
            sueldoFinal = sueldoFinal + 50000;
        
        return sueldoFinal;
    }
    
    public String toString(){
        String aux="";
        aux = " Nombre: " + this.getNombre() +
                ". Dni: " + this.getDni() + 
                ". Lenguaje: " + this.getLenguaje() + 
                ". Sueldo final: " + this.calcularSueldoFinal();
        return aux;
    }
    
}
