
package parcialbanco;


public class BancoTrad extends Banco{
    private String direccion;
    private String localidad;
    private int cantCuentasDol;
    
    public BancoTrad(int df,String direccion, String localidad) {
        super(df);
        this.setDireccion(direccion);
        this.setLocalidad(localidad);
        this.setCantCuentasDol(0);
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public int getCantCuentasDol() {
        return cantCuentasDol;
    }

    public void setCantCuentasDol(int cantCuentasDol) {
        this.cantCuentasDol = cantCuentasDol;
    }
    
    @Override
    public boolean agregarCuenta(Cuenta unaCuenta){
       boolean aux= false;
       if (unaCuenta.getMoneda().equals("Dolares")){
           if (this.getCantCuentasDol()<100){
                aux=super.agregarCuenta(unaCuenta);
                this.setCantCuentasDol(this.getCantCuentasDol()+1);
           }
       }
       return aux;
    }

    @Override
    public boolean puedeRecibirTarjeta(int unCBU) {
        boolean aux = false;
        Cuenta aux2 = super.obtenerCuenta(unCBU);
        if (aux2.getMoneda().equals("Dolares") && aux2.getMonto() > 500.00 ){
            aux=true;
        }else if (aux2.getMoneda().equals("Pesos") && aux2.getMonto() > 70000.00){
            aux=true;
        }
        return aux;
    }
    
    
}
