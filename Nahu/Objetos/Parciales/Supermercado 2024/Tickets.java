
package parcialsupermercado;


public class Tickets {
    private int numTicket;
    private int CIUT;
    private int cantComprados;
    private double montoAbonado;
    private String medioDePago;
    
    
    public Tickets(int numTicket,int CIUT,int cantComprados,double montoAbonado,String medioDePago){
        this.setNumTicket(numTicket);
        this.setCIUT(CIUT);
        this.setCantComprados(cantComprados);
        this.setMontoAbonado(montoAbonado);
        this.setMedioDePago(medioDePago);
    }
    

    public int getNumTicket() {
        return numTicket;
    }

    private void setNumTicket(int numTicket) {
        this.numTicket = numTicket;
    }

    public int getCIUT() {
        return CIUT;
    }

    private void setCIUT(int CIUT) {
        this.CIUT = CIUT;
    }

    public int getCantComprados() {
        return cantComprados;
    }

    private void setCantComprados(int cantComprados) {
        this.cantComprados = cantComprados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }

    private void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public String getMedioDePago() {
        return medioDePago;
    }

    private void setMedioDePago(String medioDePago) {
        this.medioDePago = medioDePago;
    }
    
    
    
    
    
}
