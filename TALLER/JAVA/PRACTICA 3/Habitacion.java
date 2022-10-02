package tema3;
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costoNoche;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion() {
        this.costoNoche = GeneradorAleatorio.generarDouble(6000)+2000;
        this.ocupada=false;
    }
    
    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public double getCostoNoche() {
        return costoNoche;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }
    @Override
    public String toString() {
        if (ocupada){
            return "Costo por noche "+ costoNoche + " ocupada por " + cliente;
        }
        else {
            return "Costo por noche "+ costoNoche + " desocupada";
        }
    }
}
