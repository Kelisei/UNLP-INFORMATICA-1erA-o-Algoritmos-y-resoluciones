package tema3;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class EJ04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Introduzca las cantidad de habitaciones del hotel");
        Hotel hotel = new Hotel(Lector.leerInt());
        System.out.println("Ingrese la habitación a ocupar (-1 para cortar lectura)");
        int numero = Lector.leerInt();
        while (numero != -1){
            Cliente cliente = new Cliente(GeneradorAleatorio.generarString(15),GeneradorAleatorio.generarInt(5000),(GeneradorAleatorio.generarInt(90)+18));
            System.out.println(cliente);
            hotel.agregarCliente(cliente, numero);
            System.out.println("Ingrese la habitación a ocupar (-1 para cortar lectura)");
            numero = Lector.leerInt();
        }
        System.out.println("Ingrese un valor para aumentar las habitaciones");
        double aumento = Lector.leerDouble();
        hotel.aumentarPrecio(aumento);
        System.out.println(hotel.toString());
    }
}