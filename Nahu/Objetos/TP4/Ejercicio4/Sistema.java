
package tema4;


public abstract class Sistema extends Estacion {
    private int añoInicio, cantAños;
            
    public Sistema(String unNombre, double unaLong, double unaLati,int unAñoIni,int unAños) {
        super(unNombre, unaLong, unaLati);
        setAñoIni(unAñoIni);
        setCantAños(unAños);
    }
    
    private void setAñoIni(int unAño){
        añoInicio = unAño;
    }
    
    private void setCantAños(int unAño){
        cantAños = unAño;
    }
    
    public int getAñoIni(){
        return añoInicio;
    }
    
    public int getCantAños(){
        return cantAños;
    }
    
    public abstract void registrarTemp(double temp,int año,int mes);
    
    public abstract double obtenerTemp(int año,int mes);
    
    public abstract String mayorTemp();
    
    public abstract String calcularProm();
    
    
}
