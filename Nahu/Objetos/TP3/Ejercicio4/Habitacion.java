package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costo;
    private boolean ocupada = false;
    private Cliente cliente;

    public Habitacion() {
        costo = GeneradorAleatorio.generarDouble(4000) +  2000;
        ocupada = false;
        cliente = null;
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

    public String getEstadoHab() {
        return ocupada ? "Ocupada" : "Disponible"; // Uso de operador ternario
    }

    public String getDatosCliente() {
        if (ocupada) {
            return "Cliente: " + cliente.getNombre() + ", DNI: " + cliente.getDNI() + ", Edad: " + cliente.getEdad();
        } else {
            return "Ningún cliente está alojado en esta habitación.";
        }
    }

    @Override
    public String toString() {
        return "Costo: " + costo + ", Estado: " + getEstadoHab() + ", " + getDatosCliente();
    }
}
