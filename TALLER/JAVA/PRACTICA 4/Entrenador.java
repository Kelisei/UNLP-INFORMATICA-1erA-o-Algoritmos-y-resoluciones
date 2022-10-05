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
public class Entrenador extends Empleado{
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    @Override
    public double calcularEfectividad(){
        return this.campeonatos/super.getAntiguedad();
    }
    @Override
    public double calcularSueldoACobrar(){
        double sueldo = super.getSueldo()+(0.10*super.getSueldo()*super.getAntiguedad());
        if (campeonatos > 0 && campeonatos <= 4) {
            sueldo+=5000.0;
        }else if (campeonatos > 4 && campeonatos <= 10) {
            sueldo+=30000.0;
        }else if (campeonatos > 10) {
            sueldo+=50000.0;
        }
        return sueldo;
    }
    @Override
    public String toString() {
        return "Entrenador{" + "campeonatos=" + campeonatos + " "+super.toString()+'}';
    }
    
}
