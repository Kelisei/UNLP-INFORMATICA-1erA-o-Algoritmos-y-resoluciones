/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author frank
 */
public class Parcial4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Estanteria e = new Estanteria(5, 3);
        for (int i = 0; i < 7; i++) {
            Libro l = new Libro("Mujercitas", "Borges", 15.8);
            e.almacenarLibro(l);
        }
        System.out.println("");
        Libro l = e.sacarLibro(0, 0);
        System.out.println(l.toString());
        System.out.println(e.calcular("Borges"));
    }
    
}
