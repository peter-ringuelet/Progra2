public class Playero{
    private int DNI;
    private String nombre;
    private String apellido;
    
    public Playero(){}
    public Playero(int DNI, String nombre, String apellido){
        this.DNI = DNI;
        this.nombre = nombre;
        this.apellido = apellido;
    }
    public void setDNI(int DNI){
        this.DNI = DNI;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setApellido(String apellido){
        this.apellido = apellido;
    }
    public int getDNI(){
        return this.DNI;
    }
    public String getNombre(){
        return this.nombre;
    }
    public String getApellido(){
        return this.apellido;
    }
}