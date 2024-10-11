
package parcialsupermercado;


public class Cajas {
    private String nomCajero;
    private Tickets[] vecTickets;
    private int DF;
    private int DL = 0;
    
    public Cajas(String nomCajero,int df){
        this.setNomCajero(nomCajero);
        this.setDF(df);
        this.vecTickets = new Tickets[df];
    }    

    public String getNomCajero() {
        return nomCajero;
    }

    private void setNomCajero(String nomCajero) {
        this.nomCajero = nomCajero;
    }

    public int getDF() {
        return DF;
    }

    private void setDF(int DF) {
        this.DF = DF;
    }

    public int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }
    
    public void agregarTicket(Tickets unTicket){
        if (this.getDL() < this.getDF()){
            this.vecTickets[this.getDL()] = unTicket;
            this.setDL(this.getDL()+1);
        }
    }
    
    public int contadorCred(){
        int aux=0;
        for (int i=0;i<this.getDL();i++){
            if (this.vecTickets[i].getMedioDePago().equals("Credito")){
                aux++;
            }
        }
        return aux;
    }
        
    public String toString(){
        String aux="";
        for (int i=0;i<this.getDL();i++){
            aux+=this.vecTickets[i].getNumTicket()+" "+this.vecTickets[i].getCIUT()+" "+this.vecTickets[i].getCantComprados()+" "+this.vecTickets[i].getMontoAbonado()+" "+this.vecTickets[i].getMedioDePago()+" ";
        }
        return aux;
    }
}
