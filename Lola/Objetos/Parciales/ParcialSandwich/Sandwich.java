/*
 
 */
package Parciales;


public class Sandwich {
    
    // ATRIBUTOS //
    
    private String nombre;
    private Pan pan;
    private Ingrediente[] vecIngredientes;
    private int dl;
    private int df;
    
    
    
    // CONSTRUCTOR //
     
    public Sandwich(String nombre, Pan pan, int N){
        this.setNombre(nombre);
        this.setPan(pan);
        this.setDf(N);
        this.setDl(0);
        this.vecIngredientes = new Ingrediente[this.getDf()];
    }
    
    
    
    // GETTERS Y SETTERS //

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pan getPan() {
        return pan;
    }

    public void setPan(Pan pan) {
        this.pan = pan;
    }
   
    public int getDl() {
        return dl;
    }

    public void setDl(int dl) {
        this.dl = dl;
    }

    public int getDf() {
        return df;
    }

    public void setDf(int df) {
        this.df = df;
    }
    
    
    
    // MÉTODOS //
    
    public void agregarIngrediente(Ingrediente ingrediente){ //Agregar un Ingrediente al Sandwich.
        int aux = this.getDl() + 1;
        this.vecIngredientes[this.getDl()] = ingrediente;
        this.setDl(aux);
    }

    public String toString(){ 
        String aux;
        double costoIng=0;
        
        aux = "Nombre Sandwich: " + this.getNombre() + "\n" +
                "Pan: " + this.getPan().toString() + "\n" +
                "Cant. Ingredientes: " + this.getDl();
        
        for (int i=0;i<this.getDl();i++){
            aux += this.vecIngredientes[i].toString();
            costoIng = costoIng + this.vecIngredientes[i].calcularCostoFinal();
        }
        
        aux +=  "\n" + "Costo de ingredientes: " + costoIng;
        
        
        return aux;
    }
}
