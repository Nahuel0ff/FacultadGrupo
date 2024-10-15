/*
Se desea representar una empresa de informática y sus programadores. La empresa tiene:
nombre, un programador lider y a lo sumo N programadores. De los programadores se conoce:
nombre, DNI, sueldo básico, cantidad de líneas de código por hora y lenguaje de preferencia.
Adicionalmente, del programador Iider se conoce: antigüedad en años y cantidad de proyectos dirigidos.

1) Genere las clases necesarias. Provea constructores para iniciar: el programador lider
y programadores a partir de toda su información; la empresa a partir de un nombre,
un programador lider, con capacidad para un máximo de N programadores (Inicialmente sin programadores).

2)Implemente los métodos necesarios, en las clases que corresponda, para:

a) Dado un programador, agregarlo a la empresa.

b) Calcular el monto total en sueldos a abonar por la empresa, sabiendo que es
la suma de los sueldos finales de todos los programadores de la empresa (incluido el lider).
Para cualquier programador, el sueldo final es el sueldo básico adicionando 50.000$ si supera
las 200 líneas de código por hora. Además de eso, para el programador líder, se adiciona $10.000
por año de antigüedad y $20.000 por proyecto dirigido.

c) Dado un monto M, aumentar el sueldo básico de todos los programadores en M (incluido el líder).

d) Retornar la representación String de la empresa, siguiendo el ejemplo:

"Empresa: nombre. Programador lider: (nombre, DNI, lenguaje de preferencia, sueldo final)
Programador 1: (nombre, DNI, lenguaje de preferencia, sueldo final
Programador 2: (nombre, DNI, lenguaje de preferencia, sueldo final)
Monto total en sueldos a abonar por la empresa: ..."

3) Realice un programa que instancie una empresa informática con un líder.
Agregue algunos programadores a la empresa. Aumente los sueldos básicos de todos los programadores
de la empresa en un monto. Muestre la representación String de la empresa.
 */
package Parciales;

public class ParcialProgramadores {

    public static void main(String[] args) {
        
        ProgramadorLider pLider = new ProgramadorLider("lola",123,1000,300,"java",2,10);
        Empresa empresaTech = new Empresa("lolaTech",pLider,5);
        
        Programador p1 = new Programador ("juan",345,1000,250,"java");
        Programador p2 = new Programador ("marco",567,1000,150,"java");
        
        empresaTech.agregarProgramador(p1, 0);
        empresaTech.agregarProgramador(p2, 1);
        
        empresaTech.aumentarSueldos(2000);
        
        System.out.println(empresaTech.toString());
    }
    
}
