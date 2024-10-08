
package ejercicio3practica5;


public class Gira extends Recital {
    private String nombre;
    private Fecha[] fechas;
    private int DL = 0;
    private int DF;
    private int c = 0;
    
    
    public Gira(String banda, int lista,String nombre,int Df) {
        super(banda, lista);
        setNombre(nombre);
        setDF(Df);
        Fecha fechas [] = new Fecha [Df];
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDF() {
        return DF;
    }

    private void setDF(int DF) {
        this.DF = DF;
    }

    public int getDL() {
        return DL;
    }

    private void setDL(int DL) {
        this.DL = DL;
    }

    private int getC() {
        return c;
    }

    private void setC(int c) {
        this.c = c;
    }
    
    
    
    public void agregarFecha(Fecha unaFecha){
        if (DL < DF){
        fechas[DL]=unaFecha;
        DL++;
        }else{
            System.out.println("No hay cupo para mas fechas");
        }
    }
    
    public String Actuar(){
        String aux="Buenas noches..."+fechas[this.getC()].getCiudad()+super.actuar();
        this.setC(this.getC()+1);
        return aux;
    }
    
    public double calcularCosto(){
        double aux=super.calcularCosto();
        aux= (30000 * this.getDF());
        return aux;
    }
    
}
