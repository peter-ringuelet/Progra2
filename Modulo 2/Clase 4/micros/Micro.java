public class Micro
{
    private String patente;
    private String destino;
    private int hora;  
    private String [] asientos;
    private int asientosOcupados;
    
    public Micro()
    {
    }
    
    public void setPatente(String patente)
    {
        this.patente = patente;
    }
    
    public void setDestino(String destino)
    {
        this.destino = destino;
    }
    
    public void setHora (int hora)
    {
        this.hora = hora;
    }
    
    public String getPatente ()
    {
        return this.patente;
    }
    
    public String getDestino()
    {
        return this.destino;
    }
    
    public int getHora()
    {
        return this.hora;
    }
    
    public int getAsientosOcupados()
    {
        return this.asientosOcupados;
    }
    
    public void cargarMicro(String patente, String destino, int hora)
    {
        this.asientos = new String [20];
        this.setPatente(patente);
        this.setDestino(destino);
        this.setHora(hora);
        this.asientosOcupados = 0;
        int i;
        for (i=0;i<=19;i++)
            this.asientos[i] = "Libre";
    }
    
    public boolean microLleno ()
    {
        if (this.asientosOcupados == 20)
            return true;
        else 
            return false;
    }
    
    public boolean asientoValido (int asiento)
    {
        if ((asiento <= 20) && (asiento > 0))
            return true;
        else 
            return false;
    }
    
    public String estadoAsiento (int asiento)
    {
        return (this.asientos[asiento - 1]);
    }
    
    public void ocuparAsiento(int asiento)
    {
       this.asientos[asiento -1] = "Ocupado";
       this.asientosOcupados++;
    }
    
    public void liberarAsiento(int asiento)
    {
        this.asientos[asiento -1] = "Libre";
    }
    
    public int primerAsientoLibre()
    {
        int i = 0;
        boolean encontre = false;
        while(!encontre)
        {
            if(this.asientos[i] == "Libre")
                encontre = true;
            i++;
        }
        if (encontre)
            return i;
        else 
            return -1;
    }
}