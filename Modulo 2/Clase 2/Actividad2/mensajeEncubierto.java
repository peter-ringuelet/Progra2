import java.util.Scanner;
public class mensajeEncubierto
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner (System.in);
        String [] palabras = new String [10];
        String pal;
        int i;
        for (i=0;i<=9;i++)
        {
            System.out.print("Ingrese una palabra: ");
            pal = in.next();
            palabras[i] = pal;
        }
        //Descifra el mensaje
        for (i=0;i<=9;i++)
        {
            System.out.print(palabras[i].charAt(0));
        }
        
    }
}