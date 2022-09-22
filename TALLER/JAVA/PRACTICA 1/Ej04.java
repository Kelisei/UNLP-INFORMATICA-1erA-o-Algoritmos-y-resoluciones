/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej04 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int [][]m = new int [8][4];
        for (int i = 0; i < m.length; i++) {
            for (int j = 0; j < m[i].length; j++) {
                m[i][j]=0;
            }
        }
        int piso = 0;
        int oficina;
        while (piso != 9){
            System.out.println("Introduzca un piso (1 a 8, y 9 para cortar lectura)");
            piso = Lector.leerInt();
            if (piso != 9){
                System.out.println("Introduzca una oficina (1 a 4)");
                oficina = Lector.leerInt();
                m[piso-1][oficina-1]++;
            }
        }
        int total=0;
        System.out.println("Matriz:");
        for (int i = 0; i < m.length; i++) {
            System.out.println("Piso:"+(i+1));
            for (int j = 0; j < m[i].length; j++) {
                System.out.print("Oficina "+(j+1)+":");
                System.out.print("");
                System.out.print(m[i][j]);
                System.out.println("");
            }
            System.out.println(""); 
        }
    }
}
