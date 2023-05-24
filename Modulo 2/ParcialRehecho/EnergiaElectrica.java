public class EnergiaElectrica extends Solicitud
{
    private int NIS;
    private int electrodomesticos;
    
    public EnergiaElectrica(){}
    public EnergiaElectrica(String numero, String fecha, double ingresos, int cantIntegrantes, String region, String nombre, String apellido, int CUIT, int NIS, int electrodomesticos)
    {
        super(numero, fecha, ingresos, cantIntegrantes, region, nombre, apellido, CUIT);
        this.NIS = NIS;
        this.electrodomesticos = electrodomesticos;
    }
    public void setNIS(int NIS)
    {
        this.NIS = NIS;
    }
    public void setElectrodomesticos(int electrodomesticos)
    {
        this.electrodomesticos = electrodomesticos;
    }
    public int getNIS()
    {
        return this.NIS;
    }
    public int getElectrodomesticos()
    {
        return this.electrodomesticos; 
    }
    public double calcularGasto()
    {
        double gasto = 0;
                if (super.getIngresos() > 300000)
        {
            gasto = (500 * this.electrodomesticos) ;
        }
        if ((super.getIngresos() <= 300000) && (super.getIngresos() >= 150000))
        {
            gasto = ((100 * (this.electrodomesticos / 2)) + (super.getIngresos() * 0.02));  
        }
        if (super.getIngresos() < 150000)
        {
            gasto = ((super.getIngresos() * 1.5) + 400); 
        }
        return gasto;
    }
    public boolean puedeSubsidiarse()
    {
        double calculo = (super.getIngresos() / super.getCantIntegrantes());
        double porcentajeSueldo = (super.getIngresos() * 0.45);
        boolean ok;
        if (TarifasNacionalesPorRegion.puedeAccederAlSubsidio(super.getIngresos(), super.getRegion()))
        {
            if (calculo > porcentajeSueldo)
                ok = false;
            else
                ok = true;
        
        }
        else
            ok = false;
        return ok;
    }
    public String toString(){
        return (super.getNumero() + super.getFecha() + super.getIngresos() + super.getCantIntegrantes() + super.getRegion() + super.getPersona().toString() + this.getNIS() + this.getElectrodomesticos() + this.puedeSubsidiarse() + this.tarifa());
    }
    public double tarifa(){
        double tarifa;
        if (this.puedeSubsidiarse())
            tarifa = this.calcularGasto();
        else
            tarifa = super.getIngresos() * 0.05;
        return tarifa;
    }
}