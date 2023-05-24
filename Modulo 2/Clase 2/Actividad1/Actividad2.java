import java.util.Scanner;
public class Actividad2
{
    public static void main(String[]args)
    {
        Scanner in = new Scanner (System.in);
        Persona [] vPersonas = new Persona[4];
        int i;
        for (i=0;i<=3;i++)
        {
            Persona p = new Persona();
            System.out.println("Nombre: ");
            String nombre = in.next();
            p.setNombre(nombre);
            System.out.println("Dni: ");
            int dni = in.nextInt();
            p.setDNI(dni);
            System.out.println("Edad: ");
            int edad = in.nextInt();
            p.setEdad(edad);
            vPersonas[i] = p;
        }
        for (i=0;i<=3;i++)
        {
            System.out.println(vPersonas[i].getNombre());
            System.out.println(vPersonas[i].getDNI());
            System.out.println(vPersonas[i].getEdad());
        }
        System.out.println("La cantidad de personas mayores a 65 anos es: " + main.mayores65(vPersonas));
        System.out.println(main.menorDni(vPersonas));
    }
}

