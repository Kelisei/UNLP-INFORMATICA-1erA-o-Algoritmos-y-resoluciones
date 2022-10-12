/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ04;

/**
 *
 * @author frank
 */
public class coroSemicircular extends Coro{
    private Corista [] coro;
    private int dl;
    private int df;

    public coroSemicircular(String nombre, int df, Director director) {
        super(director, nombre);
        this.df = df;
        this.dl = 0;
        coro = new Corista [df];
        for (int i = 0; i < df; i++) {
            coro[i]=null;
        }
    }
    public void agregarCorista(Corista c){
        if (this.dl < this.df){
            coro[dl]=c;
            dl++;
        }
    }
    public boolean estaLleno(){
        return this.dl==this.df;
    }
    public boolean bienOrdenado(){
        int i =0;
        boolean ok =true;
        while(i < (df-1) && ok){
            if (this.coro[i].getTono()>this.coro[i+1].getTono()) {
                ok=false;
            }else{
                i++;
            }
        }
        return ok;
    }
    @Override
    public String toString() {
        String x = "";
        x+=super.toString()+ "\n";
        for (int i = 0; i < this.dl; i++) {
            x+=this.coro[i] + "\n";
        }
        return x;
    }
}
