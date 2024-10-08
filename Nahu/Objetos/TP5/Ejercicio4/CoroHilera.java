package ejercicio4practica5;


public class CoroHilera extends Coro {
    private Corista[][] matriz;
    private int fila;
    private int col;
    private int DF;
    
    
    public CoroHilera(String nombre, Director direc,int fila,int col) {
        super(nombre, direc);
        this.setCol(col);
        this.setFila(fila);
        this.setDF(col*fila);
        Corista matriz [][] = new Corista [fila][col];
    }

    private int getFila() {
        return fila;
    }

    private void setFila(int fila) {
        this.fila = fila;
    }

    private int getCol() {
        return col;
    }

    private void setCol(int col) {
        this.col = col;
    }

    private int getDF() {
        return DF;
    }

    private void setDF(int DF) {
        this.DF = DF;
    }
    
    
    
    
    
}
