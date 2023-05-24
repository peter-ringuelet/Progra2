public class Flota
{
    private Micro [] Micros;
    private int cant;
    
    public Flota()
    {
    }
    
    public void inicializar ()
    {
        this.Micros = new Micro [15];
        int i;
        for (i=0;i<=14;i++)
            this.Micros[i] = null;
        this.cant = 0;
    }
    
    public void setMicro(Micro micro)
    {
        this.Micros[cant] = micro;
        this.cant++;
    }
    
    public int getCant()
    {
        return this.cant;
    }
    
    public Micro[] getMicros()
    {
        return this.Micros;
    }
    
    public boolean flotaCompleta()
    {
        if (this.cant == 15)
            return true;
        else
            return false;
    }
    
    public void agregarMicro (Micro m)
    {
        this.Micros[this.cant] = m;
        this.cant++;
    }
    
    public void eliminarMicro (int pos)
    {
        int i;
        for (i=pos;i<=(this.cant -2);i++)
            Micros[i] = Micros[i + 1];
        this.cant--;  
    }
    
    public int buscarPatente (String patente)
    {
        int i =0;
        boolean encontre = false;
        while((!encontre)&&(i<=14))
        {
            if (this.Micros[i].getPatente().equals(patente))
                encontre = true;
            i++;
        }
        if (encontre)
            return (i-1);
        else
            return -1;
    }
    
    public Micro buscarDestino (String destino)
    {
        int i =0;
        boolean encontre = false;
        while((!encontre)&&(i<=14))
        {
            if (this.Micros[i].getDestino().equals(destino))
                encontre = true;
            i++;
        }
        if (encontre)
            return Micros[i-1];
        else
            return null;
    }
}