package tema3;
public class Estantes {
    private Libro [] libros = new Libro [20];
    private int cantLibros=0;

    public Estantes() {
    }
    //(i) devolver la cantidad de libros que almacenados
    public int getCantLibros() {
        return cantLibros;
    }
    //(ii) devolver si el estante está lleno
    public boolean Lleno(){
        return (this.cantLibros==20);
    }
    //(iii) agregar un libro al estante
    public void Agregar (Libro libro){
        if(this.cantLibros<20){
            libros[this.cantLibros]= libro;
            this.cantLibros++;
        }else{
            System.out.println("Esta lleno");
        }
    }
    //(iv) devolver el libro con un título particular que se recibe.
    public Libro BuscarTitulo(String Titulo){
        int i = 0;
        while(i < cantLibros && !this.libros[i].getTitulo().equals(Titulo)){
            i++;
        }
        if (i < cantLibros && this.libros[i].getTitulo().equals(Titulo)){
            return libros[i];
        }
        return (null);
    }
    public void MostrarEstante(){
        for (int i = 0; i < cantLibros; i++) {
            System.out.println(libros[i]);
        }

    }
}
