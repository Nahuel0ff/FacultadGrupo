
package parcialsupermercado;

public class Supermercado {
    private String direccion;
    private int nroVentaAct;
    private Cajas[] vecCajas;
    private int DF=5;
    private int DL=0;
    
    public Supermercado(String direccion){
        this.setDireccion(direccion);
        this.vecCajas = new Cajas[this.getDF()];
        this.setNroVentaAct(0);
    }

    private String getDireccion() {
        return direccion;
    }

    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    private int getNroVentaAct() {
        return nroVentaAct;
    }

    private void setNroVentaAct(int nroVentaAct) {
        this.nroVentaAct = nroVentaAct;
    }

    private int getDF() {
        return DF;
    }

    private void setDF(int df) {
        this.DF = df;
    }

    private int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }
    
    public void agregarCaja(Cajas unaCaja){
        if (this.getDL()<this.getDF()){
            this.vecCajas[this.getDL()]=unaCaja;
            this.setDL(this.getDL()+1);
        }
    }
    
    public void cargarTicket(int numCaja,int CUIT, int cantComprados, double montoAbonado, String medioDePago){
        this.setNroVentaAct(this.getNroVentaAct()+1);
        Tickets unTicket = new Tickets (this.getNroVentaAct(),CUIT,cantComprados,montoAbonado,medioDePago);
        this.vecCajas[numCaja-1].agregarTicket(unTicket);
    }
    
    public int menorCantTicketCred(){
        int cajaMin=0;
        int cantMin=9999;
        for (int i=0;i<this.getDL();i++){
            if(this.vecCajas[i].contadorCred()< cantMin){
                cantMin=this.vecCajas[i].contadorCred();
                cajaMin=i+1;
            }
        }
        return cajaMin;
    }
    
    public String toString(){
        String aux="Supermercado: "+this.getDireccion()+" Cantidad de cajas: "+this.getDL()+"\n";
        for (int i=0;i<this.getDL();i++){
            aux+="Caja: "+(i+1)+" "+vecCajas[i].getNomCajero()+" Tickets emitidos: "+vecCajas[i].toString()+"\n";
        }
        return aux;
    }
    
    
    
    
}
