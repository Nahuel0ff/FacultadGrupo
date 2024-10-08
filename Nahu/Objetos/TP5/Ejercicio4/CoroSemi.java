package ejercicio4practica5;

public class CoroSemi extends Coro{
    private Corista[] vector;
    private int DF;
    private int DL = 0;
    
    
    public CoroSemi(String nombre, Director direc,int df) {
        super(nombre, direc);
        this.setDF(df);
        Corista vector [] = new Corista[df];
    }

    private int getDF() {
        return DF;
    }

    private void setDF(int df) {
        this.DF = df;
    }

    private int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }
    
    
    
    
    
    
}
