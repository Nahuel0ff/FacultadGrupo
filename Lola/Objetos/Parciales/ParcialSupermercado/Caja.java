/*

 */
package Parciales;

public class Caja {
    
    // ATRIBUTOS //
    private String nombreCajero;
    private Ticket[] vecTickets;
    private int df;
    private int dl;
    
    // CONSTRUCTORES //
    
    public Caja(String nombreCajero, int T){
        this.setNombreCajero(nombreCajero);
        this.setDf(T);
        Ticket[] vecTickets = new Ticket[this.getDf()];
    }
    
    
    // GETTERS Y SETTERS //
    
    public String getNombreCajero() {
        return nombreCajero;
    }

    public void setNombreCajero(String nombreCajero) {
        this.nombreCajero = nombreCajero;
    }

    public int getDf() {
        return df;
    }

    public void setDf(int df) {
        this.df = df;
    }

    public int getDl() {
        return dl;
    }

    public void setDl(int dl) {
        this.dl = dl;
    }
    
     // MÉTODOS //
    
    public void agregarTicket(Ticket ticket){
        int aux = this.getDl()+1;
        this.vecTickets[this.getDl()] = ticket;
        this.setDl(aux);
    }
    
    public int cantidadCredito(){
        int aux=0;
        for (int i=0; i<this.getDl();i++){
            if (this.vecTickets[i].getMetodoPago().equals("credito")){
                aux++;
            }
        }
        return aux;
    }
}
