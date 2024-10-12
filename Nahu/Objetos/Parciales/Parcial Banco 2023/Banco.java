
package parcialbanco;


public abstract class Banco {
    private String nombre;
    private int cantEmp;
    private Cuenta[] vecCuentas;
    private int DF;
    private int DL=0;
    private int ultimaPos;
    
    public Banco(int df){
        this.setDF(df);
        this.vecCuentas = new Cuenta[df];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEmp() {
        return cantEmp;
    }

    public void setCantEmp(int cantEmp) {
        this.cantEmp = cantEmp;
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
    
    private int getUltPos(){
        return ultimaPos;
    }
    
    private void setUltPos(int ultPos){
        this.ultimaPos = ultPos;
    }
    
    public boolean agregarCuenta(Cuenta unaCuenta){
        boolean aux = false;
        if (this.getDL()<this.getDF()){
            this.vecCuentas[this.getDL()]=unaCuenta;
            this.setDL(this.getDL()+1);
            aux=true;
        }
        return aux;
    }
    
    public Cuenta obtenerCuenta(int unCBU){
        Cuenta aux=null;
        boolean encontre = false;
        int i=0;
        while (i<this.getDL()&& !encontre){
            if (this.vecCuentas[i].getCBU() == unCBU){
                aux= this.vecCuentas[i];
                this.setUltPos(i);
                encontre = true;
            }
        i++;
        }
        return aux;
    }
    
    
    public void depositarDinero(int unCBU,double monto){
        Cuenta aux = this.obtenerCuenta(unCBU);
        if (aux != null){
        this.vecCuentas[this.getUltPos()].setMonto(this.vecCuentas[this.getUltPos()].getMonto()+monto);
        }
    }
    
    public abstract boolean puedeRecibirTarjeta(int unCBU);
    
    
    
    
    
    
}
