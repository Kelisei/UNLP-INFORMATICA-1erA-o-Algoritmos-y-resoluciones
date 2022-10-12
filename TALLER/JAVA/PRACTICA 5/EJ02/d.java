/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ02;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author frank
 */
public class d {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Estacionamiento estacionamiento = new Estacionamiento(
        "EL ARMENIO S.A",
        "321, entre 23 y 22",
        "6:00",
        "24:00",
        3,
        3
        );
        Auto A;
        for (int i = 0; i < 6; i++) {
            A = new Auto(
            GeneradorAleatorio.generarString(3), 
            GeneradorAleatorio.generarString(6)
            );
            estacionamiento.agregarAuto(
            A,
            GeneradorAleatorio.generarInt(3),
            GeneradorAleatorio.generarInt(3)
            );
        }
        System.out.println(estacionamiento.toString());
        System.out.println(estacionamiento.getAutosPlaza(1));
        System.out.println(estacionamiento.getAuto(Lector.leerString()));
    }
    
}
