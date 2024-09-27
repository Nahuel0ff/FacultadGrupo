/*
    a) Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
    autor es un objeto instancia de la clase Autor.

    Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
    y que deben permitir devolver/modificar el valor de sus atributos y devolver una
    representación String formada por nombre, biografía y origen.

    Luego realice las modificaciones necesarias en la clase Libro.

    b)  Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los libros
    con su autor, considerando las modificaciones realizadas.
    Luego, a partir de uno de los libros instanciados, obtenga e imprima la representación del autor de ese libro
 */
package Practica3;

import PaqueteLectura.Lector;

public class P3E2 {

   
    public static void main(String[] args) {
        
        // cargo autor
        String nombre, bio, origen;
        Autor autor1;
        
        System.out.println("Nombre del autor: ");
        nombre = Lector.leerString();
        System.out.println("Biografía del autor: ");
        bio = Lector.leerString();
        System.out.println("Origen del autor: ");
        origen = Lector.leerString();
        
        autor1 = new Autor (nombre, bio, origen);
        
        
        // cargo libros
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 autor1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               autor1, "978-1512108347");
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}
