package tema4;

public class VisorFigurasModificado {
 private int guardadas;
 private int capacidadMaxima=5;
 private Figura [] vector;
 
 public VisorFigurasModificado(){
 //completar
    vector = new Figura [capacidadMaxima];
    guardadas=0;
     for (int i = 0; i < capacidadMaxima; i++) {
         vector[i] = null;
     }
 }
 
 public void guardar(Figura f){
     if (quedaEspacio()) {
         vector[guardadas]=f;
         guardadas++;
     }else{
         System.out.println("Esta lleno!");
     }
 }
 public boolean quedaEspacio(){
     return guardadas!=20;
 }
 
 public void mostrar(){
     for (int i = 0; i < guardadas; i++) {
         System.out.println(vector[i]);
     }
 }
 public int getGuardadas() {
     return guardadas;
 }
}