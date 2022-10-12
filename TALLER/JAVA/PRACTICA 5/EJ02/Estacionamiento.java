/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ02;

/**
 *
 * @author frank
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int pisos;
    private int plazas;
    private Auto [][] estacionamiento;
    
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos = pisos;
        this.plazas = plazas;
        estacionamiento = new Auto[pisos][plazas];
        for (int i = 0; i < pisos; i++) {
            for (int j = 0; j < plazas; j++) {
                estacionamiento[i][j]=null;                
            }
        }
    }

    public Estacionamiento(String nombre, String direccion) {
        this.nombre=nombre;
        this.direccion=direccion;
        this.horaApertura="8:00";
        this.horaCierre="21:00";
        this.pisos=5;
        this.plazas=10;
        for (int i = 0; i < pisos; i++) {
            for (int j = 0; j < plazas; j++) {
                estacionamiento[i][j]=null;                
            }
        }
    }
    public void agregarAuto(Auto A, int X, int Y){
        estacionamiento[X][Y]=A;
    }
    public String getAuto(String patente){
        int i = 0; int j = 0;
        while(i < this.pisos){
            while(j < this.plazas && estacionamiento[i][j]!=null && !estacionamiento[i][j].getPatente().equals(patente)){
                j++;
            }
            if(j == this.plazas){
                j=0;
                i++;
            }else if(this.estacionamiento[i][j]==null){
                j++;
            }
            else{
                System.out.println("i:"+i+" j:"+j);
                return "Piso: "+(i+1)
                    + ", Plaza: "+(j+1)
                    + ", Auto: "+this.estacionamiento[i][j].toString();
            }
        }
        return "Auto Inexistente";
    }
    public int getAutosPlaza(int plaza){
        int cant =0;
        for (int i = 0; i < pisos; i++) {
            if(this.estacionamiento[i][plaza-1]!=null){
                cant++;
            }
        }
        return cant;
    }
    @Override
    public String toString() {
        String descripcion = "";
        for (int i = 0; i < this.pisos; i++) {
            for (int j = 0; j < this.plazas; j++) {
                if(this.estacionamiento[i][j]==null){
                    descripcion+="|Piso: "+(i+1)+", Plaza: "+(j+1)+" Libre |";
                }else{
                    descripcion+="|Piso: "+(i+1)+", Plaza: "+(j+1)+" "+this.estacionamiento[i][j].toString()+" |";
                }
            }
            descripcion+="\n";
        }
        return descripcion;
    }    
}
