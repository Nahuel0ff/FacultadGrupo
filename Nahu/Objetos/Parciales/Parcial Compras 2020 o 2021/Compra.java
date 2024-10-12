
package parcialcompras;

public abstract class Compra {
    private int nro;
    private int DL=0;
    private Producto[] vecProd;
    
    
    public Compra(int df){
        this.setNro(df);
        this.vecProd = new Producto[df];
    }

    public int getNro() {
        return nro;
    }

    private void setNro(int nro) {
        this.nro = nro;
    }

    public int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }
    
    public void agregarCompra(Producto unProducto){
        if (this.getDL()<this.getNro()){
            this.vecProd[this.getDL()]=unProducto;
            this.setDL(this.getDL()+1);
        }
    }
    
    public double obtenerPrecio(){
        double aux = 0.0;
        for (int i=0; i<this.getDL();i++){
            aux+= this.vecProd[i].getPrecio();
        }
        return aux*1.21;
    }
    
    @Override
    public String toString(){
        String aux="Nro: "+this.getNro()+" , Productos: ";
        for(int i =0;i<this.getDL();i++){    
            aux+="Codigo: "+this.vecProd[i].getCod()+"Precio: "+this.vecProd[i].getPrecio()+"Desc: "+this.vecProd[i].getDesc()+" ";
        }
        aux+=", Precio a pagar:  "+this.obtenerPrecio();
        return aux;
    }
    
    
}
