
package ejercicio2practica5;

public class Auto {
    private String dueño;
    private String patente;
    
    public Auto(String unDueño,String unaPatente){
        setDueño(unDueño);
        setPatente(unaPatente);
    }

    public String getDueño() {
        return dueño;
    }

    private void setDueño(String unDueño) {
        this.dueño = unDueño;
    }

    public String getPatente() {
        return patente;
    }

    private void setPatente(String unaPatente) {
        this.patente = unaPatente;
    }
    
    
    
}
