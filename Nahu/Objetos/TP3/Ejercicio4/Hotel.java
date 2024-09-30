
package tema3;


public class Hotel {
    private Habitacion[] vectorHotel;
    private int dimF;
    private int dimL;
    
    
    public Hotel (int capacidad){
        this.dimF = capacidad;
        this.dimL = 0;
        this.vectorHotel = new Habitacion [dimF];
    }
    
    public int getCantHabitacionesOcupadas(){
        return dimL;
    }
    
    public int getCantHabitacionesTotal(){
        return dimF;
    }
    
    public String getEstaLleno(){
        if (dimL == dimF){
            return "Esta lleno";
        }else{
            return "Hay habitaciones libres";
        }
    }
    
        public void agregarHabitacion (Habitacion habAdd) {
        if (dimL < dimF) {
            vectorHotel[dimL] = habAdd;
            dimL++;
        } else {
            System.out.println("El hotel está lleno. No se puede agregar más habitaciones.");
        }
    }
    
    
    
    
    
    
    
}
