/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial_1;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author frank
 */
public class Parcial_1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        Torneo t = new Torneo("Libertadores", 12, 8);
        Equipo e1;
        Jugador j;
        for (int i = 0; i < 8; i++) {
            e1 = new Equipo(GeneradorAleatorio.generarInt(20),
            GeneradorAleatorio.generarInt(200),
            GeneradorAleatorio.generarString(12));
            
            for (int z = 0; z < 11; z++) {
                j = new Jugador(GeneradorAleatorio.generarString(3),
                1123123,
                GeneradorAleatorio.generarInt(20)+18,
                GeneradorAleatorio.generarBoolean(),
                /*GeneradorAleatorio.generarBoolean()*/ false,
                GeneradorAleatorio.generarInt(11)
                ); 
                e1.agregarJugador(j);
            }
            t.agregarEquipo(e1);
        }
        System.out.println(t.toString());
    }
}
