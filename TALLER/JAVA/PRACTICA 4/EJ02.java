/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author USUARIO
 */
public class EJ02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Jugador jugador = new Jugador(GeneradorAleatorio.generarInt(100),
        GeneradorAleatorio.generarInt(100),
        GeneradorAleatorio.generarString(30),
        GeneradorAleatorio.generarDouble(10000)+2000,
        GeneradorAleatorio.generarInt(30)
        );
        System.out.println(jugador);
        Entrenador entrenador = new Entrenador(GeneradorAleatorio.generarInt(50),
        GeneradorAleatorio.generarString(30),
        GeneradorAleatorio.generarDouble(10000)+2000,
        GeneradorAleatorio.generarInt(30)
        );
        System.out.println(entrenador);
    }
}
