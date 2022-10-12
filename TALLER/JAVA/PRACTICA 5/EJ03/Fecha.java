/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ03;

/**
 *
 * @author frank
 */
public class Fecha {
    private String nombre;
    private int dia;

    public Fecha(String nombre, int dia) {
        this.nombre = nombre;
        this.dia = dia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public String toString() {
        return "Fecha en ciudad:" + nombre + ", dia:" + dia;
    }
    
}
