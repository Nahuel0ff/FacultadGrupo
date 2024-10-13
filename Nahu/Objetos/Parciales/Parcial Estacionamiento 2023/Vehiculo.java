
package parcialestacionamiento;


public class Vehiculo {
    private String patente;
    private int cantHoras;
    private String modelo;
    private String marca;
    
    public Vehiculo(String unaPatente, int unaCantHoras, String unaMarca, String unModelo){
        this.setPatente(unaPatente);;
        this.setCantHoras(unaCantHoras);
        this.setMarca(unaMarca);
        this.setModelo(unModelo);
    }

    public String getPatente() {
        return patente;
    }

    private void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCantHoras() {
        return cantHoras;
    }

    private void setCantHoras(int cantHoras) {
        this.cantHoras = cantHoras;
    }

    public String getModelo() {
        return modelo;
    }

    private void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    private void setMarca(String marca) {
        this.marca = marca;
    }
    
    
}
