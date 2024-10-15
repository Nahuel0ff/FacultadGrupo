/*
 */
package Parciales;


public abstract class Componente {
    
    private String nombre;
    private double costo;

    
    
    // CONSTRUCTOR //
    
    public Componente (String nombre, double costo){
        this.setNombre(nombre);
        this.setCosto(costo);
    }
    
    
    
    // GETTERS Y SETTERS //
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    
    
    // MÉTODOS //
    
    public String toString(){
        String aux;
        aux = "\n" + "Nombre: " + this.getNombre() + "\n" +
                "Costo: " + this.calcularCostoFinal();
        return aux;
    }
    
    
    
    // MÉTODO ABSTRACTO //
    
    public abstract double calcularCostoFinal(); 
    
}
