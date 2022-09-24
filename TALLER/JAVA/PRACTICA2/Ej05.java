/*
5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). 
Un objeto
partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String vacío).

hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej05 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PaqueteLectura.GeneradorAleatorio.iniciar();
        int df=20;
        Partido[] vectorPartidos = new Partido[df];
        Partido p = new Partido();
        teclao(p);
        //automatico(p);
        System.out.println(p);
        int diml=0;
        while(diml < df && !p.getVisitante().toUpperCase().equals("ZZZ")){
            vectorPartidos[diml++]=p; //--> Vector guarda lo que esta en i, y después del proceso lo aumenta.
            p = new Partido();
            teclao(p);
            //automatico(p);
        }
        int ganadosRiver=0;
        int golesBoque=0;
        for (int i = 0; i < diml; i++) {
            System.out.println(vectorPartidos[i]);
            if (vectorPartidos[i].hayGanador() && vectorPartidos[i].getGanador().toUpperCase().equals("RIVER")) {
                ganadosRiver++;
            }
            if(vectorPartidos[i].getLocal().toUpperCase().equals("BOCA")){
                golesBoque+=vectorPartidos[i].getGolesLocal();
            }
        }
        System.out.println(ganadosRiver);
        System.out.println(golesBoque);
    }
    public static void teclao(Partido p){
        p.setVisitante(Lector.leerString());
        if (!p.getVisitante().toUpperCase().equals("ZZZ")) {
            p.setLocal(Lector.leerString());
            p.setGolesVisitante(Lector.leerInt());
            p.setGolesLocal(Lector.leerInt());
        }
    }
    public static void automatico(Partido p){
        p.setVisitante(GeneradorAleatorio.generarString(3));
        if (!p.getVisitante().toUpperCase().equals("ZZZ")) {
            p.setLocal(GeneradorAleatorio.generarString(3));
            p.setGolesVisitante(GeneradorAleatorio.generarInt(20));
            p.setGolesLocal(GeneradorAleatorio.generarInt(20));
        }
    }
}
