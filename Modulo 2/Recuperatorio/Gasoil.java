public class Gasoil extends Surtidor{
    private String [] patentes;
    private int cantPatentes;
    
    public Gasoil(){
        this.patentes = new String[20];
        this.cantPatentes = 0;
        for(int i=0;i<20;i++)
            this.patentes[i] = "vacio";        
    }
    public Gasoil(int numero, double importeTot, Playero playero){
        super(numero,importeTot,playero);
        this.patentes = new String[20];
        this.cantPatentes = 0;
        for(int i=0;i<20;i++)
            this.patentes[i] = "vacio";        
    }
    public void setPatente(String [] patentes){
        this.patentes = patentes;
    }
    public void setCantPatentes(int cantPatentes){
        this.cantPatentes = cantPatentes;
    }
    public String [] getPatentes(){
        return this.patentes;
    }
    public int getCantPatentes(){
        return this.cantPatentes;
    }
    public void cargarPatente(String patente){
        if(cantPatentes < 20){
            this.patentes[cantPatentes] = patente;
            this.cantPatentes++;
        }
    }
    public double calcularImpuestos(){
        double impuesto = 0;
        if (cantPatentes <= 5)
            impuesto = (super.getImporteTot() * 0.05);
        if (cantPatentes > 5 && cantPatentes <= 15)
            impuesto = (super.getImporteTot() * 0.03);
        if (cantPatentes > 15)
            impuesto = (super.getImporteTot() * 0.015);
        return impuesto;
    }
    public String toString(){
        String playero = (super.getPlayero().getDNI() + " " + super.getPlayero().getNombre() + " " + super.getPlayero().getApellido());
        String surtidor = (super.getNumero() + " " + super.getImporteTot() + " " + playero);
        String patentes = " ";
        for(int i=0;i<this.cantPatentes;i++)
            patentes = patentes + " " + this.patentes[i];
        return(surtidor + " " + patentes + " " + this.calcularImpuestos());
    }
}