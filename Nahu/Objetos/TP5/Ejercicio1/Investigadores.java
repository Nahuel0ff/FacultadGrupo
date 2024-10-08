
package ejercicio1practica5;

public class Investigadores {
    private String nombreComp;
    private int categoria;
    private String especialidad;
    private int DF = 5;
    private int DL = 0;
    private Subsidios [] sub = new Subsidios[DF];

    
    public Investigadores(String unNom,int unaCat,String unaEsp){
        setNombreComp(unNom);
        setCategoria(unaCat);
        setEspecialidad(unaEsp);
    }
    
    private void setNombreComp(String unNom){
        nombreComp=unNom;
    }
    
    private void setCategoria(int unaCat){
        categoria = unaCat;
    }
            
    private void setEspecialidad(String unaEsp){
        especialidad = unaEsp;
    }

    private String getNombreComp() {
        return nombreComp;
    }

    private int getCategoria() {
        return categoria;
    }

    private String getEspecialidad() {
        return especialidad;
    }
    
    public void agregarSubsidio(Subsidios unSubsidio){
        if (DL < DF){ // Los tendre que hacer con getters?
            sub[DL]=unSubsidio;
            DL++;
        }else{
            System.out.println("No se pueden agregar más subsidios");
        }
    }
    
    public double dineroTotalOtorgadoInv(){
        double total=0;
        for (int i=0;i<DL;i++){
            if (sub[i].getOtorgado()) {
                total += sub[i].getMontoPedido();
            }
        }
        return total;
    }
    
    public void otorgarTodos(String nombreComp){
         for (int i = 0; i < DL; i++) {
            if (!sub[i].getOtorgado()) {
                sub[i].setOtorgado(true);
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
}
