
package parcialcompras;


public class CompraMinorista extends Compra {
    private boolean esJubilado;
    
    public CompraMinorista(int df,boolean esJubilado) {
        super(df);
        this.setEsJubilado(esJubilado);
    }

    public boolean isEsJubilado() {
        return esJubilado;
    }

    private void setEsJubilado(boolean esJubilado) {
        this.esJubilado = esJubilado;
    }
    
    @Override
    public String toString(){
    String aux =super.toString();
    if (this.isEsJubilado()==true){
        aux+=" Si, es jubilado";
    }else{
        aux+=" No, no es jubilado";
    }
    return aux;
    }
    
    
    
}
