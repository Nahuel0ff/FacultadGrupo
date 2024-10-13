
package parcialescuelademusica;


public class ParcialEscuelaDeMusica {

    
    public static void main(String[] args) {
     
        Concurso concursito = new Concurso(20);
        
        Alumno alu1 = new Alumno("Carlitos",9,"Saxo");
        Alumno alu2 = new Alumno("Roberto",7,"Tambor");
        Alumno alu3 = new Alumno("Hector",6,"Triangulo Electrico");
        Alumno alu4 = new Alumno("Fernando",10,"Armonica");
        Alumno alu5 = new Alumno("Carlos",9,"Guitarra");
        Alumno alu6 = new Alumno("Fernando",10,"Armonica");
        Alumno alu7 = new Alumno("Fernando",10,"Armonica");
        Alumno alu8 = new Alumno("Fernando",10,"Armonica");
        
        
        concursito.inscribirAlu(alu1, 1);
        concursito.inscribirAlu(alu2, 2);
        concursito.inscribirAlu(alu3, 3);
        concursito.inscribirAlu(alu4, 4);
        concursito.inscribirAlu(alu5, 5);
        concursito.inscribirAlu(alu6, 5);
        concursito.inscribirAlu(alu7, 5);
        concursito.inscribirAlu(alu8, 5);
        
        concursito.asignarPuntaje(9, "Carlitos");
        concursito.asignarPuntaje(9, "Carlos");
        concursito.asignarPuntaje(9, "Roberto");
        
        System.out.println("El genero con mas incriptos es: "+concursito.generoConMasInscriptos());
        System.out.println(concursito.toString());
    }
    
}
