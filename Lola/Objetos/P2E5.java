/*
Se dispone de la clase Partido (en la carpeta tema2).
> Un objeto partido representa un encuentro entre dos equipos (local y visitante).

> Un objeto partido puede crearse sin valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden).

> Un objeto partido sabe responder a los siguientes mensajes:
    - getLocal() retorna el nombre (String) del equipo local
    - getVisitante() retorna el nombre (String) del equipo visitante
    - getGolesLocal() retorna la cantidad de goles (int) del equipo local
    - getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
    - setLocal(X) modifica el nombre del equipo local al “String” X
    - setVisitante(X) modifica el nombre del equipo visitante al “String” X
    - setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
    - setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
    - hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
    - getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String vacío).
    - hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el campeonato.
La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos.
Luego de la carga:
    - Para cada partido, armar e informar una representación String del estilo:
    {EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante}
    - Calcular e informar la cantidad de partidos que ganó River.
    - Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package Practica2;

import PaqueteLectura.Lector;

public class P2E5 {


    public static void main(String[] args) {
        // variables y type
        int df = 20;
        Partido [] vector = new Partido [df];
        
        int dimL=0; // dimension logica del vector
        String nomLoc, nomVis;
        int golesLoc, golesVis;
        int cantRiver = 0;
        int cantBoca = 0;
        
        
        // cargar vector
        System.out.println("Nombre equipo local: ");
        nomLoc = Lector.leerString();
        while (!nomLoc.equals("zzz") && (dimL<df)){
             System.out.println("Nombre equipo visitante: ");
             nomVis = Lector.leerString();
             System.out.println("Goles del equipo local: ");
             golesLoc = Lector.leerInt();
             System.out.println("Goles del equipo visitante: ");
             golesVis = Lector.leerInt();
             
             vector[dimL] = new Partido(nomLoc, nomVis, golesLoc, golesVis);
             dimL++;
             
             System.out.println("Nombre equipo local: ");
             nomLoc = Lector.leerString();
        }
        
        // informar
        
        for (int i=0; i<dimL; i++){
            System.out.println("EQUIPO-LOCAL "+vector[i].getGolesLocal()+" VS EQUIPO-VISITANTE "+vector[i].getGolesVisitante());
            
            if (vector[i].getLocal().equals("River")||(vector[i].getVisitante().equals("River"))){
                cantRiver++;
            }
            if (vector[i].getLocal().equals("Boca")){
                cantBoca++;
            }
        }
        System.out.println("River: "+cantRiver+" || Boca: "+cantBoca);
    }
    
}
