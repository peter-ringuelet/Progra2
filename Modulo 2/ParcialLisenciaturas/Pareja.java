public class Pareja{
    private Participante participante1;
    private Participante participante2;
    private String estilo;
    
    public Pareja(){}
    public Pareja(Participante participante1, Participante participante2, String estilo){
        this.participante1 = participante1;
        this.participante2 = participante2;
        this.estilo = estilo;
    }
    public void setParticipante1(Participante participante1){
        this.participante1 = participante1;
    }
    public void setParticipante2(Participante participante2){
        this.participante2 = participante2;
    }
    public void setEstilo(String estilo){
        this.estilo = estilo;
    }
    public Participante getParticipante1(){
        return this.participante1;
    }
    public Participante getParticipante2(){
        return this.participante2;
    }
    public String getEstilo(){
        return this.estilo;
    }
}