/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author USUARIO
 */
public class Jugador extends Empleado{
    private int partidos;
    private int goles;

    public Jugador(int partidos, int goles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    @Override
    public double calcularEfectividad(){
        return this.goles/this.partidos;
    }
    @Override
    public double calcularSueldoACobrar(){
        double sueldo = super.getSueldo()+(0.10*super.getSueldo()*super.getAntiguedad());
        if (calcularEfectividad()>.5){sueldo+=super.getSueldo();}
        return sueldo;
    }
    @Override
    public String toString() {
        return "Jugador{" + "partidos=" + partidos + ", goles=" + goles + " "+super.toString()+'}';
    }
    
}
