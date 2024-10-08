
package ejercicio3practica5;


public class EventoOcasional extends Recital {
    private String motivo;
    private String contratante;
    private int diaDelEvento;
    
    
    public EventoOcasional(String banda, int lista,String motivo,String contratante,int diaDelEvento) {
        super(banda, lista);
        setMotivo(motivo);
        setContratante(contratante);
        setDiaDelEvento(diaDelEvento);
    }

    public String getMotivo() {
        return motivo;
    }

    private void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    private void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public int getDiaDelEvento() {
        return diaDelEvento;
    }

    private void setDiaDelEvento(int diaDelEvento) {
        this.diaDelEvento = diaDelEvento;
    }
    
    @Override
    public String actuar(){
        String aux = "";
        if (this.getMotivo().equals("Beneficiencia")){
            aux+="Recuerden colaborar con…"+this.getContratante()+"\n";
        }else if(this.getMotivo().equals("Show de TV")){
            aux+="Saludos a mis amigos televidentes \n";
        } else if(this.getMotivo().equals("Show Privado")){
            aux+="Un feliz cumpleaños para..."+this.getContratante()+"\n";
        }
        aux+=super.actuar();
        return aux;
    }
    
     public double calcularCosto(){
         double aux = super.calcularCosto();
        if (this.getMotivo().equals("Beneficiencia")){
            aux=0;
        }else if (this.getMotivo().equals("Show de TV")){
            aux=50000.00;
        } else if (this.getMotivo().equals("Show Privado")){
            aux=150000.00;
        }
        return aux;
    }
    
    
}
