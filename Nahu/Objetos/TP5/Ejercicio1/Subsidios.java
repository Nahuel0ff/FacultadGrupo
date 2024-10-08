
package ejercicio1practica5;

public class Subsidios {
    private double montoPedido;
    private String motivo;
    private boolean otorgado;
    
    public Subsidios(double unMonto,String unMotiv){
        setMonto(unMonto);
        setMotivo(unMotiv);
        setOtorgado(false);
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    private String getMotivo() {
        return motivo;
    }

    public boolean getOtorgado() {
        return otorgado;
    }
    
    private void setMonto(double unMonto){
        montoPedido=unMonto;
    }
    
    private void setMotivo(String unMotiv){
        motivo= unMotiv;
    }
    
    public void setOtorgado(Boolean esOtorgado){ //Es correcto ?
        otorgado=esOtorgado;
    }
    
    
    
}
