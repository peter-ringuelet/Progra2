public class Revista extends Ejemplar{
    private String nombre;
    private int volumen;
    private int articulos;
    
    public Revista(){}
    public Revista(int codigo, int paginas, String resumen, int anio, Responsable responsable, String nombre, int volumen, int articulos){
        super(codigo,paginas,resumen,anio,responsable);
        this.nombre = nombre;
        this.volumen = volumen;
        this.articulos = articulos;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setVolumen(int volumen){
        this.volumen = volumen;
    }
    public void setArticulos(int articulos){
        this.articulos = articulos;
    }
    public String getNombre(){
        return this.nombre;
    }
    public int getVolumen(){
        return this.volumen;
    }
    public int getArticulos(){
        return this.articulos;
    }
    
    public String toString (){
        return(this.nombre + this.volumen);
    }
    public void publicar(){
        super.setAnio(2022);
        this.setVolumen(Generador.getNroVolumen());
    }
}