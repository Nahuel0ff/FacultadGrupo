
package parcialcompras;

public class CompraMayorista extends Compra {
    private int CUIT;
    
    public CompraMayorista(int df,int unCUIT) {
        super(df);
        this.setCUIT(unCUIT);
    }

    public int getCUIT() {
        return CUIT;
    }

    private void setCUIT(int CUIT) {
        this.CUIT = CUIT;
    }
    
    @Override
    public String toString(){
        String aux =super.toString();
        aux+=" CUIT: "+this.getCUIT();
        return aux;
    }
    
    
}
