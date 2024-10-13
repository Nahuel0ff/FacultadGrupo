

package parcialestacionamiento;


public class ParcialEstacionamiento {

    public static void main(String[] args) {
      
        Estacionamiento esta = new Estacionamiento("Av 66",50.00,5,8);
        
        Vehiculo auto1 = new Vehiculo("AAA111",4,"Renault","Megane");
        Vehiculo auto2 = new Vehiculo("AAA111",4,"Renault","Fluence");
        Vehiculo auto3 = new Vehiculo("AAA111",4,"Renault","Clio");
        Vehiculo auto4 = new Vehiculo("AAA111",4,"Ford","Mustang");
        Vehiculo auto5 = new Vehiculo("AAA111",4,"Toyota","Corolla");
        Vehiculo auto6 = new Vehiculo("AAA111",4,"Renault","Megane");
        
        esta.registrarAuto(auto1, 1, 1);
        esta.registrarAuto(auto2, 2, 2);
        esta.registrarAuto(auto3, 2, 1);
        esta.registrarAuto(auto4, 4, 1);
        esta.registrarAuto(auto5, 1, 3);
        esta.registrarAuto(auto6, 2, 1);
        
        System.out.println("El sector con mas recaudacion fue: "+esta.queMasRecaudo());
        
        System.out.println(esta.toString());
        
        esta.liberarAutos("Ford");
        
        System.out.println(esta.toString());
        
        
        
        
    }
    
}
