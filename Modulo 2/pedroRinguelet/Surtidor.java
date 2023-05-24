public abstract class Surtidor {
    private int numero;
    private double importeTot;
    private Playero playero;
    
    public Surtidor(){}
    public Surtidor(int numero, double importeTot, Playero playero){
        this.numero = numero;
        this.importeTot = importeTot;
        this.playero = playero;
    }
    public void setNumero(int numero){
        this.numero = numero;
    }
    public void setImporteTot(double importeTot){
        this.importeTot = importeTot;
    }
    public void setPlayero(Playero playero){
        this.playero = playero;
    }
    public int getNumero(){
        return this.numero;
    }
    public double getImporteTot(){
        return this.importeTot;
    }
    public Playero getPlayero(){
        return this.playero;
    }
    public abstract double calcularImpuestos();
    public abstract String toString();
}