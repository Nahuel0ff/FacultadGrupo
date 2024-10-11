
package parcialempresainformatica;


public class Empresa {
   private String nombre;
   private ProgramadorLider progLid;
   private Programador[] vecProg;
   private int DF;
   private int DL = 0;

   public Empresa(String unNombre, ProgramadorLider unLider, int df){
       this.setNombre(unNombre);
       this.setProgLid(unLider);
       this.setDF(df);
       this.vecProg = new Programador[df];
   }
   
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public ProgramadorLider getProgLid() {
        return progLid;
    }

    private void setProgLid(ProgramadorLider progLid) {
        this.progLid = progLid;
    }

    public int getDF() {
        return DF;
    }

    private void setDF(int DF) {
        this.DF = DF;
    }

    public int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }
   
   
   public void agregarProgramador(Programador unProg){
       if (this.getDL() < this.getDF()){
           this.vecProg[this.getDL()]=unProg;
           this.setDL(this.getDL()+1);
       }
   }
   
   
   public double sueldoTotal(){
       double aux =0;
       for (int i=0; i<this.getDL();i++){
           aux+=this.vecProg[i].calcularSueldo();
       }
       aux += this.getProgLid().calcularSueldo();
       return aux;
   }
   
   public void aumentarSueldo(double monto){
       for (int i=0; i<this.getDL();i++){
           this.vecProg[i].setSueldoBasi(this.vecProg[i].getSueldoBasi()+monto);
       }
       this.getProgLid().setSueldoBasi(this.getProgLid().getSueldoBasi()+monto);
   }
   
   
   @Override
   public String toString(){
       String aux="Empresa "+this.getNombre()+"\n";
       aux+=this.getProgLid().toString()+"\n";
       for (int i=0; i<this.getDL();i++){
           aux+="Programador "+(i+1)+": "+this.vecProg[i].toString()+"\n";
       }
       aux+="Monto total en sueldos a abonar por la empresa: "+this.sueldoTotal();
       return aux;
   }
   
   
}
