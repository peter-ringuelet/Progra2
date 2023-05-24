import java.util.Scanner;
public class main
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        System.out.print("Nombre: ");
        String nombre = in.next();
        System.out.print("Sueldo minimo: ");
        double sueldo = in.nextDouble();
        System.out.println("Campeonatos ganados: ");
        int ganados = in.nextInt();
        Entrenador e = new Entrenador(nombre,sueldo,ganados);
        System.out.println(e.toString());
        System.out.println("Su sueldo sera de: $" + e.calcularSueldoACobrar());
    }
}
