
package parcialsupermercado;


public class ParcialSupermercado {

   
    public static void main(String[] args) {
       
        
        Supermercado despensaPepe = new Supermercado("Av 66");
        
        
        Cajas caja1 = new Cajas("Marcos",5);
        Cajas caja2 = new Cajas("Carlos",5);
        Cajas caja3 = new Cajas("Hector",5);
        
        despensaPepe.agregarCaja(caja1);
        despensaPepe.agregarCaja(caja2);
        despensaPepe.agregarCaja(caja3);
                
                
        despensaPepe.cargarTicket(2, 34, 5, 66.00, "Credito");
        despensaPepe.cargarTicket(1, 44552, 1, 77.70, "Efectivo");
        despensaPepe.cargarTicket(2, 3444, 7, 9000.00, "Credito");
        despensaPepe.cargarTicket(3, 455, 9, 55.00, "Credito");
        despensaPepe.cargarTicket(1, 44666, 2, 88.00, "Debito");
        
        System.out.println("La menor cantidad de compras pagadas con credito se realizaron en la caja: "+despensaPepe.menorCantTicketCred());
        
        System.out.println(despensaPepe.toString());
        
    }
    
}
