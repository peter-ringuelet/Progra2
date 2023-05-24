import java.util.Scanner;
public class Ejercicio3
{
    public static void main (String [] args)
    {
        Scanner in = new Scanner(System.in);
        int N, factorial;
        factorial = 1;
        System.out.print("Escriba un numero al cual le quiera calcular el factorial: ");
        N = in.nextInt();
        while (N != 0)
        {
            factorial = factorial * N;
            N--;
        }
        System.out.println("El factorial es: " + factorial);
        in.close();
    }
}
