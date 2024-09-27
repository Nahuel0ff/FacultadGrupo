/*
    La clase libro debe ser modificada para que uno de sus atributos
    sea de tipo "Autor".
 */
package Practica3;

public class Libro {

    // ATRIBUTOS //

    private String titulo;
    private String editorial;
    private int añoEdicion;
    private String ISBN; 
    private double precio; 


    // ATRIBUTOS DE TIPO OBJETOS // 

    private Autor autor;

    
    
    // CONSTRUCTORES //
    
    public Libro(  String unTitulo,  String unaEditorial, 
    int unAñoEdicion,  Autor unAutor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         ISBN =  unISBN;
         precio = unPrecio;
         autor = unAutor;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor unAutor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         autor = unAutor;
         ISBN =  unISBN;
         precio = 100;
    }
    
    public Libro(){
   
    }
    
    
    
    // MÉTODOS GETTERS //
    
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
   
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
    
    public Autor getAutor(){
        return autor;
    }
    
   
    
    
    // MÉTODOS SETTERS //
    
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
   
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
    
    
   
    
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + autor.getNombre() + " - " + añoEdicion +" "+"Biografía: "+autor.getBiografia()+" - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
