/*
    Empresa tiene nombre, un programador lider y N programadores en su empresa.
 */
package Parciales;


public class Empresa {
    
    // ATRIBUTOS //
    
    private String nombre;
    private Programador pLider;
    private Programador[] vecProgramadores;
    private int df;
    private int dl;
    
    
    
    // CONSTRUCTORES //
    
    public Empresa(String nombre, Programador pLider, int df){
        this.setNombre(nombre);
        this.setProgramadorLider(pLider);
        this.setDf(df);
        this.setDl(0);
        
        vecProgramadores = new Programador[this.getDf()];
    }
    
    
    
    // GETTERS Y SETTERS //

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setProgramadorLider(Programador pLider){
        this.pLider = pLider;
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
    
    public Programador getPLider(){
        return this.pLider;
    }
    
    
    
    // MÉTODOS //
    
    public void agregarProgramador(Programador p1, int dl){
        int aux = this.getDl()+1;
        this.vecProgramadores[dl] = p1;
        this.setDl(aux);
    }
    
    public double calcularSueldos(){
        double sueldo = 0;
        for (int i=0;i<this.getDl();i++){
            sueldo = sueldo + this.vecProgramadores[i].calcularSueldoFinal();
        }
        return sueldo;
    }
    
    public void aumentarSueldos(double monto){
        for (int i=0;i<this.getDl();i++){
            this.vecProgramadores[i].setSueldo(this.vecProgramadores[i].getSueldo() + monto);
        }
    }
    
    public String toString(){
        /*
        "Empresa: nombre. Programador lider: (nombre, DNI, lenguaje de preferencia, sueldo final)
        Programador 1: (nombre, DNI, lenguaje de preferencia, sueldo final
        Programador 2: (nombre, DNI, lenguaje de preferencia, sueldo final)
        Monto total en sueldos a abonar por la empresa: ..."
        */
        String aux = "";
        
        aux = "Empresa: " + this.getNombre() + "\n";
        
        aux += "Programador lider: " + this.getPLider().toString()  + "\n";
                
                
                
        for (int i=0; i<this.getDl();i++){
            aux += "Programador "+(i+1)+": "+this.vecProgramadores[i].toString() + "\n";
        }
        
        aux+="Monto total en sueldos a abonar por la empresa: " + this.calcularSueldos();
             
        
        return aux;
    }
    
}
