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
public abstract class Alumno {
    private String nombre;
    private int dni;
    private Materia [] materias;
    private int dl;
    private int df;
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public Alumno(String nombre, int dni, int N) {
        this.nombre = nombre;
        this.dni = dni;
        this.df = N;
        this.materias = new Materia[N];
        this.dl=0;
        for (int i = 0; i < this.df; i++) {
            this.materias[i]=null;
        }
    }
    
    public void aprobarMateria(Materia unaMateria){
        if (this.dl < this.df) {
            this.materias[this.dl]=unaMateria;
            this.dl++;
        } else{
            System.out.println("Ya se registró el máximo de materias aprobadas");
        }
    }
    public boolean graduado(){
        return this.df == this.dl;
    }
    public double promedio(){
        double aux =0;
        for (int i = 0; i < this.dl; i++) {
            aux+=this.materias[i].getNota();
        }
        aux/= (double) this.df;
        return aux;
    }

    @Override
    public String toString() {
        String aux = "Alumno:" + nombre + ", dni:" + dni+ ", materias aprobadas: ";
        for (int i = 0; i < this.dl; i++) {
            aux+=" \n materia " + (i+1) + " "+ this.materias[i].toString();
        }
        aux+="\n Esta graduado: "+ this.graduado() + ", promedio: "+ this.promedio();
        return aux;
    }
    
}
