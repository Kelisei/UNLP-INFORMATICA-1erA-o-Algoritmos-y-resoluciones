/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int[5][5];
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz.length; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("Matriz:");
        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz.length; j++) {
                System.out.print(matriz[i][j]);
                System.out.print(" ");
            }
            System.out.println(""); 
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int total=0;
        for (int i = 0; i < matriz.length; i++) {
            total=total+matriz[1][i];
        }
        System.out.println("Total de la fila 1: "+total);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vector = new int [5];
        for (int i = 0; i < vector.length; i++) {
            vector[i]=0;
        }
        for (int i = 0; i < vector.length; i++) {
            for (int j = 0; j < vector.length; j++) {
                vector[j]=vector[j]+matriz[i][j];
            }
        }
        System.out.println("Vector de columnas juntas:");
        for (int i = 0; i < vector.length; i++) {
            System.out.print(vector[i]); 
            System.out.print(" ");
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("");
        System.out.println("Introduzca un valor");
        int valor = Lector.leerInt();
        boolean esta = false;
        int i = 0;
        int j;
        while (esta == false && i < 5) {
            j=0;
            while (esta == false && j < 5) {
                if (valor == matriz[i][j]) {
                    System.out.println("Esta el numero en:");
                    System.out.println("Columna "+(j+1)+" fila "+(i+1));
                    esta=true;
                }
                j++;
            }
            i++;
        }
        if (!esta) {
            System.out.println("No esta");
        }
    }
}
