/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;
/**
 *
 * @author frank
 */
import PaqueteLectura.GeneradorAleatorio;
public class Parcial2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        GeneradorAleatorio.iniciar();
        ADistancia a1 = new ADistancia("Bom gia", 2022, 30);
        Presencial p1 = new Presencial(12, 2022, 30);
        Alumno a;
        for (int i = 0; i < 30; i++) {
            a = new Alumno(GeneradorAleatorio.generarInt(2)
            , GeneradorAleatorio.generarString(1));
            a1.agregarAlumno(a);
        }
        for (int i = 0; i < 30; i++) {
            a = new Alumno(GeneradorAleatorio.generarInt(2)
            , GeneradorAleatorio.generarString(3));  
            p1.agregarAlumno(a);
        }
        for (int i = 0; i < 4; i++) {
            a1.incrementarAsistencia(1);
            a1.aprobarAutoevalución(1);
        }
        for (int i = 0; i < 4; i++) {
            p1.incrementarAsistencia(1);
        }

        System.out.println(a1.toString());
        System.out.println(p1.toString());
        System.out.println(a1.cantidadDeAlumnosQuePuedenRendir());
        System.out.println(p1.cantidadDeAlumnosQuePuedenRendir());
    }
}
