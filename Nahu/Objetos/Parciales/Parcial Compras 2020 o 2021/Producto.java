
package parcialcompras;


public class Producto {
    private int cod;
    private double precio;
    private String desc;
    
    public Producto(int unCod, double unPrecio, String unaDesc){
        this.setCod(unCod);
        this.setPrecio(unPrecio);
        this.setDesc(unaDesc);
    }

    public int getCod() {
        return cod;
    }

    private void setCod(int cod) {
        this.cod = cod;
    }

    public double getPrecio() {
        return precio;
    }

    private void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDesc() {
        return desc;
    }

    private void setDesc(String desc) {
        this.desc = desc;
    }
    
    
    
    
}
