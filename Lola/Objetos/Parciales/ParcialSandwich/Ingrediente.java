/*

 */
package Parciales;


public class Ingrediente extends Componente {
    
    private char grupo; //A o B

    
    
    // CONSTRUCTOR //
    
    public Ingrediente (String nombre, double costo, char grupo){
        super(nombre, costo);
        this.setGrupo(grupo);
    }
    
    
    
    // GETTERS Y SETTERS //
    
    public char getGrupo() {
        return grupo;
    }

    public void setGrupo(char grupo) {
        this.grupo = grupo;
    }
    
    
    
    // MÉTODOS //
    
    public double calcularCostoFinal(){
        double costo = this.getCosto();
        
        if (this.getGrupo() == 'B')
            costo = costo + (costo * 0.10);
        
        return costo;
    }
    
    public String toString(){
        String aux;
        aux = super.toString() + " -Grupo: " + this.getGrupo();
        return aux;
    }
}
