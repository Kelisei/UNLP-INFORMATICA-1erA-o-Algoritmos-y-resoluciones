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
public class Alumno {
    private long dni;
    private String nombre;
    private int asistencias;
    private int aprobadas;

    public long getDni() {
        return dni;
    }

    public void setDni(long dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public int getAprobadas() {
        return aprobadas;
    }

    public void setAprobadas(int aprobadas) {
        this.aprobadas = aprobadas;
    }

    public Alumno(long dni, String nombre) {
        this.dni = dni;
        this.nombre = nombre;
        this.asistencias = 0;
        this.aprobadas = 0;
    }

    @Override
    public String toString() {
        return "Alumno{" + "dni=" + dni + ", nombre=" + nombre + ", asistencias=" + asistencias + ", aprobadas=" + aprobadas + '}';
    }
    
    
}
