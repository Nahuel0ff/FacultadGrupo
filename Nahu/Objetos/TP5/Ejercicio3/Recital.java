
package ejercicio3practica5;


public class Recital {
    private String banda;
    private int lista;
    private String[] vector;
    private int DL = 0;
    
    public Recital(String banda,int lista){
        setBanda(banda);
        setLista(lista);
        String vector[]= new String[lista];
    }
    

    public String getBanda() {
        return banda;
    }

    private void setBanda(String banda) {
        this.banda = banda;
    }

    public int getLista() {
        return lista;
    }

    private void setLista(int lista) {
        this.lista = lista;
    }
    
    private int getDL(){
        return DL;
    }
    
    private void setDL(int dl){
        this.DL=dl;
    }
    
    public void agregarTema(String tema){
        if (this.getDL() < this.getLista()){ //Asi de bardero lo tengo que hacer?
            vector [this.getDL()] =tema;
            this.setDL(this.getDL()+1);
        }else{
            System.out.println("No hay lugar para mas temas");
        }
    }
    
    public String actuar(){
        String aux="";
        for (int i=0;i<this.getDL();i++){
            aux +="Y ahora tocaremos..."+vector[i]+"\n";
        }
        return aux;
    }
    
    public double calcularCosto(){
        double aux=0;
        return aux;
    }
    
}
