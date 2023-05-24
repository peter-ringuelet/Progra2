import java.util.Scanner;
public class Ejercicio2
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        int patente, tot, entraron;
        int porcentaje;
        tot = 0;
        entraron = 0;
        System.out.print("Patente: ");
        patente = in.nextInt();
        while (patente != 0)
        {   
            if ((patente%2) == 0)
            {
                System.out.println("Acceso Aprobado");
                entraron++; 
            }
            else 
                System.out.println("Acceso Denegado");
            tot++;
            System.out.print("Patente: ");
            patente = in.nextInt();
        }
        porcentaje =  ((entraron*100)/ tot);
        System.out.print("El porcentaje de autos que entraron es de %" + porcentaje);
        in.close();
    }
}

