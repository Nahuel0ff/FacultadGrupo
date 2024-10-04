package tema4;


public class Persona {
    private int DNI;
    private String nombre;
    private int edad;
    
    public Persona (int unDNI, String unNombre,int unaEdad ){
        setDNI(unDNI);
        setNombre(unNombre);
        setEdad(unaEdad);
    }
    
    private void setDNI(int unDNI){
        DNI = unDNI;
    }
    
    private void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    private void setEdad (int unaEdad){
        edad = unaEdad;
    }
    
    public int getDNI(){
        return DNI;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    @Override
    public String toString(){
        String aux = "Mi nombre es "+getNombre()+" mi dni es "+getDNI()+ " y tengo "+getEdad();
        return aux;
    }
}
