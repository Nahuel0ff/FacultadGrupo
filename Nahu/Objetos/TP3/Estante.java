package tema3;

public class Estante {
    private Libro[] vectorLibros;
    private int dimF;
    private int dimL;

    public Estante(int capacidad) {
        this.dimF = capacidad;
        this.dimL = 0;
        this.vectorLibros = new Libro[dimF];
    }

    public int getCantLibros() {
        return dimL;
    }

    public boolean estaLleno() {
        return dimL == dimF;
    }

    public void agregarLibro(Libro libroAdd) {
        if (!estaLleno()) {
            vectorLibros[dimL] = libroAdd;
            dimL++;
        } else {
            System.out.println("El estante está lleno. No se puede agregar más libros.");
        }
    }

    public Libro buscarLibro(String titulo) {
        for (int i = 0; i < dimL; i++) {
            if (vectorLibros[i].esElTitulo(titulo)) {
                return vectorLibros[i];
            }
        }
        return null;
    }
}
