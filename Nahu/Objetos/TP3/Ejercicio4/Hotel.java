
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
    
    public void agregarCliente(int unaHabitacion, Cliente cliente){
        vectorHotel[unaHabitacion].setCliente(cliente);
        vectorHotel[unaHabitacion].setOcupada(true);
    }
        
        
     public void ingresarClienteEnHabitacion(int numHabitacion, Cliente cliente) {
        if (numHabitacion >= 1 && numHabitacion <= dimF && !vectorHotel[numHabitacion - 1].isOcupada()) {
            vectorHotel[numHabitacion - 1].setCliente(cliente);
            vectorHotel[numHabitacion - 1].setOcupada(true);
            System.out.println("Cliente ingresado en la habitación " + numHabitacion);
        } else {
            System.out.println("La habitación " + numHabitacion + " ya está ocupada o no es válida.");
        }
    }    
        
        
        
        
    public void aumentarPrecio(double incremento) {
        for (int i = 0; i < dimL; i++) {
            vectorHotel[i].setCosto(vectorHotel[i].getCosto() + incremento);
        }
    }
    
   
     @Override
    public String toString() {
        String aux= "";
        for(int i = 0; i<dimF; i++){
            aux = aux + ("{Habitacion "+i+":"+vectorHotel[i].getCosto()+" ocupada "+vectorHotel[i].isOcupada());
            if(vectorHotel[i].isOcupada())
                aux = aux+ " -Los datos del cliente en esta habitacion: "+ vectorHotel[i].getCliente().toString();
            else
                aux = aux+ " habitacion desocupada";
            aux = aux+ "\n";
        }
        return aux;
    }

    
    
}
