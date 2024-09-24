
package tema2;

import PaqueteLectura.Lector;

public class Ejercicio5 {


    public static void main(String[] args) {
     
        Partido vector [] = new Partido [20];
        
        int cant =0;
        String loc = "";
        String vis = "";
        int golesBoca = 0;
        int partRiver = 0;
        do{
            System.out.println("Ingrese equipo Local: ");
            loc = Lector.leerString();
            if (!loc.equals("ZZZ")) {
                System.out.println("ingrese equipo Visitante: ");
                vis = Lector.leerString();
                if (!vis.equals("ZZZ")) {
                    System.out.println("Ingrese la cantadidad de goles del equipo Local");
                    int golLoc = Lector.leerInt();
                    System.out.println("Ingrese la cantidad de goles del equpico Visitante");
                    int golVis = Lector.leerInt();
                    vector [cant] = new Partido(loc,vis,golLoc,golVis);
            
                    if (vector[cant].getGanador().equals("River")){
                        partRiver +=1;
                    }
            
                    if (loc.equals("Boca")){
                        golesBoca +=golLoc;
                     }
            
                    cant++;
                }
            }
        } while (cant < 20 && !loc.equals("ZZZ") && !vis.equals("ZZZ"));
        
        for (int i=0; i<cant;i++){
            System.out.println(vector[i].getLocal()+" "+vector[i].getGolesLocal()+" VS "+vector[i].getVisitante()+" "+vector[i].getGolesVisitante());
        }
        System.out.println("Cantidad de partidos ganados por River: " + partRiver);

        System.out.println("Total de goles que Boca realizó como local: " + golesBoca);
    }
    
}
