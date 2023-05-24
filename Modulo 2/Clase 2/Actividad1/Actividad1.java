import java.util.Scanner;
public class Actividad1
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner (System.in);
        Persona p = new Persona();
        System.out.println("Nombre: ");
        String nombre = in.nextLine();
        p.setNombre(nombre);
        System.out.println("Dni: ");
        int dni = in.nextInt();
        p.setDNI(dni);
        System.out.println("Edad: ");
        int edad = in.nextInt();
        p.setEdad(edad);
        System.out.println(p.toString());
        
        
    }
}