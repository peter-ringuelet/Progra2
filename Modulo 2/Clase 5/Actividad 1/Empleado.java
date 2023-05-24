public abstract class Empleado
{
    private String nombre;
    private int DNI;
    private int edad;
    private double sueldoBasico;
    
    public Empleado()
    {
    }
    
    public Empleado(String nombre, int DNI, int edad, double sueldo)
    {
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(edad);
        this.setSueldoBasico(sueldo);
    }
    
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }
    public void setDNI(int DNI)
    {
        this.DNI = DNI;
    }
    public void setEdad(int edad)
    {
        this.edad = edad;
    }
    public void setSueldoBasico(double sueldoBasico)
    {
        this.sueldoBasico = sueldoBasico;
    }
    public String getNombre()
    {
        return this.nombre;
    }
    public int getDNI()
    {
        return this.DNI;
    }    
    public int getEdad()
    {
        return this.edad;
    }
    public double getSueldoBasico()
    {
        return this.sueldoBasico;
    }
    
    public abstract double calcularSueldoACobrar();
    public abstract String toString();
    
    
}