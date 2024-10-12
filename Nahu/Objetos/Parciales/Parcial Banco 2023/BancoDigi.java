
package parcialbanco;


public class BancoDigi extends Banco {
    private String sitioWeb;
    
    public BancoDigi(int df,String sitioWeb) {
        super(df);
        this.setSitioWeb(sitioWeb);
    }

    public String getSitioWeb() {
        return sitioWeb;
    }

    private void setSitioWeb(String sitioWeb) {
        this.sitioWeb = sitioWeb;
    }

    @Override
    public boolean puedeRecibirTarjeta(int unCBU) {
        boolean aux = false;
        Cuenta aux2 = super.obtenerCuenta(unCBU);
        if (aux2.getMoneda().equals("Pesos") && aux2.getMonto()>100000.00){
            aux=true;
        }
        return aux;
    }
    
    
    
    
    
    
    
    
}
