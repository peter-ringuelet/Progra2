public abstract class Solicitud
{
    private String numero;
    private String fecha;
    private double ingresos;
    private int cantIntegrantes;
    private String region;
    private Persona persona;
    
    public Solicitud(){}
    public Solicitud(String numero, String fecha, double ingresos, int cantIntegrantes, String region, String nombre, String apellido, int CUIT)
    {
        this.numero = numero;
        this.fecha = fecha;
        this.ingresos = ingresos;
        this.cantIntegrantes = cantIntegrantes;
        this.region = region;
        this.persona =  new Persona(nombre, apellido, CUIT);
    }
    public void setNumero(String numero)
    {
        this.numero = numero;
    }
    public void setFeha(String fecha)
    {
        this.fecha = fecha;
    }
    public void setIngresos(double ingresos)
    {
        this.ingresos = ingresos;
    }
    public void setCantIntegrantes(int cantIntegrantes)
    {
        this.cantIntegrantes = cantIntegrantes;
    }
    public void setRegion(String region)
    {
        this.region = region;
    }
    public void setPersona(String nombre, String apellido, int CUIT)
    {
        this.persona = new Persona(nombre, apellido, CUIT);
    }
    public String getNumero()
    {
        return this.numero;
    }
    public String getFecha()
    {
        return this.fecha;
    }
    public double getIngresos()
    {
        return this.ingresos;
    }
    public int getCantIntegrantes()
    {
        return this.cantIntegrantes;
    }
    public String getRegion()
    {
        return this.region;
    }
    public Persona getPersona()
    {
        return this.persona;
    }
    public abstract double calcularGasto();
    public abstract boolean puedeSubsidiarse();
    public abstract double tarifa();
    public abstract String toString();
}