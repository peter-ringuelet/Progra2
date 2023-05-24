public class Persona
{
    private String nombre;
    private String apellido;
    private int CUIT;
    
    public Persona(String nombre, String apellido, int CUIT){
        this.nombre = nombre;
        this.apellido = apellido;
        this.CUIT = CUIT; 
    }
    
    public Persona(){
     
    }

    public int getCUIT() {
        return this.CUIT;
    }

    public String getApellido() {
        return this.apellido;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setCUIT(int CUIT) {
        this.CUIT = CUIT;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + this.getNombre() + ", mi apellido es " + this.getApellido() + " y mi CUIT es " + this.getCUIT() ;
        return aux;
    }
}