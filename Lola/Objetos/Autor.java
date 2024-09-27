/*
 
 */
package Practica3;

public class Autor {
    
    // ATRIBUTOS // 
    
    private String nombre;
    private String biografia;
    private String origen;
    
    
    // CONSTRUCTORES //
    
    public Autor(String nombre, String biografia, String origen){
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    
    
    // MÉTODOS GETTERS //

    public String getNombre() {
        return nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public String getOrigen() {
        return origen;
    }
    
    
    // MÉTODOS SETTERS // 

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    @Override
    public String toString(){
        String texto;
        texto = "Nombre: "+nombre+". Biografía: "+biografia+". Origen: "+origen;
        return texto;
    }
}
