public class Triangulo
{
    private double lado1, lado2, lado3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulo ()
    {}
    
    public void setLado1 (double lado)
    {
        lado1 = lado;
    }
    
    public void setLado2 (double lado)
    {
        lado2 = lado;
    }
    
    public void setLado3 (double lado)
    {
        lado3 = lado;
    }
    
    public void setColorRelleno (String color)
    {
        colorRelleno = color;
    }
    
    public void cargarTriangulo (double lado1, double lado2, double lado3, String colorRelleno, String colorLinea)
    {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public void setColorLinea (String color)
    {
        colorLinea = color;
    }
    
    public double getLado1()
    {
        return lado1;
    }
    
    public double getLado2()
    {
        return lado2;
    }
    
    public double getLado3()
    {
        return lado3;
    }
    
    public double calcularArea()
    {
        double s = (lado1+lado2+lado3)/2;
        return Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
    }
    
    public double calcularPerimetro()
    {
        return (lado1 + lado2 + lado3);
    }
    
}