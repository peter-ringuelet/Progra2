public class Entrenador extends Empleado
{
    private int campeonatosGanados;
    
    public Entrenador()
    {
    }
    
    public Entrenador(String nombre, int DNI, int edad, double sueldo, int campeonatos)
    {
        super(nombre, DNI, edad, sueldo);
        this.setCampeonatosGanados(campeonatos);
    }
    
    public void setCampeonatosGanados(int campeonatos)
    {
        this.campeonatosGanados = campeonatos;
    }
    
    public int getCampeonatosGanados()
    {
        return this.campeonatosGanados;
    }
    
    public double calcularSueldoACobrar()
    {
        double sueldo = super.getSueldoBasico();
        if((this.getCampeonatosGanados() >= 1) && (this.getCampeonatosGanados() <= 4))
            sueldo = (sueldo + 5000);
        if ((this.getCampeonatosGanados() >= 5) && (this.getCampeonatosGanados() <= 10))
            sueldo = (sueldo + 30000); 
        if (this.getCampeonatosGanados() > 10)
            sueldo = (sueldo + 50000); 
        return sueldo;
    }
    public String toString()
    {
        return (super.getNombre() + " " + super.getSueldoBasico()+ " " + this.getCampeonatosGanados());
    }
}