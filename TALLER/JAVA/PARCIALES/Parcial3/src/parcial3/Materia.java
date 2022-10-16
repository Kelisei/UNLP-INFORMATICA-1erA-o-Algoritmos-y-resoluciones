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
public class Materia {
    private double nota;
    private String fechaAprobacion;

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public String getFechaAprobacion() {
        return fechaAprobacion;
    }

    public void setFechaAprobacion(String fechaAprobacion) {
        this.fechaAprobacion = fechaAprobacion;
    }

    public Materia(double nota, String fechaAprobacion) {
        this.nota = nota;
        this.fechaAprobacion = fechaAprobacion;
    }

    @Override
    public String toString() {
        return "nota:" + nota + ", fecha de aprobacion:" + fechaAprobacion;
    }
    
    
}
