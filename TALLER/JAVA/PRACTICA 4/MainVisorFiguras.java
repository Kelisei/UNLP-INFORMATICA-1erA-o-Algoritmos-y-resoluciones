package tema4;

public class MainVisorFiguras { 
public static void main(String[] args) {
 VisorFigurasModificado visor = new VisorFigurasModificado();
 
 visor.guardar(new Cuadrado(10,"Violeta","Rosa"));
 visor.guardar(new Rectangulo(20,10,"Azul","Celeste"));
 visor.guardar(new Cuadrado(30,"Rojo","Naranja"));
 visor.mostrar();
 } 
}