
package ejercicio1practica5;


public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDir;
    private int DF = 50;
    private int DL = 0;
    private Investigadores [] vector= new Investigadores [DF];
    
    
    public Proyecto(String unNom,int unCod,String unDir){
        setNombre(unNom);
        setCodigo(unCod);
        setDirector(unDir);
    }
    
    private void setNombre(String unNom){
        nombre = unNom;
    }
    
    private void setCodigo(int unCod){
        codigo = unCod;
    }
    
    private void setDirector(String unDir){
        nombreDir = unDir;
    }

    private String getNombre() {
        return nombre;
    }

    private int getCodigo() {
        return codigo;
    }

    private String getNombreDir() {
        return nombreDir;
    }
    
    public void agregarInvestigador(Investigadores unInvestigador){
        if (DL < DF){
            vector[DL]= unInvestigador;
            DL++;
        }else{
            System.out.println("No se pueden ingresar mas Investigadores");
        }
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i=0; i<DL; i++){
            total += vector[i].dineroTotalOtorgadoInv();
        }
        return total;
    }
    
    
    
}
