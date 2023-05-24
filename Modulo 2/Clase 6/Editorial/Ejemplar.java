public abstract class Ejemplar
{
    private int codigo;
    private int paginas;
    private String resumen;
    private int anio;
    private Responsable responsable ;
    
    public Ejemplar(){}
    public Ejemplar(int codigo, int paginas, String resumen, int anio, int DNI, String nombre, String apellido)
    {
        this.codigo=codigo;
        this.paginas=paginas;
        this.resumen=resumen;
        this.anio=anio;
        this.responsable = new Responsable(DNI, nombre, apellido);
    }
    public void setCodigo(int codigo)
    {
        this.codigo=codigo;
    }
    public void setPaginas(int paginas)
    {
        this.paginas=paginas;
    }
    public void setResumen(String resumen)
    {
        this.resumen=resumen;
    }
    public void setAnio(int anio)
    {
        this.anio=anio;
    }
    public void setResponsable(int DNI, String nombre, String apellido)
    {
        this.responsable = new Responsable(DNI, nombre, apellido);
    }
    public int getCodigo()
    {
        return this.codigo;
    }
    public int getPaginas()
    {
        return this.paginas;
    }
    public String getResumen()
    {
        return this.resumen;
    }
    public int getAnio()
    {
        return this.anio;
    }
    public Responsable getResponsable()
    {
        return this.responsable;
    }
    public abstract String getDatos();
    public abstract void publicar();
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}