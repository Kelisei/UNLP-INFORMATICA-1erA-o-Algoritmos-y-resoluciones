/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ03;

/**
 *
 * @author frank
 */
public abstract class Recital {
    private String nombreBanda;
    private String [] temas;
    private int dl, df;
    public Recital(String nombreBanda, int df) {
        this.nombreBanda = nombreBanda;
        this.df=df;
        this.dl=0;
        this.temas = new String[this.df];
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getTotalCaciones() {
        return dl;
    }

    public int getMaximoCanciones() {
        return df;
    }

    public void setMaximoCanciones(int df) {
        this.df = df;
    }
    
    public void agregarTema(String nombre){
        if (dl < df){
            temas[dl]=nombre;
            dl++;
        }else{
            System.out.println("No se pudo meter el tema");
        }
    }
    public void actuar (){
        for (int i = 0; i < dl; i++) {
            System.out.println("Y ahora tocaremos "+temas[i]);
        }
    }
    public abstract int calcularCosto();

    @Override
    public String toString() {
        String descripcion="|Nombre de la banda:" + nombreBanda+"|";
        for (int i = 0; i < dl; i++) {
           descripcion+="|tema :"+(i+1)+" "+temas[i]+"|";
        }
        return descripcion;
    }
    
}
