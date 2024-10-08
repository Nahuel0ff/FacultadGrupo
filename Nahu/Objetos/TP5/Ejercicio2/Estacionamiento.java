/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2practica5;

/**
 *
 * @author nahue
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horarioAper;
    private String horarioCie;
    private int piso;
    private int plaza;
    private Auto[][] matriz;
    private int DL = 0;
    private int DF;

    public Estacionamiento(String direccion,String nombre,int n,int m){
        setNombre(nombre);
        setDireccion(direccion);
        setHorarioAper("08:00");
        setHorarioCie("21:00");
        setPiso(n);
        setPlaza(m);
        this.matriz = new Auto[n][m];
        setDF(n,m);
        
    }
    
    public Estacionamiento(String direccion,String nombre,String horarioAper,String horarioCie,int n,int m){
        setNombre(nombre);
        setDireccion(direccion);
        setHorarioAper(horarioAper);
        setHorarioCie(horarioCie);
        this.matriz = new Auto[n][m];
    }

    private void setPiso(int unPiso) {
        this.piso = unPiso;
    }
    
    private int getPiso(){
        return piso;
    }
    
    private void setPlaza(int unaPlaza) {
        this.plaza = unaPlaza;
    }
    
    private int getPlaza(){
        return plaza;
    }
    
    private void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private void setHorarioAper(String horarioAper) {
        this.horarioAper = horarioAper;
    }

    private void setHorarioCie(String horarioCie) {
        this.horarioCie = horarioCie;
    }
    
    private void setDF(int num1, int num2){
        DF= num1*num2;
    }

    public void agregarAuto(Auto unAuto, int n, int m ){               
            if (matriz[n][m] == null){
                matriz[n][m]=unAuto;
                DL++;
                }else{
                System.out.println("El lugar esta ocupado");             
        }
    }
    
    public String buscarPorPatente(String patente){
    String aux = "Auto Inexistente";
    int limitPiso = this.getPiso();
    int limitPlaza = this.getPlaza();        
    boolean encontre = false;      
    int i = 0, j = 0;
    while (i < limitPiso && !encontre){
        j = 0;
        while (j < limitPlaza && !encontre){
            Auto auto = this.matriz[i][j];
            if (auto != null && auto.getPatente().equals(patente)){
                encontre = true;
                aux = "Piso: "+(i+1)+", Plaza: "+(j+1);
            }
            j++;
        }
        i++;
    }
    return aux;
}
    
    @Override
    public String toString(){
        String aux="";
        for (int i =0; i<getPiso();i++){
            for(int j=0;j<getPlaza();j++){
                if (matriz[i][j] == null){
                    aux +="Piso: "+(i+1)+" Plaza: "+(j+1)+" libre\n";
                }else{
                    aux +="Piso: "+(i+1)+" Plaza: "+(j+1)+" : "+
                    matriz[i][j].getPatente()+" (Dueño: "+
                    matriz[i][j].getDueño()+")\n";
                }
            }
        } 
        return aux;
 }
    
 public int cantidadAutosEnPlaza(int plazaY) {
    int cont = 0;
    for (int i = 0; i < getPiso(); i++) {
        if (matriz[i][plazaY - 1] != null) {
            cont++;
        }
    }
    return cont;
}
  
    
    
    
    
    
}
