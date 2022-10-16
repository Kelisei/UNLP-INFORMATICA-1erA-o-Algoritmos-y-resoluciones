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
public class ADistancia extends Curso{
   private String link;

    public ADistancia(String link, int anio, int N) {
        super(anio, N);
        this.link = link;
    }
    
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
   
    public boolean puedeRendir(Alumno unAlumno){
        if(unAlumno.getAprobadas()>2 && unAlumno.getAsistencias() > 0){
            return true;
        } else{
            return false;
        }
    }
}
