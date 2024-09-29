package practica2;
import PaqueteLectura.Lector;
public class ejercicio4 {
    public static void main(String [] args){
        Persona [][] matriz = new Persona[5][8];
        Persona per;
        int i;
        int j;
        int elementos = 0;
        int turno;
        int columna;
        int cant;
        
        for(i = 0; i<5; i++){
            for(j = 0; j<8; j++)
                matriz[i][j] = null;
        }
        
        System.out.print("Nombre: ");
        String nombre = Lector.leerString();
        while((elementos != 40) && (!nombre.equals("ZZZ"))){
            System.out.print("Dni: ");
            int dni = Lector.leerInt();
            System.out.print("Edad: ");
            int edad = Lector.leerInt();
            System.out.print("Ingrese el dia en el que quiera sacar el turno: ");
            turno = Lector.leerInt();
            System.out.println("------------------------");
            columna = 0;
            while((columna < 8)&&(matriz[turno][columna] != null))
                columna++;
            if((columna < 8) &&(matriz[turno][columna] == null)){
                per = new Persona(nombre, dni, edad);
                matriz[turno][columna] = per;
                elementos++;
            }else
                System.out.println("EL DIA EN EL QUE QUIERE SACAR EL TURNO YA ESTA LLENO.");
            System.out.print("Nombre: ");
            nombre = Lector.leerString();
                 
        }
        
        
        
        for(i= 0; i<5; i++){
            cant = 0;
            columna= 0;
            while((columna < 8) &&(matriz[i][columna] != null)){
                cant++;
                System.out.print("("+i+","+columna+") "+matriz[i][columna].getNombre()+ " |");
                columna++;
            }
            System.out.println("");
            System.out.println("La cantidad de turnos el dia " + i+ " es de: "+ cant);
        }
        
    }
}
