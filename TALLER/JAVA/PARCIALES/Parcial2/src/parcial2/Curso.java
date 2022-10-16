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
public abstract class Curso {
    private int anio;
    private Alumno [] curso;
    private int df;
    private int dl;
    public Curso(int anio, int N) {
        this.anio = anio;
        this.df = N;
        this.dl=0;
        this.curso = new Alumno [this.df];
        for (int i = 0; i < this.df; i++) {
            this.curso[i]=null;
        }
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public int getAlumnos() {
        return df;
    }
    
    public boolean agregarAlumno(Alumno unAlumno){
        if (this.dl < this.df){
            this.curso[this.dl]=unAlumno;
            dl++;
            return true;
        }else{
            return false;
        }
    }
    public void incrementarAsistencia(long dni){
        boolean encontrado = false;
        int i =0;
        while (!encontrado && i < dl){
            if (this.curso[i].getDni() == dni){
                this.curso[i].setAsistencias(this.curso[i].getAsistencias()+1);
                encontrado =true;
            }else{
                i++;
            }
        }
    }
    public void aprobarAutoevalución(long dni){
        boolean encontrado = false;
        int i =0;
        while (!encontrado && i < dl){
            if (this.curso[i].getDni() == dni){
                this.curso[i].setAprobadas(this.curso[i].getAprobadas()+1);
                encontrado =true;
            }else{
                i++;
            }
        }
    }
    public abstract boolean puedeRendir(Alumno unAlumno);
    public int cantidadDeAlumnosQuePuedenRendir(){
        int cant =0;
        for (int i = 0; i < dl; i++) {
            if (this.puedeRendir(this.curso[i])){
                cant++;
            }
        }
        return cant;
    }

    @Override
    public String toString() {
        String aux = "";
        aux+="Curso{" + "año=" + anio + ", df=" + df + ", dl=" + dl;
        for (int i = 0; i < dl; i++) {
            aux+=curso[i].toString();
        }
        aux+="}";
        return aux;
    }
    
    
}
