package tema3;

public class Ejercicio3 {

    public static void main(String[] args) {

        Estante estante = new Estante(20);
        
        Libro uno = new Libro();
        uno.setTitulo("Java 4 Dummies");
        uno.setPrimerAutor(new Autor("Autor1", "Biografía del autor1", "Origen1"));

        Libro dos = new Libro();
        dos.setTitulo("Mujercitas");
        dos.setPrimerAutor(new Autor("Louisa May Alcott", "Escritora estadounidense", "EE.UU"));

        Libro tres = new Libro();
        tres.setTitulo("Pascal 4 Dummies");
        tres.setPrimerAutor(new Autor("Autor2", "Biografía del autor2", "Origen2"));

        Libro cuatro = new Libro();
        cuatro.setTitulo("Creo que R-Info no tiene libro, lee la documentacion");
        cuatro.setPrimerAutor(new Autor("Autor3", "Biografía del autor3", "Origen3"));

        estante.agregarLibro(uno);
        estante.agregarLibro(dos);
        estante.agregarLibro(tres);
        estante.agregarLibro(cuatro);

        Libro libroBuscado = estante.buscarLibro("Mujercitas");
        if (libroBuscado != null) {
            System.out.println("Se encontró el libro 'Mujercitas'. Autor: " + libroBuscado.getPrimerAutor().getNombre());
        } else {
            System.out.println("El libro 'Mujercitas' no se encontró en el estante.");
        }

        System.out.println("Cantidad de libros en el estante: " + estante.getCantLibros());
    }
}
