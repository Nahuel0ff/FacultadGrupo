package tema3;


public class Cliente {
    private String nombre;
    private int DNI;
    private int edad;
    
    
    public Cliente (String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;        
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public int getDNI(){
        return DNI;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setDNI(int unDNI){
        DNI = unDNI;
    }
    
    public void setEdad(int unaEdad){
        edad = unaEdad;
    }
    
    
}
