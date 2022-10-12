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
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador [] investigadores;
    private int cantInvestigadores;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.cantInvestigadores=0;
        this.investigadores = new Investigador[50];
        for (int i = 0; i < investigadores.length; i++) {
            this.investigadores[i]=null;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    public void agregarInvestigador(Investigador unInvestigador){
        if (cantInvestigadores < 50) {
            this.investigadores[cantInvestigadores]=unInvestigador;
            cantInvestigadores++;
        }
    }
    public double dineroTotalOtorgado(){
        double cant =0;
        for (int i = 0; i < cantInvestigadores; i++) {
            cant+=this.investigadores[i].totalSubsidio();
        }
        return cant;
    }
    void otorgarTodos(String nombre_completo){
        int i =0;
        while(i < this.cantInvestigadores && this.investigadores[cantInvestigadores].getNombre().equals(nombre_completo)){
            i++;
        }
        if (this.investigadores[i].getNombre().equals(nombre_completo)){
            this.investigadores[i].otorgarle();
        }
    }
    @Override
    public String toString() {
        String descripcion = "Proyecto{" + "nombre:" + nombre + ", codigo:" + codigo + ", nombreDirector:" + nombreDirector + '}';
        for (int i = 0; i < cantInvestigadores; i++) {
            descripcion+=investigadores[i].toString();
        }
        return descripcion;
    }
}
