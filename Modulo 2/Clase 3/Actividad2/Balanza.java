public class Balanza
{
    private double monto;
    private int items;
    
    public Balanza()
    {}
    
    public void iniciarCompra()
    {
        monto = 0;
        items = 0;
    }
    
    public void registrarProducto(double pesoEnKg, double precioPorKg)
    {
        monto = (monto + (pesoEnKg * precioPorKg));
        items++;
    }
    
    public double devolverMontoAPagar()
    {
        return monto;
    }
    
    public String devolverResumenDeCompra()
    {
        return ("Total a pagar" + monto + " por la compra de " + items + " productos");
    }
}