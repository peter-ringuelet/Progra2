import java.util.Scanner; // Importar funcionalidad para entrada
public class Ejercicio1 
{
  public static void main(String[] args)
  {
    Scanner in = new Scanner(System.in);  // Declarar el scanner e indicar que se leerá desde teclado
    double a,b,c;
    boolean exito;
    System.out.print("Lado a: ");
    a = in.nextDouble();
    System.out.print("Lado b: ");
    b = in.nextDouble();
    System.out.print("Lado c: ");
    c = in.nextDouble();
    if ((a<b+c)&&(b<a+c)&&(c<a+b))
        exito=true;
    else
        exito=false;
    System.out.println(exito);   
        

    in.close();   // Cerrar el scanner
  }
}