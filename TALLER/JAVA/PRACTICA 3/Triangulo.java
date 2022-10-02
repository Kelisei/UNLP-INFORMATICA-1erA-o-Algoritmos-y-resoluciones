/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author frank
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    //Constructors
    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    public Triangulo() {
    }
    //Getters
    public String getColorLinea() {
        return colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }
    //Setters
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    //Customs
    public double calcularPerimetro(){
        return (this.lado1+this.lado2+this.lado3);
    }
    public double calcularArea(){
        double S = (calcularPerimetro()/2);
        return Math.sqrt(S*(S-this.lado1)*(S-this.lado2)*(S-this.lado3));
    }
}
