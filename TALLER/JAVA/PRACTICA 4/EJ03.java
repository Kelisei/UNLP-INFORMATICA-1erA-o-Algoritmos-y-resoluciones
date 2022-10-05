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
public class EJ03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Persona persona = new Persona(GeneradorAleatorio.generarString(10), 
            GeneradorAleatorio.generarInt(1000000),
            GeneradorAleatorio.generarInt(90)+10
        );
        System.out.println(persona);
        Trabajador trabajador = new Trabajador(GeneradorAleatorio.generarString(10),
            GeneradorAleatorio.generarString(10), 
            GeneradorAleatorio.generarInt(1000000),
            GeneradorAleatorio.generarInt(90)+10
        );
        System.out.println(trabajador);
    }
    
}
