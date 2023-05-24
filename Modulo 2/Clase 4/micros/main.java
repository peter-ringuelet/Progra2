import java.util.Scanner;
public class main
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        Micro m = new Micro();
        m.cargarMicro("ABC123", "Mar del Plata", 5);
        int num ;
        int asientoLibre;
        System.out.print("Asiento: ");
        num = in.nextInt();
        if (m.asientoValido(num))
        {   
            if (m.estadoAsiento(num) == "Libre")
            {   
                m.ocuparAsiento(num);
                System.out.println("Se ha ocupado el asiento con exito.");
            }
            else
            {
                System.out.println("El asiento se encuentra ocupado.");
                asientoLibre = m.primerAsientoLibre();
                if (asientoLibre != -1)
                    System.out.println("El proximo aiento libre es el: " + asientoLibre);
                else
                    System.out.println("El micro se encuentra todo ocupado");
            }  
        }    
        while ((num != -1) && (!m.microLleno()))
        {    System.out.print("Asiento: ");
            num = in.nextInt();
            if (m.asientoValido(num))
            {   
                if (m.estadoAsiento(num) == "Libre")
                {   
                    m.ocuparAsiento(num);
                    System.out.println("Se ha ocupado el asiento con exito.");
                }
                else
                {
                    System.out.println("El asiento se encuentra ocupado.");
                    asientoLibre = m.primerAsientoLibre();
                    if (asientoLibre != -1)
                        System.out.println("El proximo aiento libre es el: " + asientoLibre);
                    else
                        System.out.println("El micro se encuentra todo ocupado");
                }  
            }   
        }
        System.out.println("La cantidad de asientos ocupados es: " + m.getAsientosOcupados());
    }
}