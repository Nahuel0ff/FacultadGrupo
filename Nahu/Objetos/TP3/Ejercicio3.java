package tema3;


public class Ejercicio3 {

   // ESTA MAL HECHO, EL CONSTRUCTOR DEBERIA RECIBIR EL "PARAMETRO" EN LUGAR DE SETEARLO
   // NO SE BUSCA EL AUTOR COMO PIDE LA CONSIGNA, FALTAN EJERCICIOS
    public static void main(String[] args) {
    
      Estante estant = new Estante(20);
      Libro uno = new Libro();
      uno.setTitulo("Java 4 Dummies");
      Libro dos = new Libro();
      dos.setTitulo("Mujercitas");
      Libro tres = new Libro();
      tres.setTitulo("Pascal 4 Dummies");
      Libro cuatro = new Libro();
      cuatro.setTitulo("Creo que R-Info no tiene libro, lee la documentacion");
      estant.agregarLibro(uno);
      estant.agregarLibro(dos);
      estant.agregarLibro(tres);
      estant.agregarLibro(cuatro);
      Libro libroBuscado = estant.buscarLibro("Mujercitas");
      if (libroBuscado != null){
          System.out.println("Se encontro el libro Mujercitas");
       } else {
            System.out.println("El libro 'Mujercitas' no se encontró en el estante.");
        }
      
      System.out.println(""+estant.getCantLibros());
   
        
        
        
        
       
    }
    
}
