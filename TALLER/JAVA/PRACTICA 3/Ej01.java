
package tema3;
import PaqueteLectura.Lector;
public class Ej01 {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo t = new Triangulo();
        System.out.println("Introduzca el lado 1");
        t.setLado1(Lector.leerDouble());
        System.out.println("Introduzca el lado 2");
        t.setLado2(Lector.leerDouble());
        System.out.println("Introduzca el lado 3");
        t.setLado3(Lector.leerDouble());
        System.out.println("Introduzca el color del borde");
        t.setColorLinea(Lector.leerString());
        System.out.println("Introduzca el del relleno");
        t.setColorRelleno(Lector.leerString());
        System.out.println("Perimetro:");
        System.out.println(t.calcularPerimetro());
        System.out.println("Area:");
        System.out.println(t.calcularArea());
    }
}
