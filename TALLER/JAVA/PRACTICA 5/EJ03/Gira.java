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
public class Gira extends Recital{
    private String nombreGira;
    private int actual, df, dl;
    private Fecha [] fechas;
    
    public Gira(String nombreGira, String nombreBanda, int df, int cantFechas) {
        super(nombreBanda, df);
        this.nombreGira = nombreGira;
        this.fechas = new Fecha [cantFechas];
        this.dl=0;
        this.df=cantFechas;
        this.actual=0;
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    
    public void agregarFecha(Fecha fecha){
        if (this.dl < this.df){
            this.fechas[this.dl]=fecha;
            this.dl++;
        }
    }
    @Override
    public void actuar (){
        if(this.actual < this.dl){
            System.out.println("Buenas noches..."+this.fechas[actual].getNombre());
            actual++;
            super.actuar();
        }
    }
    public int calcularCosto(){
        int total =0;
        for (int i = 0; i < this.dl; i++) {
            total+=30000;
        }
        return total;
    }
}
