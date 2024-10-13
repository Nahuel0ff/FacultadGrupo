
package parcialescuelademusica;


public class Concurso {
    private int DF;
    private int[] vecDL;
    private int maxAlu;
    private Alumno [][] matrizCon;
    
    public Concurso(int maxAlu){
        this.setMaxAlu(maxAlu);
        this.matrizCon = new Alumno[5][maxAlu];
        this.vecDL = new int[5];
        this.iniVecDL();
    }
    
    public int getDF() {
        return DF;
    }

    private void setDF(int DF) {
        this.DF = DF;
    }

    public int getMaxAlu() {
        return maxAlu;
    }

    private void setMaxAlu(int maxAlu) {
        this.maxAlu = maxAlu;
    }
    
    private void iniVecDL(){
        for(int i=0; i<5;i++){
            this.vecDL[i]=0;
        }
    }
    
    
    public void inscribirAlu(Alumno unAlu, int unGenero){
        if(this.vecDL[unGenero-1]<this.getMaxAlu()){
            this.matrizCon[unGenero-1][this.vecDL[unGenero-1]]=unAlu;
            this.vecDL[unGenero-1]++;
        }
    }
    
    public void asignarPuntaje(int unPunt, String unNom){
        int i=0;
        int j=0;
        boolean exito = false;
        while(i < this.getMaxAlu() && !exito){
            while(j < this.vecDL[i] && !exito){
                if (this.matrizCon[i][j].getNombre().equals(unNom)){
                    this.matrizCon[i][j].setPuntaje(unPunt);
                    exito=true;
                }
            j++;
            }
         j=0;
         i++;
        }
    }
    
    public int generoConMasInscriptos(){
        int max=0;
        int act=0;
        int cant=-1;
        for(int i=0; i<5;i++){
            act= this.vecDL[i];
            if (cant < act){
                max=i;
                cant=act;
            }
        }
        return max+1;
    }
    
    @Override
    public String toString(){
        String aux="";
        for (int i=0; i<5;i++){
            aux+="Genero: "+(i+1)+"\n";
            for(int j=0; j< this.vecDL[i];j++){
                aux+=this.matrizCon[i][j].toString();
            }
        }
        return aux;
    }
    
    
}
