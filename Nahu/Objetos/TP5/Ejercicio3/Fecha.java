
package ejercicio3practica5;


public class Fecha {
    private String ciudad;
    private int dia;
    
    public Fecha(String ciudad,int dia){
        setCiudad(ciudad);
        setDia(dia);
    }

    public String getCiudad() {
        return ciudad;
    }

    private void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    private void setDia(int dia) {
        this.dia = dia;
    }
    
    
}
