
package parcialescuelademusica;


public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje =-1;
    
    
    public Alumno(String unNombre, int unaEdad, String unIns){
        this.setNombre(unNombre);
        this.setEdad(unaEdad);
        this.setInstrumento(unIns);
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }

    public String getInstrumento() {
        return instrumento;
    }

    private void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    

    @Override
    public String toString(){
        String aux="Nombre: "+this.getNombre()+" Edad: "+this.getEdad()+" Instrumento: "+this.getInstrumento()+" Puntaje obtenido: "+this.getPuntaje()+"\n";
        return aux;
    }
    
    
    
}
