/*
Un supermercado quiere administrar la información correspondiente a los tickets de compra emitidos.
El supermercado posee una dirección, el número de venta actual y la información de las cajas (a lo sumo 5)
De cada caja se conoce el nombre del cajeroy la informacion de los tickets que emitió (como maximo T).

De cada ticket de compra se registra: número de ticket, CUIT del cliente, cantidad de productos comprados,
monto abonado y el medio de pago utilizado: débito, crédito o efectivo.

1. Genere las clases necesarias. Provea constructores para crear: el supermercado con la dirección,
con capacidad para un máximo de 5 cajas (inicialmente sin cajas) y con número de venta actual en 0,
cada caja con el nombre del cajero v con capacidad para un máximo de T tickets (inicialmente sin tickets);
cada ticket a partir de la información necesaria.


2. Implemente los métodos necesarios, en las clases que corresponda, para:
a) Dada una caja, agregarla a las cajas del supermercado.

b) Dado un número N de caja, el CUIT de un cliente, una cantidad de productos comprada,
un monto abonado y una forma de pago, generar el ticket de compra (el número de ticket
se corresponde con el número de venta actual del supermercado) y agregarlo en dicha caja
del supermercado. Asumir que el número N de caja es válido.

c) Obtener el número de caja que emitió la menor cantidad de tickets con forma de pago crédito.

d) Obtener un String que represente el supermercado siguiendo el ejemplo:
"Supermercado: Dirección; Cantidad de cajas
Caja 1: Nombre del cojero; Tickets emitidos: [Nro, CUIT del cliente, cantidad de productos, monto abonado, medio pago,
Caja 2: Nombre del cajero; Tickets emitidos: [Nro, CUIT del cliente, cantidad de productos, monto abonado, medio pago...


3. Realice un programa que instancie un supermercado. Agregue cajas. Genere tickets de compra sobre distintas cajas.
Compruebe el correcto funcionamiento de los métodos implementados.
 */
package Parciales;


public class ParcialSupermercado {

    public static void main(String[] args) {
        
        Supermercado superMarket = new Supermercado("7 y 50");
        
        Caja caja1 = new Caja("juan",3);
        Caja caja2 = new Caja("lola",2);
       
        
        superMarket.agregarCaja(caja1);
        superMarket.agregarCaja(caja2);
        
        // TICKETS CAJA 1
        Ticket t1 = new Ticket(123,222,12,1000,"credito");
        Ticket t2 = new Ticket(456,333,13,2000,"efectivo");
        caja1.agregarTicket(t1);
        caja1.agregarTicket(t2);
        
        // TICKETS CAJA 2
        Ticket t3 = new Ticket(789,444,14,3000,"credito");
        Ticket t4 = new Ticket(101,555,15,4000,"credito");
        caja2.agregarTicket(t3);
        caja2.agregarTicket(t4);
        
        superMarket.buscarCaja();
        
    }
    
}
