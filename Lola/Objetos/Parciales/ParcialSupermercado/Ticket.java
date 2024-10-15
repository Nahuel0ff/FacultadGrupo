/*
 */
package Parciales;


public class Ticket {
    
    // ATRIBUTOS //
    private int numTicket;
    private int cuilCliente;
    private int cantVendidos;
    private double monto;
    private String metodoPago;
    
    // CONSTRUCTORES //
    
    public Ticket(int numTicket, int cuilCliente, int cantVendidos, double monto, String metodoPago){
        this.setNumTicket(numTicket);
        this.setCuilCliente(cuilCliente);
        this.setCantVendidos(cantVendidos);
        this.setMonto(monto);
        this.setMetodoPago(metodoPago);
    }
    
    // GETTERS Y SETTERS //

    public int getNumTicket() {
        return numTicket;
    }

    public void setNumTicket(int numTicket) {
        this.numTicket = numTicket;
    }

    public int getCuilCliente() {
        return cuilCliente;
    }

    public void setCuilCliente(int cuilCliente) {
        this.cuilCliente = cuilCliente;
    }

    public int getCantVendidos() {
        return cantVendidos;
    }

    public void setCantVendidos(int cantVendidos) {
        this.cantVendidos = cantVendidos;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }
    
     
    // MÉTODOS //
}
