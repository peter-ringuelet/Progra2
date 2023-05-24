import java.util.Scanner;
public class puntoB
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        Triangulo t = new Triangulo();
        System.out.println("Lado 1: ");
        double lado1 = in.nextDouble();
        System.out.println("Lado 2: ");
        double lado2 = in.nextDouble();
        System.out.println("Lado 3: ");
        double lado3 = in.nextDouble();
        
        System.out.println("Color relleno: ");
        String colorRelleno = in.next();
        System.out.println("Color linea: ");
        String colorLinea = in.next();
        
        t.cargarTriangulo(lado1,lado2,lado3,colorRelleno,colorLinea);
        
        System.out.println("Area: " + t.calcularArea());
        System.out.println("Perimetro: " + t.calcularPerimetro());
        
        
    }
}