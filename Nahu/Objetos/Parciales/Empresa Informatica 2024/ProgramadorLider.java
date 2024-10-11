
package parcialempresainformatica;


public class ProgramadorLider extends Programador{
    private int antiguedad;
    private int cantDirigidos;
    
    public ProgramadorLider(String unNombre, int unDni, double unSueldo, int unaLineasxHora, String unLenguaje, int unaAntiguedad, int unaCant) {
        super(unNombre, unDni, unSueldo, unaLineasxHora, unLenguaje);
        this.setAntiguedad(unaAntiguedad);
        this.setCantDirigidos(unaCant);
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCantDirigidos() {
        return cantDirigidos;
    }

    private void setCantDirigidos(int cantDirigidos) {
        this.cantDirigidos = cantDirigidos;
    }
    
    @Override
    public double calcularSueldo(){
        double aux= super.calcularSueldo();
        aux+= this.getAntiguedad()*10000.00 + this.getCantDirigidos()*20000.00;
        return aux;
    }
    
    public String toString(){
        String aux="Programador Lider: "+super.toString();
        return aux;
    }
    
    
    
    
    
}
