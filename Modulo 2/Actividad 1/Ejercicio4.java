public class Ejercicio4
{
    public static void main (String [] args)
    {
        int i, N, factorial;
        for (i=9; i>=1; i=i-2)
        {
            N = i;
            factorial = 1;
            while (N != 0)
            {
                factorial = factorial * N;
                N--;
            }
            System.out.println("El factorial es: " + factorial);
        }
    }
}
