import java.util.Scanner;
public class main
{
    public static void  main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        String nombre;
        int DNI, edad, partidos, goles, campeonatos;
        double sueldo;
        
        //Jugador
        System.out.print("Nombre: ");
        nombre = in.next();
        System.out.print("DNI: ");
        DNI = in.nextInt();
        System.out.print("Edad: ");
        edad = in.nextInt();
        System.out.print("Sueldo: ");
        sueldo = in.nextDouble();
        System.out.print("Partidos: ");
        partidos = in.nextInt();
        System.out.print("Goles: ");
        goles = in.nextInt();
        Jugador j = new Jugador(nombre, DNI, edad, sueldo, partidos, goles);
        System.out.println("Deberia cobrar: $" + j.calcularSueldoACobrar());
        System.out.println("Datos del jugador: " + j.toString());
        
        //Entrenador
        System.out.print("Nombre: ");
        nombre = in.next();
        System.out.print("DNI: ");
        DNI = in.nextInt();
        System.out.print("Edad: ");
        edad = in.nextInt();
        System.out.print("Sueldo: ");
        sueldo = in.nextDouble();
        System.out.print("Campeonatos: ");
        campeonatos = in.nextInt();
        Entrenador e = new Entrenador (nombre, DNI, edad, sueldo, campeonatos);
        System.out.println("Deberia cobrar: $" + e.calcularSueldoACobrar());
                System.out.println("Datos del entrenador: " + e.toString());

    }
}