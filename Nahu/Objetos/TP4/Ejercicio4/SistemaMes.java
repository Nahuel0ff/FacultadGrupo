
package tema4;

public class SistemaMes extends Sistema{
    double matriz [][];
    private final int MES=12;
    
       
    public SistemaMes(String unNombre, double unaLong, double unaLati, int unAñoIni, int unAños) {
        super(unNombre, unaLong, unaLati, unAñoIni, unAños);
        matriz = new double[unAños][MES];
        int x,y,anios =this.getCantAños();
        for(x=0;x<anios;x++){
            for(y=0;y<MES;y++){
                matriz[x][y]=1000;
            }
        }
    }

    @Override
    public void registrarTemp(double temp, int año, int mes) {
        matriz[año][mes]=temp;      
    }

    @Override
    public double obtenerTemp(int año, int mes) {
       return matriz[año][mes];
    }

    @Override
    public String mayorTemp() {
        double max=-1;
        String aux="nada";
        int x,y,años =this.getCantAños();
        for(x=0;x<años;x++){
            for(y=0;y<MES;y++){
                if (matriz[x][y]>max){
                    max=matriz[x][y];
                    aux ="Año "+x+" y el mes "+y+" tiene la temperatura max de: "+max;
                }
            }
        }
        return aux;
    }

    @Override
    public String calcularProm() {
        int x,y,años=this.getCantAños();
        String aux = "nada";
        double total;
        for (y=0;y<MES;y++){
            total=0;
            for (x=this.getAñoIni();x<años;x++){
                total+=matriz[x][y];
            } 
            aux = "La temperatura prom del mes: "+x+" es de: "+String.format("%.2f",(double)total/12)+"\n";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = super.toString()+calcularProm();
        return aux;
    }
    
}
