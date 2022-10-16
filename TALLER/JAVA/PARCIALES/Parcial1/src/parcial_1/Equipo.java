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
public class Equipo {
    private Jugador [] equipo;
    private int df;
    private int victorias;
    private int puntos;
    private String nombre;
    private int dl;

    public Equipo(int victorias, int puntos, String nombre) {
        this.victorias = victorias;
        this.puntos = puntos;
        this.nombre = nombre;
        this.df=11;
        this.dl=0;
        this.equipo = new Jugador [df];
    }

    public int getVictorias() {
        return victorias;
    }

    public void setVictorias(int victorias) {
        this.victorias = victorias;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public boolean lleno(){
        return (this.dl == this.df);
    }
    
    public void agregarJugador(Jugador unJugador){
        if (!lleno()){
            this.equipo[this.dl]=unJugador;
            this.dl++;
        }
    }
    
    public boolean clasifica(){
        if (this.puntos <= 55) {
            return false;
        }
        boolean aux=true;
        int i=0;
        while (aux && i < this.dl) {
            if (this.equipo[i].isTitular() && this.equipo[i].isLesionado()){
                aux=false;
            } else{
                i++;
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        String aux = "";
        aux+="|Equipo:" + this.nombre
                + ", clasfica: " + this.clasifica()
                + ", victorias:" + this.victorias 
                + ", puntos:" + this.puntos 
                + ", jugadores: \n";
        for (int i = 0; i < this.dl; i++) {
            aux+=this.equipo[i].toString() +"\n";
        }
        return aux;
    }
}
