import java.util.Scanner;
public class Prueba1
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner (System.in);
        double [] vTrucho = new double[28];
        double [] vPosta = new double[28];
        double [] vPorcentaje = new double[28];
        int i;
        double tot, num, porcentaje;
        //Cargar precios truchos
        for (i=0;i<=27;i++)
        {
            System.out.print("Precio Trucho: ");
            num = in.nextDouble();
            vTrucho[i] = num;
        }
        //Cargar precios posta
        for (i=0;i<=27;i++)
        {
            System.out.print("Precio Posta: ");
            num = in.nextDouble();
            vPosta[i] = num;
        }
        //Cargar vector porcentajes
        for (i=0;i<=27;i++)
        {
            tot = ((vTrucho[i] * 100) / vPosta[i]);
            vPorcentaje[i] = tot;
        }
        //Imprime porcentaje
        for (i=0;i<=27;i++)
        {
            System.out.println("Porcentaje al que se vendio el " + (i+1) + ": %" + vPorcentaje[i]);
        }
        //Imprime el porcentaje total
        tot = 0;
        for (i=0;i<=27;i++)
        {
            tot = tot + vPorcentaje[i];
        }
        porcentaje = tot/28;
        System.out.println("El porcentaje total al que se vendio es de: %" + porcentaje );
    }
}