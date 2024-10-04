
package tema4;

public class Trabajador extends Persona {
    private String tarea;
            
    public Trabajador(int unDNI, String unNombre, int unaEdad,String unaTarea) {
        super(unDNI, unNombre, unaEdad);
        setTarea(unaTarea);
    }

    public String getTarea() {
        return tarea;
    }

    private void setTarea(String unaTarea) {
        this.tarea = unaTarea;
    }
    
    @Override
    public String toString(){
        String aux = super.toString()+". Soy "+getTarea()+".";
        return aux;
    }
    
    
    
}
