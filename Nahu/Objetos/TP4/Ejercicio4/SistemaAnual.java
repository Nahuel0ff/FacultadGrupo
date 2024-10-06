
package tema4;

public class SistemaAnual extends Sistema {
    double matriz [][];
    private final int MES=12;

    public SistemaAnual(String unNombre, double unaLong, double unaLati, int unAñoIni, int unAños) {
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
        int x,y,año=this.getCantAños();
        String aux = "nada";
        double mayor = -1;
        for (x=0;x<año;x++){
            for(y=0;y<MES;y++){
                if(matriz[x][y]>mayor){
                    aux="Año: "+x+" mes : "+y;
                    mayor=matriz[x][y];
              }
            }
        }
        return aux;
    }
        

    @Override
    public String calcularProm() {
        int x,y,año=this.getCantAños();
        String aux ="nada";
        double total;
        for (x=this.getAñoIni();x<año;x++){
            total=0;
            for(y=0;y<MES;y++){
                total+=matriz[x][y];
            }
            aux ="La temp promedio por año:"+x+" es de "+String.format("%.2f",(double)total/12)+"\n";
        }
        return aux;
    }
        
    
    @Override
    public String toString(){
        String aux = super.toString()+calcularProm();
        return aux;
    }
}
