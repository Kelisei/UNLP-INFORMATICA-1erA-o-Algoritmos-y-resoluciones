/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ01;

/**
 *
 * @author alumnos
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;
    private int cantSubsidios;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios= new Subsidio[5];
        this.cantSubsidios=0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    public void agregarSubsidio(Subsidio unSubsidio){
        if (cantSubsidios < 5){
            this.subsidios[cantSubsidios]=unSubsidio;
            cantSubsidios++;
        }
    }
    public double totalSubsidio(){
        double cant = 0;
        for (int i = 0; i < cantSubsidios; i++) {
            cant+=subsidios[i].getMonto();
        }
        return cant;
    }
    public void otorgarle(){
        for (int i = 0; i < cantSubsidios; i++) {
            if (!this.subsidios[i].isOtorgado()) {
                this.subsidios[i].setOtorgado(true);
            }
        }
    }
    @Override
    public String toString() {
        return "\n Investigador :" + nombre 
                + ", categoria:" + categoria 
                + ", especialidad:" + especialidad
                + ", total otorgado: "+ this.totalSubsidio();
    }
}
