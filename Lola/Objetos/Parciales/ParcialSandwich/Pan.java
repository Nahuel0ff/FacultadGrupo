/*
 
 */
package Parciales;


public class Pan extends Componente {
    
    private String calidad; //premium o normal

    
    
    // CONSTRUCTOR //
    
    public Pan (String nombre, double costo, String calidad){
        super(nombre, costo);
        this.setCalidad(calidad);
    }
    
    
    
    // GETTERS Y SETTERS //
    
    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }
    
    // MÉTODOS //
    
    public double calcularCostoFinal(){
        double costo = this.getCosto();
        
        if (this.getCalidad().equals("Premium"))
            costo = costo + (costo * 0.20);
        
        return costo;
    }
    
    public String toString(){
        String aux;
        aux = super.toString() + " -Calidad: " + this.getCalidad();
        return aux;
    }
    
}
