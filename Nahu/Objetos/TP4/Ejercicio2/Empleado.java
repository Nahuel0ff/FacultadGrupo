package tema4;

public class Jugador extends Empleado{
    private  int partJug;
    private int golesAnot;

    public Jugador(String unNombre, double unSueldo, int unAño,int cantGoles,int cantPart) {
        super(unNombre, unSueldo, unAño);
        setPartidosJugados(cantPart);
        setGolesAnotados(cantGoles);
    }
    
    private void setPartidosJugados(int cantPart){
        partJug = cantPart;
    }
    
    private void setGolesAnotados (int cantGoles){
        golesAnot = cantGoles;
    }

    public int getPartidosJugados(){
        return partJug;
    }
    
    public int getGolesAnotados(){
        return golesAnot;
    }

    @Override
    public double calcularEfectividad() {
        return (double) getGolesAnotados() / getPartidosJugados();
    }


    @Override
    public double extra() {
        if (this.calcularEfectividad() > 0.5){
            return getSueldo();
        }
        return 0;
    }
    
    
    
}
