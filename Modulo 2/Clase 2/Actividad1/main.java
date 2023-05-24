public class main
{
    public static int mayores65(Persona [] v)
    {
        int i;
        int cant = 0;
        for (i=0;i<=3;i++)
        {
           if (v[i].getEdad() >= 65)
               cant++;  
        }
        return cant;
    }
    
    public static String menorDni(Persona[]v)
    {
        int i;
        int minimo = 100;
        Persona p = new Persona();
        for (i=0;i<=3;i++)
        {
            if(v[i].getDNI() < minimo)
            {
                minimo = v[i].getDNI();
                p = v[i];
            }
        }
        return p.toString();
    }
}