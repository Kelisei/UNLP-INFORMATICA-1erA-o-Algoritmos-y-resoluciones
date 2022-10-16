/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;

/**
 *
 * @author frank
 */
public class Posgrado extends Alumno{
    private String titulo;
    private String univerdad;

    public Posgrado(String titulo, String univerdad, String nombre, int dni) {
        super(nombre, dni, 8);
        this.titulo = titulo;
        this.univerdad = univerdad;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniverdad() {
        return univerdad;
    }

    public void setUniverdad(String univerdad) {
        this.univerdad = univerdad;
    }
    
    @Override
    public boolean graduado(){
        return (super.graduado() && super.promedio() >= 6);
    }
}
