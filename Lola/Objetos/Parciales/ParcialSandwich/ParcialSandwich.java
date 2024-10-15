/*
Representar un Sandwich. El Sandwich tiene un nombre, un Pan y a lo sumo N Ingredientes.
El Pan tiene un nombre, un costo y una calidad (Premium o normal).
Los Ingredientes tienen un nombre, un costo y un grupo (Α ο Β).

a) Genere las clases necesarias. Provea constructores para iniciar:
Un Pan e Ingrediente a partir de la Información necesaria;
al Sandwich a partir de un nombre, un Pan y
capacidad para un máximo de N Ingredientes (Inicialmente sin Ingredientes).

b) Implemente los métodos necesarios, en las clases que corresponda, para:

1. Agregar un Ingrediente al Sandwich.

2. Retornar el costo final de un Componente (Pan o Ingrediente), teniendo en cuenta
que el costo del Pan si es Premium tiene un incremento del 20% y en los Ingredientes si son del grupo B se
Incrementan un 10%.

3. Retornar una representación String de los Componentes de la
siguiente forma:
Un Pan: "Nombre-Costo-Calidad"
Un Ingrediente: "Nombre Costo-Grupo"

4. Retomar un String que represente al Sandwich, que contenga:
Nombre, representación del Pan, Cantidad de ingredientes, representación de los Ingredientes
y costo final del Sandwich (suma del costo ffinal del Pan más el costo final de todos sus Ingredientes).

c) Reallice um programa que instancie un Sandwich con un Pan y cargue Ingredientes. Luego, imprima la representación del Sandwich.
 */
package Parciales;

public class ParcialSandwich {

   
    public static void main(String[] args) {
        Pan pancito = new Pan("Bimbo",1000,"Premium");
        Sandwich sanbuchito = new Sandwich ("Stacker",pancito,3);
        
        Ingrediente i1 = new Ingrediente("Tomate",200,'A');
        Ingrediente i2 = new Ingrediente("Lechuga",500,'B');
        Ingrediente i3 = new Ingrediente("Jamon",800,'B');
        
        sanbuchito.agregarIngrediente(i1);
        sanbuchito.agregarIngrediente(i2);
        sanbuchito.agregarIngrediente(i3);
        
        System.out.println(sanbuchito.toString());
        
    }
    
}
