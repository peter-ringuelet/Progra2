public class Jugador extends Empleado
{
    private int partidosJugados;
    private int golesAnotados;
    
    public Jugador(String nombre, int DNI, int edad, double sueldo, int partidos, int goles)
    {
        super(nombre, DNI, edad, sueldo);
        this.setPartidosJugados(partidos);
        this.setGolesAnotados(goles);
    }
    
    public Jugador()
    {
    }
    
    public void setPartidosJugados(int partidos)
    {
        this.partidosJugados = partidos;
    }
    
    public void setGolesAnotados(int goles)
    {
        this.golesAnotados = goles;
    }
    
    public int getPartidosJugados ()
    {
        return this.partidosJugados;
    }
    
    public int getGolesAnotados()
    {
        return this.golesAnotados;
    }
    
    public double promedioGoles()
    {
        return golesAnotados / partidosJugados;
    }
    public double calcularSueldoACobrar()
    {
        if (this.promedioGoles() > 0.5)
            return super.getSueldoBasico() + super.getSueldoBasico();
        else 
            return super.getSueldoBasico();
    }
    public String toString()
    {
        return (super.getNombre() + " " + super.getSueldoBasico() + " " + this.getPartidosJugados() + " " + this.getGolesAnotados());
    }
}