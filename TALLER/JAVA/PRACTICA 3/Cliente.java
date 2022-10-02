package tema3;

public class Cliente{

    private String nombre;
    private long DNI;
    private int edad;

    public Cliente() {
    }

    public Cliente(String nombre, long DNI, int edad) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public long getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDNI(long DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Cliente de nombre:" + nombre + ", DNI:" + DNI + ", edad:" + edad;
    }
        
    
}
