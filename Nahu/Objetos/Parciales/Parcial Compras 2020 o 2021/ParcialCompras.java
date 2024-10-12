
package parcialcompras;

public class ParcialCompras {

    
    public static void main(String[] args) {
     
        CompraMayorista nini = new CompraMayorista(5,332221111);
        
        CompraMinorista chino = new CompraMinorista(5,false);
        
        Producto unProd = new Producto(4,20.00,"Nada");
        Producto unProd2 = new Producto(3,60.00,"Nada");
        Producto unProd3 = new Producto(5,50.00,"Nada");
        Producto unProd4 = new Producto(7,40.00,"Nada");
        Producto unProd5 = new Producto(3,10.00,"Nada");
        Producto unProd6 = new Producto(1,40.00,"Nada");
        
        nini.agregarCompra(unProd);
        nini.agregarCompra(unProd3);
        nini.agregarCompra(unProd2);
        chino.agregarCompra(unProd4);
        chino.agregarCompra(unProd5);
        chino.agregarCompra(unProd6);
        
        System.out.println(nini.toString());
        System.out.println(chino.toString());
    }
    
}
