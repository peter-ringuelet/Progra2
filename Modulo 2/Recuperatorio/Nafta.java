public class Nafta extends Surtidor{
    private double litros;
    
    public Nafta(){}
    public Nafta(int numero, double importeTot, Playero playero, double litros){
        super(numero,importeTot,playero);
        this.litros = litros;
    }
    public void setLitros(double litros){
        this.litros = litros;
    }
    public double getLitros(){
        return this.litros;
    }
    public double calcularImpuestos(){
        return (0.02 * this.litros);    
    }
    public String toString(){
        String playero = (super.getPlayero().getDNI() + " " + super.getPlayero().getNombre() + " " + super.getPlayero().getApellido());
        String surtidor = (super.getNumero() + " " + super.getImporteTot() + " " + playero);
        return(surtidor + " " + this.litros + " " + this.calcularImpuestos());
    }
}