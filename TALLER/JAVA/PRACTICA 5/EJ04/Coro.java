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
public abstract class Coro {
    private Director director;
    private String nombre;
    public Coro(Director director, String nombre) {
        this.director = director;
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public abstract void agregarCorista(Corista c);
    public abstract boolean estaLleno();
    public abstract boolean bienOrdenado();
    @Override
    public String toString() {
        return "Coro "+ this.nombre + " director:" + director +"|";
    }
}
