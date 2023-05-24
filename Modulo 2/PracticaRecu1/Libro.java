public class Libro extends Ejemplar{
    private String titulo;
    private int capitulos;
    private boolean bolsillo;
    
    public Libro(){}
    public Libro(int codigo, int paginas, String resumen, int anio, Responsable responsable, String titulo, int capitulos, boolean bolsillo){
        super(codigo,paginas,resumen,anio,responsable);
        this.titulo = titulo;
        this.capitulos = capitulos;
        this.bolsillo = bolsillo;
    }
    public void setTitulo(String titulo){
        this.titulo = titulo;    
    }
    public void setCapitulos(int capitulos){
        this.capitulos = capitulos;
    }
    public void setBolsillo(boolean bolsillo){
        this.bolsillo = bolsillo;
    }
    public String getTitulo(){
        return this.titulo;
    }
    public int getCapitulos(){
        return this.capitulos;
    }
    public boolean getBolsillo(){
        return this.bolsillo;
    }
    
    public String toString(){
        return (super.getCodigo() + this.titulo + this.capitulos + this.bolsillo);
    }
    public void publicar(){
        super.setAnio(2022);
        if (this.bolsillo)
            this.setTitulo(this.getTitulo() + " - De Bolsillo");
    }
}