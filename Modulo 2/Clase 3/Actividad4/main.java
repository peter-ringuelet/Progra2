import java.util.Scanner;
public class main
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner (System.in);
        //Jugador j = new Jugador();
        Jugador [] vJ = new Jugador[5];
        int i;
        for (i=0;i<=4;i++)
        {
            Jugador j = new Jugador();
            System.out.print("Nombre: ");
            String nombre = in.next();
            j.setNombre(nombre);
            System.out.print("DNI: ");
            int DNI = in.nextInt();
            j.setDNI(DNI);
            System.out.print("Edad: ");
            int edad = in.nextInt();
            j.setEdad(edad);
            System.out.print("Partidos: ");
            int partidos = in.nextInt();
            j.setPartidos(partidos);
            System.out.print("Goles: ");
            int goles = in.nextInt();
            j.setGoles(goles);
            vJ[i] = j;
        }
        System.out.println(cantJugadoresMas100Partidos(vJ));

    }
    public static int cantJugadoresMas100Partidos (Jugador[]v)
    {
        int i, cont;
        cont = 0;
        for (i=0;i<=4;i++)
        {
            if (v[i].getPartidos() > 100)
                cont++;   
        }
        return cont;
    }
}