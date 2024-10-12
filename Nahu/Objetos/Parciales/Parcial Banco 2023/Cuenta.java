
package parcialbanco;


public class Cuenta {
    private int CBU;
    private String alias;
    private int tituDni;
    private String moneda;
    private double monto;
    
    public Cuenta(int unCBU, String unAlias, int tituDni, String moneda, double monto){
        this.setCBU(unCBU);
        this.setAlias(unAlias);
        this.setTituDni(tituDni);
        this.setMoneda(moneda);
        this.setMonto(monto);
    }

    public int getCBU() {
        return CBU;
    }

    public void setCBU(int CBU) {
        this.CBU = CBU;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getTituDni() {
        return tituDni;
    }

    public void setTituDni(int tituDni) {
        this.tituDni = tituDni;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    
    
    
}
