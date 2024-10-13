
package parcialestacionamiento;


public class Estacionamiento {
    private String direccion;
    private double costoxHora;
    private int sectores;
    private int posSectores = 0;
    private int vehicxSec;
    private int posVehicxSec = 0;
    private int DF;
    private int DL = 0;
    private Vehiculo[][] matrizEstac;
    
    
    public Estacionamiento(String unaDire,double unCostoxHora,int unSector,int cantVehicxSec){
        this.setDireccion(unaDire);
        this.setCostoxHora(unCostoxHora);
        this.setSectores(unSector);
        this.setVehicxSec(cantVehicxSec);
        this.setDF(unSector*cantVehicxSec);
        this.matrizEstac = new Vehiculo[unSector][cantVehicxSec];
        this.inicializarMatriz();
    }

    public String getDireccion() {
        return direccion;
    }

    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getCostoxHora() {
        return costoxHora;
    }

    private void setCostoxHora(double costoxHora) {
        this.costoxHora = costoxHora;
    }

    public int getSectores() {
        return sectores;
    }

    private void setSectores(int sectores) {
        this.sectores = sectores;
    }

    public int getVehicxSec() {
        return vehicxSec;
    }

    private void setVehicxSec(int vehicxSec) {
        this.vehicxSec = vehicxSec;
    }

    public int getPosSectores() {
        return posSectores;
    }

    private void setPosSectores(int posSectores) {
        this.posSectores = posSectores;
    }

    public int getPosVehicxSec() {
        return posVehicxSec;
    }

    private void setPosVehicxSec(int posVehicxSec) {
        this.posVehicxSec = posVehicxSec;
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
    
    public void inicializarMatriz(){
        for (int i=0; i<this.getSectores();i++){
            for (int j=0; j<this.getVehicxSec();j++){
                this.matrizEstac[i][j]=null;
            }
        }
    }
    
    
    public void registrarAuto(Vehiculo unAuto, int x, int y){
        if (this.getDL() < this.getDF()){
            this.matrizEstac[x-1][y-1]=unAuto;
            this.setDL(this.getDL()+1);
        }
    }
    
    public String liberarAutos(String unaMarca){
        String aux="";
        for (int i=0; i<this.getSectores();i++){
            for (int j=0; j<this.getVehicxSec();j++){
                if (this.matrizEstac[i][j] != null){
                    if(this.matrizEstac[i][j].getMarca().equals(unaMarca)){
                        aux+="Patente:"+this.matrizEstac[i][j].getPatente()+" marca: "+unaMarca+" Modelo: "+this.matrizEstac[i][j].getModelo()+" Horas estacionado"+this.matrizEstac[i][j].getCantHoras();
                        this.matrizEstac[i][j]=null;
                    }
                }
            }
        }
        return aux;
    }
    
    public double queMasRecaudo(){
        int max=0;
        double totalMax=0.0;
        double actual=0.0;
        for (int i=0; i<this.getSectores();i++){
            for(int j=0;j<this.getVehicxSec();j++){
                if(this.matrizEstac[i][j] != null){
                    actual+= this.matrizEstac[i][j].getCantHoras()*this.costoxHora;
                }
            }
            if (actual > totalMax){
                totalMax=actual;
                max = i;
            }
            actual=0.0;
        }
        return max;
    }
    
    @Override
    public String toString(){
        String aux="Estacionamiento: "+this.getDireccion()+"Costo: "+this.getCostoxHora()+"\n";
        for(int i=0;i<this.getSectores();i++){
            aux+="Sector "+(i+1)+"\n";
            for (int j=0;j<this.getVehicxSec();j++){
                if(this.matrizEstac[i][j] != null){
                    aux+="Lugar "+(j+1)+" : "+this.matrizEstac[i][j].getPatente()+", "+this.matrizEstac[i][j].getMarca()+", "+this.matrizEstac[i][j].getModelo()+", "+this.matrizEstac[i][j].getCantHoras()+"\n";
                }
            }
        }
        return aux;
    }
    
}
