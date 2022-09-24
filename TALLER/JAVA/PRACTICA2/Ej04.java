/*
4- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar. 
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
public class Ej04 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int MaxPersonas = 8;
        int MaxDias = 5;
        
        int [] personasPorDia = new int [MaxDias];
        for (int i = 0; i < personasPorDia.length; i++) {
            personasPorDia[i]=0;
        }
        
        Persona aux = new Persona();
        Persona[][] matrizPersonas = new Persona[MaxPersonas][MaxDias];
        int personasActuales;
        int diaActual = 0;
        
        aux.setNombre(GeneradorAleatorio.generarString(3));
        
        while (diaActual < MaxDias && !aux.getNombre().toUpperCase().equals("ZZZ")){
            personasActuales=0;
            System.out.println("En el dia "+diaActual);
            while (personasActuales < MaxPersonas && !aux.getNombre().toUpperCase().equals("ZZZ")){
                aux.setEdad(GeneradorAleatorio.generarInt(100));
                aux.setDNI(GeneradorAleatorio.generarInt(10000)+1);
                
                System.out.println("Se casteo la persona "+aux.getNombre()+" de de dni y edad de "+aux.getDNI()+ " "+aux.getEdad());
                matrizPersonas[personasActuales][diaActual]=aux;
                
                personasPorDia[diaActual]++;
                personasActuales++;
                
                aux=new Persona();
                aux.setNombre(GeneradorAleatorio.generarString(3));
            }
            diaActual++;
        }
        diaActual=0;
        while(diaActual < MaxDias){
            personasActuales=0;
            System.out.println("Dia "+(diaActual+1));
            while(diaActual < MaxDias & personasActuales < personasPorDia[diaActual]){
                System.out.println(matrizPersonas[personasActuales][diaActual]);
                personasActuales++;
            }
            diaActual++;
        }
    }
}
