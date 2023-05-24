public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatosGanados; 
    
    
    public Entrenador(String nombre, double sueldoBasico, int campeonatosGanados){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.campeonatosGanados = campeonatosGanados; 
    }
    
    public Entrenador(){
     
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public String getNombre() {
        return nombre;
    }

    public void setSueldoBasico(int unSueldoBasico) {
        sueldoBasico = unSueldoBasico;
    }

    public void setCampeonatosGanados(int unCampeonatosGanados) {
        campeonatosGanados = unCampeonatosGanados;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi sueldo basico es " + sueldoBasico + " y tengo " + campeonatosGanados + " campeonatos ganados.";
        return aux;
    }
    
    
    public double calcularSueldoACobrar()
    {
        double plus = 0;
        if ((campeonatosGanados >= 1) && (campeonatosGanados <=4))
            plus = 5000;
        
        if ((campeonatosGanados >= 5) && (campeonatosGanados <=10))
            plus = 30000; 
        
        if (campeonatosGanados > 10)
            plus = 50000; 
        
        return (sueldoBasico + plus);
    }
    
}
