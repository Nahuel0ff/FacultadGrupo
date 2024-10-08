package ejercicio4practica5;

public class Coro {
    private String nombre;
    private Director direc;

    
    public Coro(String nombre,Director direc){
        this.setNombre(nombre);
        this.setDirec(direc);
    }

   
    
    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private Director getDirec() {
        return direc;
    }

    private void setDirec(Director direc) {
        this.direc = direc;
    }


    
    
    
    
    
    
    
    
}
