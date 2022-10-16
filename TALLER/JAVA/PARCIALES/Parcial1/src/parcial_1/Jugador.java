/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial_1;

/**
 *
 * @author frank
 */
public class Jugador {
    private String nombre;
    private long dni;
    private int edad;
    private boolean titular;
    private boolean lesionado;
    private int posicion;

    public Jugador(String nombre, long dni, int edad, boolean titular, boolean lesionado, int posicion) {
        this.setNombre(nombre);
        this.setDni(dni);
        this.setTitular(titular);
        this.setEdad(edad);
        this.setLesionado(lesionado);
        this.setPosicion(posicion);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public long getDni() {
        return dni;
    }

    public void setDni(long dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public boolean isTitular() {
        return titular;
    }

    public void setTitular(boolean titular) {
        this.titular = titular;
    }

    public boolean isLesionado() {
        return lesionado;
    }

    public void setLesionado(boolean lesionado) {
        this.lesionado = lesionado;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }
    
    @Override
    public String toString() {
        return "|Jugador:" + nombre 
                + ", dni:" + dni 
                + ", edad:" + edad 
                + ", titular:" + titular
                + ", lesionado:" + lesionado + '|';
    }
    
}
