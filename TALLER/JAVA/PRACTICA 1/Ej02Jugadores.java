package tema1;
/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
*/
//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {
    public static void main(String[] args) {
        
        //Paso 2: Declarar la variable vector de double 
        int DF = 15;
        //Paso 3: Crear el vector para 15 double 
        double [] v = new double [DF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        double promedio = 0.0;
        int cant = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (int i = 0; i < DF; i++) {
            System.out.println("Ingrese altura del jugador "+(i+1));
            v[i] = Lector.leerDouble();	 
            promedio=promedio+v[i];
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = promedio/DF;
        System.out.println("Promedio de jugadores:"+promedio);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (int i = 0; i < v.length; i++) {
            if (v[i] > promedio) {
                cant++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("Hay "+cant+" de jugadores con altura arriba del promedio");
    }
}
