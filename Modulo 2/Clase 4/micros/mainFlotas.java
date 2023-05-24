import java.util.Scanner;
public class mainFlotas
{
    public static void main (String[]args)
    {
        Scanner in = new Scanner(System.in);
        Flota f = new Flota();
        f.inicializar();
        String patente, destino;
        int hora;
        int pos;
        System.out.print("Patente: ");
        patente = in.next();
        if (patente.equals("ZZZ000") == false)
        {
            System.out.print("Destino: ");
            destino = in.next();
            System.out.print("Hora: ");
            hora = in.nextInt();
            Micro m = new Micro();
            m.cargarMicro(patente, destino, hora);
            f.agregarMicro(m);
        }
        while((f.getCant()<15) && (patente.equals("ZZZ000") == false))
        {
            System.out.print("Patente: ");
            patente = in.next();
            if (patente.equals("ZZZ000") == false)
            {
                System.out.print("Destino: ");
                destino = in.next();
                System.out.print("Hora: ");
                hora = in.nextInt();
                Micro m = new Micro();
                m.cargarMicro(patente, destino, hora);
                f.agregarMicro(m);
            }
        }
        System.out.print("Patente a eliminar: ");
        patente = in.next();
        pos = f.buscarPatente(patente);
        if (pos != -1)
        {
            f.eliminarMicro(pos);
            System.out.print("Se ha eliminado con exito.");
        }
        else 
            System.out.println("La patente no se encunetra en la flota.");
        int i;
        for(i=0;i<=f.getCant()-1;i++)
            System.out.println(f.getMicros()[i].getPatente());
        System.out.print("Destino que quiere buscar: ");
        String dest = in.next();
        Micro m = f.buscarDestino(dest);
        if (m!=null)
        {
            System.out.println(m.getPatente());
            System.out.println(m.getHora());
        }
        else 
            System.out.println("No se ha encontrado el destino");
    }
}