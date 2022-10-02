/*
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String. 
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona p1 = new Persona();
        System.out.println("Diga el dni de la persona");
        p1.setDNI(Lector.leerInt());
        System.out.println("Diga la edad de la persona");
        p1.setEdad(Lector.leerInt());
        System.out.println("Diga el nombre de la persona");
        p1.setNombre(Lector.leerString());
        System.out.println(p1.toString());
    }
}
