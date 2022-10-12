/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ04;

/**
 *
 * @author frank
 */
public class c {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Director d = new Director("Francisco Franco",38231211,27,10);
        coroSemicircular c1 = new coroSemicircular("Robertito", 4, d);
        coroPorHileras c2 = new coroPorHileras("Gustavito",2, d);
        Corista c = new Corista("x", 1, 1, 2);
        c2.agregarCorista(c);
        c = new Corista("y", 2, 1, 2);
        c2.agregarCorista(c);
        c = new Corista("z", 3, 1, 1);
        c2.agregarCorista(c);
        c = new Corista("w", 4, 1, 1);
        c2.agregarCorista(c);
        c = new Corista("x", 1, 1, 1);
        c1.agregarCorista(c);
        c = new Corista("y", 2, 1, 1);
        c1.agregarCorista(c);
        c = new Corista("z", 3, 1, 1);
        c1.agregarCorista(c);
        c = new Corista("w", 4, 1, 1);
        c1.agregarCorista(c);
        System.out.println(c1.toString());
        System.out.println(c2.toString());
        System.out.println(c2.bienOrdenado());
        System.out.println(c1.bienOrdenado());
    }
}
