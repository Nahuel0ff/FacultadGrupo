
package parcialbanco;


public class ParcialBanco {

   
    public static void main(String[] args) {
    
        BancoTrad bancoT = new BancoTrad(4,"Av 66","La Plata");
        
        BancoDigi bancoD = new BancoDigi(50,"www.hola.com");
        Cuenta unaCuenta = new Cuenta(1000,"Carlos",33222111,"Dolares",800);
        
        if(bancoT.agregarCuenta(unaCuenta)== true){
            System.out.println("Se agrego la cuenta");
        }else{
            System.out.println("No se agrego la cuenta");
        }
        
        if (bancoT.puedeRecibirTarjeta(1000)== true){
            System.out.println("Puede recibir");
        }else{
            System.out.println("No puede recibir");
        }
        
        
    }
    
}
