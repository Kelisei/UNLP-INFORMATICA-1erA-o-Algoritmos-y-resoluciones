/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial4;

/**
 *
 * @author frank
 */
public class Estanteria {
    private Libro [][] estanteria;
    private int filas;
    private int columnas;
    private int df;
    
    public Estanteria(int N, int M) {
        this.filas = N;
        this.columnas = M;
        this.df = N*M;
        this.estanteria = new Libro[this.filas][this.columnas];
        for (int i = 0; i < this.df; i++) {
            this.estanteria[i/this.columnas][i%this.columnas] = null;
        }
    }

    public int getFilas() {
        return filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public int getMaxLibros() {
        return df;
    }
    
    public void almacenarLibro(Libro unLibro){
        int i = 0; 
        boolean almacenado = false;
        while (i < this.df && !almacenado) {
            if (this.estanteria[i/this.columnas][i%this.columnas]==null){
                this.estanteria[i/this.columnas][i%this.columnas]=unLibro;
                almacenado=true;
            }else{
                i++;
            }
        }
    }
    
    public Libro sacarLibro(int X, int Y){
        Libro aux = this.estanteria[X][Y];
        this.estanteria[X][Y]=null;
        return aux;
    }
    
    public int calcular(String autor){
        int cant = 0;
        for (int i = 0; i < this.df; i++) {
            if (this.estanteria[i/this.columnas][i%this.columnas] != null && this.estanteria[i/this.columnas][i%this.columnas].getAutor().equals(autor)){
                cant++;
            }
        }
        return cant;
    }
}
