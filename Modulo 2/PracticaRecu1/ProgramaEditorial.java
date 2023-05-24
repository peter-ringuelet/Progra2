import java.util.Scanner;
public class ProgramaEditorial{
    public static void main(){
        Scanner in = new Scanner(System.in);
        Ejemplar [] ejemplares = new Ejemplar[2];
        for (int i=0; i<=1; i++){
            System.out.print("Ingrese el codigo del ejemplar: ");
            int codigo = in.nextInt();
            System.out.print("Ingrese la cantidad de paginas del ejemplar: ");
            int paginas = in.nextInt();
            System.out.print("Ingrese el resumen del ejemplar: ");
            String resumen = in.next();
            System.out.print("Ingrese el anio del ejemplar: ");
            int anio = in.nextInt();
            System.out.print("Ingrese el DNI del responsable del ejemplar: ");
            int DNI = in.nextInt();
            System.out.print("Ingrese el nombre del responsable del ejemplar: ");
            String nombre = in.next();
            System.out.print("Ingrese el apellido del responsable del ejemplar: ");
            String apellido = in.next();
            System.out.print("El ejemplar es Libro o Revista: ");
            String tipo = in.next();
            Responsable responsable = new Responsable(DNI,nombre,apellido);
            if (tipo.equals("Libro")){
                System.out.print("Ingrese el titulo del libro: ");
                String titulo = in.next();
                System.out.print("Ingrese la cantidad de capitulos del libro: ");
                int capitulos = in.nextInt();
                System.out.print("Ingrese si el libro es de bolsillo (True) o no (False): ");
                boolean bolsillo = in.nextBoolean();
                Libro libro = new Libro(codigo,paginas,resumen,anio,responsable,titulo,capitulos,bolsillo);
                ejemplares[i] = libro;
            }
            if (tipo.equals("Revista")){
                System.out.print("Ingrese el nombre de la revista: ");
                String nombreR = in.next();
                System.out.print("Ingrese el numero de volumen de la revista: ");
                int volumen = in.nextInt();
                System.out.print("Ingrese la cantidad de articulos de la revista");
                int articulos = in.nextInt();
                Revista revista = new Revista(codigo,paginas,resumen,anio,responsable,nombreR,volumen,articulos);
                ejemplares[i] = revista;
            }
            System.out.println("");
        }
        for (int i=0;i<=1;i++){
            System.out.println(ejemplares[i].toString());
        }
        for (int i=0;i<=1;i++){
            ejemplares[i].publicar();
        }
        for (int i=0;i<=1;i++){
            System.out.println(ejemplares[i].toString());
        }
    }
}