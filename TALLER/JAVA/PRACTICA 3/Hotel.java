/*4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre,
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/
2000 y 8000.*/
package tema3;

public class Hotel {
    private int numHabitaciones;
    private Habitacion [] habitaciones;
    
    //Constructores
    public Hotel() {
    }
    public Hotel(int numHabitaciones) {
        this.numHabitaciones = numHabitaciones;
        this.habitaciones = new Habitacion [numHabitaciones];
        iniciarHotel();
    }
    //Auxiliar:
    public void iniciarHotel(){
        for (int i = 0; i < habitaciones.length; i++) {
            habitaciones[i] = new Habitacion();
        }
    }
    //Getters y setters:
    public void setNumHabitaciones(int numHabitaciones) {
        this.numHabitaciones = numHabitaciones;
    }
public int getNumHabitaciones() {
        return numHabitaciones;
    }
    
    public void setHabitaciones(Habitacion[] habitaciones) {
        this.habitaciones = habitaciones;
    }
    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }
    
    //Customs:
    public void agregarCliente(Cliente cliente, int numHabitacion){
        if (numHabitacion >= 0 && numHabitacion < this.numHabitaciones) {
            if (!habitaciones[numHabitacion].isOcupada()){
                habitaciones[numHabitacion].setCliente(cliente);
                habitaciones[numHabitacion].setOcupada(true);
            }else{
                System.out.println("Esta ocupada la habitación!");
            }
        } else {
            System.out.println("No existe, men");
        }
    }
    public void aumentarPrecio (double aumento){
        for (int i = 0; i < habitaciones.length; i++) {
            habitaciones[i].setCostoNoche(habitaciones[i].getCostoNoche()+aumento);
        }
    }
    @Override
    public String toString() {
        String descripción = "";
        for (int i = 0; i < habitaciones.length; i++) {
            descripción+="Habitación "+i+" "+habitaciones[i]+ "\n";
        }
        return descripción;
    }
    
}
