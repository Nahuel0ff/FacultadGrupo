
package parcialempresainformatica;


public class Programador {
    private String nombre;
    private int DNI;
    private double sueldoBasi;
    private int lineasxHora;
    private String Lenguaje;

    public Programador(String unNombre, int unDni, double unSueldo, int unaLineasxHora, String unLenguaje){
        this.setNombre(unNombre);
        this.setDNI(unDni);
        this.setSueldoBasi(unSueldo);
        this.setLineasxHora(unaLineasxHora);
        this.setLenguaje(unLenguaje);
    }
    
    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    private void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public double getSueldoBasi() {
        return sueldoBasi;
    }

    public void setSueldoBasi(double sueldoBasi) {
        this.sueldoBasi = sueldoBasi;
    }

    public int getLineasxHora() {
        return lineasxHora;
    }

    private void setLineasxHora(int lineasxHora) {
        this.lineasxHora = lineasxHora;
    }

    public String getLenguaje() {
        return Lenguaje;
    }

    private void setLenguaje(String Lenguaje) {
        this.Lenguaje = Lenguaje;
    }
    
    
    public double calcularSueldo(){
        double aux=this.getSueldoBasi();
        if (this.lineasxHora>200){
            aux+=50000.00;
        }
        return aux;
    }
    
    public String toString(){
        String aux=this.getNombre()+","+this.getDNI()+","+this.getLenguaje()+","+this.calcularSueldo();
        return aux;
    }
    
    
}
