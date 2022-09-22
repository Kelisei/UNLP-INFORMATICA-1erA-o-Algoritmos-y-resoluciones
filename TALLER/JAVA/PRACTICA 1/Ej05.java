/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej05 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int [][] m = new int [5][4];
        double [] promedios = new double [4];
        for (int i = 0; i < m.length; i++) {
            System.out.println("Cliente numero "+ (i+1));
            for (int j = 0; j < m[i].length; j++) {
                switch (j) {
                    case 0:
                        System.out.println("Introduzca su calificación de atención al cliente");
                        m[i][j]=Lector.leerInt();
                        promedios[j]=m[i][j]+promedios[j];
                        break;
                    case 1:
                        System.out.println("Introduzca su calificación de calidad de la comida");
                        m[i][j]=Lector.leerInt();
                        promedios[j]=m[i][j]+promedios[j];
                        break;
                    case 2: 
                        System.out.println("Introduzca su calificación del precio");
                        m[i][j]=Lector.leerInt();
                        promedios[j]=m[i][j]+promedios[j];
                        break;
                    case 3: 
                        System.out.println("Introduzca su calificación del ambiente");
                        m[i][j]=Lector.leerInt();
                        promedios[j]=m[i][j]+promedios[j];
                        break;
                }
            }
        }
        for (int i = 0; i < promedios.length; i++) {
            promedios[i]=promedios[i]/5;
            System.out.println("Promedio de las aspecto "+i+":"+promedios[i]);
        }
    }
}
