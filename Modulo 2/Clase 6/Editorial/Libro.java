public class Libro extends Ejemplar
{
    private String titulo;
    private int capitulos;
    private boolean edicionBolsillo;
    
    public Libro(){}
    public Libro(String titulo, int capitulos, boolean edicionBolsillo, int codigo, int paginas, String resumen, int anio, Responsable responsable, int DNI, String nombre, String apellido)
    {
        super(codigo, paginas, resumen, anio, DNI, nombre, apellido);
        this.titulo=titulo;
        this.capitulos=capitulos;
        this.edicionBolsillo=edicionBolsillo;
    }
    public void setTitulo(String titulo)
    {
        this.titulo=titulo;
    }
    public void setCapitulos(int capitulos)
    {
        this.capitulos=capitulos;
    }
    public void setEdicionBolsillo(boolean edicionBolsillo)
    {
        this.edicionBolsillo=edicionBolsillo;
    }
    public String getTitulo()
    {
        return this.titulo;
    }
    public int getCapitulos()
    {
        return this.capitulos;
    }
    public boolean getEdicionBolsillo()
    {
        return this.edicionBolsillo;
    }
    public String getDatos()
    {
        return(super.getCodigo() + " " + this.titulo + " " + super.getResponsable().getNombre());
    }
    public void publicar()
    {
        String tit;
        super.setAnio(2022);
        if (this.edicionBolsillo)
            {
                tit = this.titulo;
                this.titulo = (titulo+"-De Bolsillo");
            }
            
    }
}