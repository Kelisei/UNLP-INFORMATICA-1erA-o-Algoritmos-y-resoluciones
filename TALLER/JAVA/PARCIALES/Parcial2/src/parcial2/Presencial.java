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
public class Presencial extends Curso {
    private int aula;

    public Presencial(int aula, int anio, int N) {
        super(anio, N);
        this.aula = aula;
    }

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }
    public boolean puedeRendir(Alumno unAlumno){
        if(unAlumno.getAsistencias() > 2){
            return true;
        } else{
            return false;
        }
    }
}
