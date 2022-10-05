package tema4;
import PaqueteLectura.GeneradorAleatorio;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USUARIO
 */
public class EJ01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Triangulo triangulo = new Triangulo(GeneradorAleatorio.generarDouble(4),GeneradorAleatorio.generarDouble(4), GeneradorAleatorio.generarDouble(4), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarString(4));
        System.out.println(triangulo);
        Circulo circulo = new Circulo(GeneradorAleatorio.generarDouble(4), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarString(4));
        System.out.println(circulo);
        circulo.despintar();
        triangulo.despintar();
        System.out.println(circulo);
        System.out.println(triangulo);
    }
}
