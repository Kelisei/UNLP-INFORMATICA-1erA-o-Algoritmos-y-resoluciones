package tema3;
public class Autor {
    String nombre;
    String biografia;
    String origen;
    
    public Autor() {
    }
    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }
    //------------------------------><3
    //Setters:
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    //------------------------------><3
    //Getters:
    public String getBiografia() {
        return biografia;
    }

    public String getNombre() {
        return nombre;
    }

    public String getOrigen() {
        return origen;
    }
    //------------------------------><3
    //ToString:

    @Override
    public String toString() {
        return "Autor:" + nombre + ", biografia:" + biografia + ", origen:" + origen;
    }
}
