package tema4;

public class EJ05 {
 private int mostradas;
 
 public EJ05(){
 mostradas=0;
 }
 public void mostrar(Figura f){
 System.out.println(f.toString()); 
 mostradas++;
 }
 public int getMostradas() {
 return mostradas;
 }
}
