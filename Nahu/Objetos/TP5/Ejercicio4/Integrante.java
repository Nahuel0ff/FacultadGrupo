package ejercicio4practica5;

public abstract class Integrante {
    private String nombre;
    private int DNI;
    private int edad;

    
    public Integrante (String nombre,int DNI,int edad){
        setNombre(nombre);
        setDNI(DNI);
        setEdad(edad);
    }

    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private int getDNI() {
        return DNI;
    }

    private void setDNI(int DNI) {
        this.DNI = DNI;
    }

    private int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }

    
}
