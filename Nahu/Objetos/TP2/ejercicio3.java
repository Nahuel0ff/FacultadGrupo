package practica2;
import PaqueteLectura.Lector;
public class ejercicio3 {
    public static void main(String [] args){
        Persona [][] matriz = new Persona[5][8];
        Persona per;
        int i;
        int j;
        int fila=0;
        int columna= 0;
        
        System.out.print("Nombre: ");
        String nombre = Lector.leerString();
        while((fila<5) && (!nombre.equals("ZZZ"))){
            System.out.print("Dni: ");
            int dni = Lector.leerInt();
            System.out.print("Edad: ");
            int edad = Lector.leerInt();
            per = new Persona(nombre, dni, edad);
            matriz[fila][columna] = per;
            columna++;
            if(columna == 8){
                columna = 0;
                fila++;
            }    
            System.out.print("Nombre: ");
            nombre = Lector.leerString();    
        }
        
        for(i = 0; i<fila; i++){
            System.out.println("");
            for(j = 0; j<8; j++){
                System.out.print("("+i+","+j+")"+ matriz[i][j].getNombre()+ " |");
            }
        }
    }
}
