import java.util.Scanner;
public class main
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        Balanza b = new Balanza();
        b.iniciarCompra();
        System.out.print("Peso: ");
        double peso = in.nextDouble();
        double precio;
        while (peso != 0)
        {
            System.out.print("Precio por Kg: ");
            precio = in.nextDouble();
            b.registrarProducto(peso,precio);
            System.out.print("Peso: ");
            peso = in.nextDouble();
        }
        System.out.println(b.devolverResumenDeCompra());
    }
}