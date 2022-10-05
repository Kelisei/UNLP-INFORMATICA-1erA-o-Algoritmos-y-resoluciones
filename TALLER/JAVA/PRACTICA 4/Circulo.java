package tema4;
public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    public double getRadio() {
        return radio;
    }
    public double calcularPerimetro(){
        return 2*Math.PI*radio;
    }
    public double calcularArea(){
        return Math.PI*Math.pow(radio, 2);
    }

    @Override
    public String toString() {
        return "Circulo{" + "radio=" + radio + " "+ super.toString()+'}';
    }
    
}