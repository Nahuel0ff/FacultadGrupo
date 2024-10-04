package tema3;

public class Autor {
  private String nombre;
  private String biografia;
  private String origen;
  
  public Autor (String unNombre, String unaBio, String unOrigen) {
    nombre = unNombre;
    biografia = unaBio;
    origen = unOrigen;
}
    
    public String getNombre(){
        return nombre;
    }
    
    public String getBio(){
        return biografia;
    }
    
    public String getOrigen(){
        return origen;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setBio(String unaBio){
        biografia = unaBio;
    }
    
    
    public void setOrigen (String unOrigen){
        origen = unOrigen;
    }

    @Override
    public String toString() {
        return "Autor{" + "nombre=" + nombre + ", biografia=" + biografia + ", origen=" + origen + '}';
    }
    
    
    
}
