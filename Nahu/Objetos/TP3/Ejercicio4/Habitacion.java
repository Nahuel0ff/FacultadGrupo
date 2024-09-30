
package tema3;


public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion(double unCosto, boolean siOcupada, Cliente unCliente) {
    costo = unCosto;
    ocupada = siOcupada;
    cliente = unCliente;
}

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    
    
    
    
    
    
    
}
