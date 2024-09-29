package practica2;
import PaqueteLectura.Lector;

public class ejercicio5 {
    public static void main(String [] args){
      Partido partidos;
      Partido [] vector = new Partido [20];
      String nomVisitante;
      int dimL = 0;
      int i;
      int ganaR = 0;
      int golesB = 0;
    
      System.out.print("Nombre del equipo visitante: ");
      nomVisitante = Lector.leerString();
      while((dimL < 20) && (!nomVisitante.equals("ZZZ"))){
          System.out.print("Nombre del equipo local: ");
          String nomLocal = (Lector.leerString());
          System.out.print("Cantidad de goles del equipo local: ");
          int golesLocal = (Lector.leerInt());
          System.out.print("Cantidad de goles del equipo visitante: ");
          int golesVisitante = (Lector.leerInt());
          partidos = new Partido(nomLocal, nomVisitante,golesLocal,golesVisitante);
          System.out.println("-----------------------------");
          vector[dimL] = partidos;
          dimL++;
          System.out.println("Nombre del equipo visitante: "); 
          nomVisitante = Lector.leerString();
      }
      for(i = 0; i<dimL; i++){
          System.out.println("EQUIPO-LOCAL "+vector[i].getGolesLocal()+" VS EQUIPO-VISITANTE "+ vector[i].getGolesVisitante());
          if(vector[i].getGanador().equals("River"))
              ganaR++;
          if(vector[i].getLocal().equals("Boca"))
             golesB = golesB +vector[i].getGolesLocal();          
      } 
      System.out.println("La cantidad de partidos que gano river es de: "+ganaR);
      System.out.println("La cantidad de goles que metio boca jugando de local es de: "+golesB);
    }  
    
}
