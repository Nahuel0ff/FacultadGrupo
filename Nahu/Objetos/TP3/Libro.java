package tema3;

public class Libro {
    private String titulo;
    private Autor primerAutor; 
    private String editorial;
    private int añoEdicion;
    private String ISBN; 
    private double precio; 

    public Libro(String unTitulo, String unaEditorial, int unAñoEdicion, Autor unPrimerAutor, String unISBN, double unPrecio) {
        titulo = unTitulo;
        editorial = unaEditorial; 
        añoEdicion = unAñoEdicion;
        primerAutor = unPrimerAutor;
        ISBN = unISBN;
        precio = unPrecio;
    }

    public Libro() {
 
    }


    public String getTitulo() {
        return titulo;
    }

    public Autor getPrimerAutor() {
        return primerAutor;
    }

    public void setTitulo(String unTitulo) {
        titulo = unTitulo;
    }

    public void setPrimerAutor(Autor unPrimerAutor) {
        primerAutor = unPrimerAutor;
    }


    public boolean esElTitulo(String tituloBuscado) {
        return titulo.equalsIgnoreCase(tituloBuscado);
    }

    @Override
    public String toString() {
        return titulo + " por " + primerAutor + " - " + añoEdicion + " - ISBN: " + ISBN;
    }
}
