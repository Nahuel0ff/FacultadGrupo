package tema3;
import PaqueteLectura.Lector;
public class Ejercicio4 {
    public static void main(String []args){
        Hotel hotel = new Hotel(5);
        String nombre;
        
        System.out.print("Nombre: ");
        nombre = Lector.leerString();
        while(!nombre.equals("ZZZ")){
            System.out.print("DNI: ");
            int dni = Lector.leerInt();
            System.out.print("Edad: ");
            int edad = Lector.leerInt();
       
            Cliente per = new Cliente(nombre,dni,edad);
            System.out.print("Ingrese una habitacion: ");
            hotel.agregarCliente(Lector.leerInt(), per);
            System.out.println("-------------------------------");
            
            System.out.print("Nombre: ");
            nombre = Lector.leerString();
        }
        
        System.out.println(hotel.toString());
        System.out.print("Ingrese el aumento: ");
        hotel.aumentarPrecio(Lector.leerDouble());
        System.out.println(hotel.toString());
               
    }
}
