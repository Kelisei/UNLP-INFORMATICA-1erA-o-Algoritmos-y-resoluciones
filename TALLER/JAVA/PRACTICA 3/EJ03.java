package tema3;
import PaqueteLectura.GeneradorAleatorio;
public class EJ03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        // TODO code application logic here
        Estantes estanteria = new Estantes();
        while(estanteria.getCantLibros() < 20){
            Libro libro = new Libro();
            LlenarLibro(libro);
            estanteria.Agregar(libro);
        }
        Libro libro = estanteria.BuscarTitulo("Mujercita");
        if (libro != null) {
            System.out.println("Autor de Mujercitas:"+libro.getPrimerAutor());
        }
        else{
            System.out.println("No esta");
        }
    }
    public static void LlenarLibro (Libro libro){
            libro.setAñoEdicion(GeneradorAleatorio.generarInt(2022));
            libro.setEditorial(GeneradorAleatorio.generarString(9));
            libro.setISBN(GeneradorAleatorio.generarString(9));
            libro.setPrecio(GeneradorAleatorio.generarDouble(300));
            Autor autor = new Autor();
            autor.setBiografia(GeneradorAleatorio.generarString(9));
            autor.setNombre(GeneradorAleatorio.generarString(9));
            autor.setOrigen(GeneradorAleatorio.generarString(9));
            libro.setPrimerAutor(autor);
            libro.setTitulo(GeneradorAleatorio.generarString(9));
    }
}
