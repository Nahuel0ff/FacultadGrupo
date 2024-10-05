package tema4;

public class Entrenador extends Empleado {
    private int campeonatosGan;
    
    public Entrenador(String unNombre, double unSueldo, int unAño,int cantCamp) {
        super(unNombre, unSueldo, unAño);
        setCampeonatos(cantCamp);
    }
    
    private void setCampeonatos(int cantCamp){
        campeonatosGan = cantCamp;
    }
    
    public int getCampeonatos(){
        return campeonatosGan;
    }

    @Override
    public double calcularEfectividad() {
        return (double) getCampeonatos() / getAntiguedad();
    }


    @Override
    public double extra() {
        int campeonatos = this.getCampeonatos();
        if (campeonatos >= 1 && campeonatos <= 4){
            return 5000.00; 
        }else if (campeonatos >= 5 && campeonatos <= 10){
            return 30000.00;
        }else if (campeonatos > 10){
            return 50000.00;
        }
        return 0;
    }
        
    
}
