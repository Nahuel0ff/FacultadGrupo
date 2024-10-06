
package tema4;

public abstract class Estacion {
    private String nombre;
    private double latitud,longitud;
    
    public Estacion (String unNombre,double unaLong,double unaLati){
        this.setLatitud(unaLati);
        this.setLongitud(unaLong);
        this.setNombre(unNombre);
    }
    
    private void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    private void setLongitud(double unaLong){
        longitud = unaLong;
    }
    
    private void setLatitud(double unaLati){
        latitud = unaLati;
    }
        
    public String getNombre(){
        return nombre;
    }
    
    public double getLong(){
        return longitud;
    }
    
    public double getLati(){
        return latitud;
    }

    @Override
    public String toString(){
        String aux = "Nom"+ getNombre()+" latitud "+getLati()+" longitud "+getLong();
        return aux;
    }
    
}
