import java.util.Scanner;
public class main{
    public static void main(){
        Scanner in = new Scanner (System.in);
        Solicitud [] solicitud= new Solicitud[5];
        for(int i=0; i<5; i++){
            System.out.print("Ingrese numero de gestion: ");
            String numero = in.next();
            System.out.print("ingrese la fecha: ");
            String fecha = in.next();
            System.out.print("Ingrese los ingresos mensuales declarados: ");
            double ingresos = in.nextDouble();
            System.out.println("Ingrese la cantidad de integrantes del grupo familiar: ");
            int cantIntegrantes = in.nextInt();
            System.out.println("Ingrese la region: ");
            String region = in.next();
            System.out.print("Ingrese su nombre: ");
            String nombre = in.next();
            System.out.print("Ingrese su apellido: ");
            String apellido = in.next();
            System.out.print("Ingrese su CUIT: ");
            int CUIT = in.nextInt();
            System.out.print("Ingrese para que servicio esta pidiendo el subsidio (GasNatural / EnergiaElectrica): ");
            String aux = in.next();
            if(aux.equals("GasNatural")){
                System.out.print("Ingrese el numero de medidor: ");
                int medidor = in.nextInt();
                System.out.print("Ingrese el tamanio del hogar(en metros cuadrados): ");
                double tamanio= in.nextDouble();
                System.out.print("Ingrese la cantidad de calefactores/estufas: ");
                int calefactores = in.nextInt();
                GasNatural gas = new GasNatural(numero,fecha,ingresos,cantIntegrantes,region,nombre,apellido,CUIT,medidor,tamanio,calefactores);
                solicitud[i] = gas;
            }
            else {
                System.out.print("Ingrese el NIS");
                int NIS = in.nextInt();
                System.out.print("Ingrese la cantidad de electrodomesticos: ");
                int electrodomesticos = in.nextInt();
                EnergiaElectrica energia = new EnergiaElectrica(numero,fecha,ingresos,cantIntegrantes,region,nombre,apellido,CUIT,NIS,electrodomesticos);
                solicitud[i] = energia;
            }
        }
        for (int i=0;i<5;i++){
            System.out.println(solicitud[i].toString());
        }
    }
}
