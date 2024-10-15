/*
    ProgramadorLider tiene antiguedad en años y cantidad de proyectos dirigidos.
 */
package Parciales;

/**
 *
 * @author aldan
 */
public class ProgramadorLider extends Programador {
    
    // ATRIBUTOS //
    private int antiguedad;
    private int cantProyectos;
    
    
    
    // CONSTRUCTORES //
    
    public ProgramadorLider(String nombre, int dni, double sueldo, int cantLineas, String lenguaje, int antiguedad, int cantProyectos){
        super(nombre, dni, sueldo, cantLineas, lenguaje);
        this.setAntiguedad(antiguedad);
        this.setCantProyectos(cantProyectos);
    }
    
    
    
    // MÉTODOS //

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCantProyectos() {
        return cantProyectos;
    }

    public void setCantProyectos(int cantProyectos) {
        this.cantProyectos = cantProyectos;
    }
    
    // MÉTODOS //
    
    public double calcularSueldoFinal(){
        double sueldoFinal = super.calcularSueldoFinal();
        sueldoFinal += (this.getAntiguedad() * 10000) + (this.getCantProyectos() * 20000);
        
        return sueldoFinal;
    }
    
    public String toString(){
        return super.toString();
    }
    
}
