import java.util.Scanner;
public class Ejercicio5
{   
    public static void main (String [] args)
    {
        Scanner in = new Scanner (System.in);
        int [] vAlturas = new int[15];
        int i, altura, tot, prom, cont;
        for (i=0; i<=14; i++)
        {
            System.out.print("Inserte una altura: ");
            altura = in.nextInt();
            vAlturas[i] = altura;
        }
        
        tot = 0;
        for (i=0; i<=14; i++)
        {
            tot = tot + vAlturas[i];  
        }
        prom = tot/15;
        System.out.println("La altura promedio es " + prom);
        
        cont = 0;
        for (i =0; i<= 14; i++)
        {
            if (vAlturas[i] > prom)
                cont++;
        }
        System.out.println("La cantidad de jugadores que superan la edad promedio es: "+ cont);
        in.close();
    }
}