public class Revista extends Ejemplar
{
    private String nombre;
    private int volumen;
    private int articulos;
    
    public Revista(){}
    public Revista(String nombreRevista, int volumen, int articulos, int codigo, int paginas, String resumen, int anio, Responsable responsable, int DNI, String nombre, String apellido)
    {
        super(codigo, paginas, resumen, anio, DNI, nombre, apellido);
        this.nombre=nombreRevista;
        this.volumen=volumen;
        this.articulos=articulos;
    }
    public void setTitulo(String nombre)
    {
        this.nombre=nombre;
    }
    public void setCapitulos(int volumen)
    {
        this.volumen=volumen;
    }
    public void setArticuloss(int articulos)
    {
        this.articulos=articulos;
    }
    public String getNombre()
    {
        return this.nombre;
    }
    public int getVolumen()
    {
        return this.volumen;
    }
    public String getDatos()
    {
        return(this.nombre + " " + this.volumen);
    }
    public void publicar()
    {
        String tit;
        Generador g = new Generador();
        super.setAnio(2022);
        this.volumen = g.getNroVolumen();  
    }
}