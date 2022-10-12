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
public class Director {
    private String nombre;
    private long dni;
    private int edad;
    private int antiguedad;

    public Director(String nombre, long dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString() {
        return "Director:" + nombre + ", dni:" + dni + ", edad:" + edad + ", antiguedad:" + antiguedad;
    }
}
