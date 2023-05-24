public class Participante{
    private int dni;
    private String nombre;
    private int edad;
    
    public Participante(){}
    public Participante(int dni, String nombre, int edad){
        this.dni = dni;
        this.nombre = nombre;
        this.edad = edad;
    }
    public void setDni (int dni){
        this.dni = dni;
    }
    public void setNombre (String nombre){
        this.nombre = nombre;
    }
    public void setEdad (int edad){
        this.edad = edad;
    }
    public int getDni(){
        return this.dni;
    }
    public String getNombre(){
        return this.nombre;
    }
    public int getEdad(){
        return this.edad;
    }
}