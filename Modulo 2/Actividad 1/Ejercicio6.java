import java.util.Scanner;
public class Ejercicio6
{
    public static void main (String [] args)
    {
        Scanner in = new Scanner (System.in);
        int [][] matriz = new int[10][10];
        int i,j, num, tot;
        num = -2;
        //Carga la matriz con numeros pares 
        for (i=0;i<=9;i++)
        {
            for (j=0;j<=9;j++)
            {
                num=num+2;
                matriz[i][j]=num;   
            }
        }
        //Imprime la matriz
         for (i=0;i<=9;i++)
        {
            for (j=0;j<=9;j++)
            {
                System.out.print(matriz[i][j]+ " ");
            }
            System.out.println(" ");
        }
        //Imprime la suma de los elementos entre las filas 2 a 9 y entre las columnas 0 a 3
        tot = 0;
        for (i=2;i<=9;i++)
        {
            for (j=0;j<=9;j++)
            {
                tot=tot+matriz[i][j];
            }
        }
        System.out.println("La suma de los elemntos entre las filas 2 a 9 es: " + tot);
        tot=0;
        for (i=0;i<=9;i++)
        {
            for (j=0;j<=3;j++)
            {
                tot=tot+matriz[i][j];
            }
        }
        System.out.println("La suma de los elemntos entre las columnas 0 a 3 es: " + tot);
        int [] vector = new int[10];
        for (j=0;j<=9;j++)
        {
            tot = 0;
            for (i=0;i<=9;i++)
            {
                tot=tot+matriz[i][j];
            }
            vector[j]=tot;
        }
        //Imprime el vector
        for (i=0;i<=9;i++)
        {
            System.out.print(vector[i] + " ");
        }
        System.out.println(" ");
        i=0;
        boolean encontre = false;
        System.out.print("Numero a buscar: ");
        int numero = in.nextInt();
        while ((i != 10) && (encontre == false))
        {
            j=0;
            while ((i != 10) && (j != 10) && (encontre == false))
            {
                if (matriz[i][j] == numero) 
                    encontre = true;
                else
                    j++;
            }
            if (!encontre)
                i++;
        }
        if (encontre)
            System.out.println("El numero " + numero + " se encuentra en la fila " + i + " y columna " + j);
        else 
            System.out.println("No se encontro el elemento");
        in.close();
    }
}

