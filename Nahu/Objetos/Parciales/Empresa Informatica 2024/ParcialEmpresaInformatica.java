
package parcialempresainformatica;


public class ParcialEmpresaInformatica {

    
    public static void main(String[] args) {
     
        ProgramadorLider elLider = new ProgramadorLider("Carlos",22333444,5000.00,400,"Java",5,3); 
        Empresa empresaUno = new Empresa("Riot",elLider,5);
        
        
        Programador prog1 = new Programador("Carlitos",33222444,3000.00,100,"Cobol");
        Programador prog2 = new Programador("Carlitos",33222444,3000.00,100,"Cobol");
        Programador prog3 = new Programador("Carlitos",33222444,3000.00,100,"Cobol");
        Programador prog4 = new Programador("Carlitos",33222444,3000.00,100,"Cobol");
        Programador prog5 = new Programador("Carlitos",33222444,3000.00,100,"Cobol");
        
        empresaUno.agregarProgramador(prog1);
        empresaUno.agregarProgramador(prog2);
        empresaUno.agregarProgramador(prog3);
        empresaUno.agregarProgramador(prog4);
        empresaUno.agregarProgramador(prog5);
        
        empresaUno.aumentarSueldo(3000.00);
        
        System.out.println(empresaUno.toString());
        
        
        
        
    }
    
}
