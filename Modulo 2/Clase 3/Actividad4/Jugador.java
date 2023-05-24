public class Jugador {
    private String nombre;
    private int DNI;
    private int edad;
    private int partidos;
    private int goles;
    
    public Jugador(String unNombre, int unDNI, int unaEdad, int unPartidos, int unGoles){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
        partidos = unPartidos;
        goles = unGoles;
    }
    
    public Jugador(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }
    
    public int getPartidos() {
        return partidos;
    }
    
    public int getGoles() {
        return goles;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public void setPartidos(int unPartidos) {
        partidos = unPartidos;
    }
    
    public void setGoles(int unGoles) {
        goles = unGoles;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
    
    
    
    
}
