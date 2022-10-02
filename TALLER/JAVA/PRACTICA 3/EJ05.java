package tema3;
import PaqueteLectura.Lector;
public class EJ05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulo circulo = new Circulo();
        System.out.println("Introduzca el radio del circulo:");
        circulo.setRadio(Lector.leerDouble());
        System.out.println("Introduzca el color de la linea:");
        circulo.setLinea(Lector.leerString());
        System.out.println("Introduzca el color del relleno:");
        circulo.setRelleno(Lector.leerString());
        System.out.println("El perimetro es " + circulo.perimetro());
        System.out.println("El area es "+circulo.area());
    }
}
