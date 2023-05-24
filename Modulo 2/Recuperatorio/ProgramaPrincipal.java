import java.util.Scanner;
public class ProgramaPrincipal{
    public static void main(String[]args){
        Scanner in = new Scanner(System.in);
        Surtidor [] surtidores = new Surtidor[3];
        System.out.print("Ingrese numero de surtidor: ");
        int numero = in.nextInt();
        System.out.print("Ingrese el importe total que facturo en el dia: ");
        double importeTot = in.nextDouble();
        System.out.println("Datos del playero que lo administro ");
        System.out.print("DNI: ");
        int DNI = in.nextInt();
        System.out.print("Nombre: ");
        String nombre = in.next();
        System.out.print("Apellido: ");
        String apellido = in.next();
        Playero playero = new Playero(DNI,nombre,apellido);
        Gasoil gasoil = new Gasoil(numero,importeTot,playero);
        for (int i=0;i<3;i++){
            System.out.print("Ingrese una patente:");
            String patente = in.next();
            gasoil.cargarPatente(patente);
        }
        surtidores[0] = gasoil;
        
        System.out.print("Ingrese numero de surtidor: ");
        int numero2 = in.nextInt();
        System.out.print("Ingrese el importe total que facturo en el dia: ");
        double importeTot2 = in.nextDouble();
        System.out.println("Datos del playero que lo administro ");
        System.out.print("DNI: ");
        int DNI2 = in.nextInt();
        System.out.print("Nombre: ");
        String nombre2 = in.next();
        System.out.print("Apellido: ");
        String apellido2 = in.next();
        Playero playero2 = new Playero(DNI2,nombre2,apellido2);
        Gasoil gasoil2 = new Gasoil(numero2,importeTot2,playero2);
        for (int i=0;i<8;i++){
            System.out.print("Ingrese una patente:");
            String patente = in.next();
            gasoil2.cargarPatente(patente);
        }
        surtidores[1] = gasoil2;
        
        System.out.print("Ingrese numero de surtidor: ");
        int numero3 = in.nextInt();
        System.out.print("Ingrese el importe total que facturo en el dia: ");
        double importeTot3 = in.nextDouble();
        System.out.println("Datos del playero que lo administro ");
        System.out.print("DNI: ");
        int DNI3 = in.nextInt();
        System.out.print("Nombre: ");
        String nombre3 = in.next();
        System.out.print("Apellido: ");
        String apellido3 = in.next();
        Playero playero3 = new Playero(DNI3,nombre3,apellido3);
        System.out.print("Ingrese la cantidad de litros: ");
        double litros = in.nextDouble();
        Nafta nafta = new Nafta(numero3,importeTot3,playero3,litros);
        surtidores[2] = nafta;
        
        for(int i=0;i<3;i++)
            System.out.println(surtidores[i].toString());
    }
}