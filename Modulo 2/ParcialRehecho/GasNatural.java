public class GasNatural extends Solicitud
{
    private int medidor;
    private double tamanio;
    private int calefactores;
    
    public GasNatural(){}
    public GasNatural(String numero, String fecha, double ingresos, int cantIntegrantes, String region, String nombre, String apellido, int CUIT, int medidor, double tamanio, int calefactores){
        super(numero, fecha, ingresos, cantIntegrantes, region, nombre, apellido, CUIT);
        this.medidor = medidor;
        this.tamanio = tamanio;
        this.calefactores = calefactores;
    }
    public void setMedidor(int medidor)
    {
        this.medidor = medidor;
    }
    public void setTamanio(double tamanio)
    {
        this.tamanio = tamanio;
    }
    public void setCalefactores(int calefactores)
    {
        this.calefactores = calefactores;
    }
    public int getMedidor()
    {
        return this.medidor;
    }
    public double getTamanio()
    {
        return this.tamanio;
    }
    public int getCalefactores()
    {
        return this.calefactores;
    }
    public double calcularGasto()
    {
        double gasto = 0;
        if (super.getIngresos() > 300000)
        {
            gasto = ((250*(this.tamanio / 2)) + (750 * this.calefactores));
        }
        if ((super.getIngresos() <= 300000) && (super.getIngresos() >= 150000))
        {
            gasto = ((100 * (this.tamanio / 3)) + (500 * this.calefactores));  
        }
        if (super.getIngresos() < 150000)
        {
            gasto = ((super.getIngresos() * 0.02) + 1000); 
        }
        
        return gasto;
    }
    public boolean puedeSubsidiarse()
    {
        boolean ok;
        double calculo = (super.getIngresos() / (super.getCantIntegrantes() + this.calefactores));
        double porcentajeSueldo = (super.getIngresos() * 0.4);
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
        return (super.getNumero() + super.getFecha() + super.getIngresos() + super.getCantIntegrantes() + super.getRegion() + super.getPersona().toString() + this.getMedidor() + this.getTamanio() + this.getCalefactores() + this.puedeSubsidiarse() + this.tarifa());
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