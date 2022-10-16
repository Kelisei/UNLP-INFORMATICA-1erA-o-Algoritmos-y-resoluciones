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
public class Torneo {
    private String nombre;
    private int fechas;
    private int equipos;
    private Equipo [] torneo;
    private int dl;
    public Torneo(String nombre, int fechas, int N) {
        this.nombre = nombre;
        this.fechas = fechas;
        this.equipos = N;
        this.torneo = new Equipo [this.equipos];
        this.dl=0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getFechas() {
        return fechas;
    }

    public void setFechas(int fechas) {
        this.fechas = fechas;
    }
    
    public void agregarEquipo(Equipo unEquipo){
        if(this.dl < this.equipos){
            this.torneo[this.dl]=unEquipo;
            dl++;
        }
    }

    @Override
    public String toString() {
        String aux="";
        aux+="Torneo: " + nombre + ", fechas: " + fechas + ", equipos: \n";
        for (int i = 0; i < this.dl; i++) {
            aux+=this.torneo[i].toString();
        }
        return aux;
    }
}
