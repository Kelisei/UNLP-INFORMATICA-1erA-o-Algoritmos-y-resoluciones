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
public class coroPorHileras extends Coro{
    private Corista [][] coro;
    private int dl;
    private int df;
    private int lado;

    public coroPorHileras(String nombre, int lado, Director director) {
        super(director, nombre);
        this.lado=lado;
        this.df = lado*lado;
        this.dl = 0;
        this.coro = new Corista [lado][lado];
        for (int i = 0; i < lado; i++) {
            for (int j = 0; j < lado; j++) {
                coro[i][j]=null;
            }
        }
    }
    //Esto sirve para agregar a una matriz, siendo dl la posición actual a agregar, el numero por el cual debemos dividir es:
    //El que ponemos en el segundo espacio de la matriz :[x][este], este es el numero de columnas, sirve para rectangulares y cuadradas
    @Override
    public void agregarCorista(Corista c){
        if(this.dl < this.df){
            this.coro[this.dl/this.lado][this.dl%this.lado]=c;
            dl++;
        }
    }
    @Override
    public boolean estaLleno(){
        return (this.dl==this.df);
    }
    @Override
    public boolean bienOrdenado(){
        int i =0, j=0;
//        System.out.println("dl:"+this.dl);
//        System.out.println("df:"+this.df);
//        System.out.println(estaLleno());
        if(estaLleno()){
            while(i < (this.lado-1) && (this.coro[i][0].getTono() > this.coro[i+1][0].getTono())){
                //System.out.println("j:"+j);
                while(j < (this.lado-1) && (this.coro[i][j].getTono() == this.coro[i][j+1].getTono())){
                    //System.out.println("j:"+j);
                    j++;
                }
                if (j == (this.lado-1)) {
                    i++;
                    j=0;
                }else{
                    return false;
                }
            }
            j=0;
            while (j < (this.lado-1) && (this.coro[i][j].getTono() == this.coro[i][j+1].getTono())) {
                j++;
            }
            if (j != (this.lado-1)) {
                return false;
            }
        }
        return i == (this.lado - 1);
    }
    public void mostrar(){
        for (int i = 0; i < coro.length; i++) {
            for (int j = 0; j < coro.length; j++) {
                System.out.print("["+i+"]"+"["+j+"]");
                System.out.print(coro[i][j].toString());
            }
            System.out.println("");
        }
    }
    @Override
    public String toString() {
        String x = "";
        x+=super.toString()+ "\n";
        for (int i = 0; i < this.dl; i++) {
            x+=this.coro[i/this.lado][i%this.lado] + "\n";
        }
        return x;
    }
    
}
