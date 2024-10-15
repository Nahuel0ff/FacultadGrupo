/*

 */
package Parciales;

public class Supermercado {
    
    // ATRIBUTOS //
    private String direccion;
    private int numVenta;
    private Caja[] vecCajas;
    private int df;
    private int dl;
    
    // CONSTRUCTORES //
    
    public Supermercado(String direccion){
        this.setDf(5);
        this.setDl(0);
        this.setDireccion(direccion);
        Caja [] vecCajas = new Caja[this.getDf()];
        this.setNumVenta(0);
    }
    
    // GETTERS Y SETTERS //

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getNumVenta() {
        return numVenta;
    }

    public void setNumVenta(int numVenta) {
        this.numVenta = numVenta;
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
    
    public void agregarCaja(Caja caja){
        int aux = this.getDl()+1;
        this.vecCajas[this.getDl()] = caja;
        this.setDl(aux);
    }
    
    public int buscarCaja(){
        int cajaMin=0; // numero de caja con menor cant. tickets con metodo de pago "credito"
        int min = 9999; // auxiliar para comparar los min.
        
        for (int i=0; i<this.getDl();i++){
            if (this.vecCajas[i].cantidadCredito() < min){
                cajaMin = i+1; //porque cuando devuelva el numero de caja el usuario ve el numero "real"
                min = this.vecCajas[i].cantidadCredito();
            }
        }
        return cajaMin;
    }
}
