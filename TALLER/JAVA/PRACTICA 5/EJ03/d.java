/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ03;

/**
 *
 * @author frank
 */
public class d {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Evento_Ocasional une = new Evento_Ocasional("PrIvAdO",
                "Roquefeller",
                10,
                "Ratones Paranoicos",
                5);
        une.agregarTema("300 Espartanos");
        une.agregarTema("Les pibis unides");
        System.out.println("Costo:"+une.calcularCosto());
        une.actuar();
        System.out.println("");
        System.out.println("");
        Gira dois = new Gira("Big Time Rush Bolivia on Ice",
                "Mnemonicos Astrales Satánicos",
                2,
                5);
        dois.agregarTema("300 Espartanos");
        dois.agregarTema("Les pibis unides");
        Fecha f = new Fecha("La Plata", 28);
        dois.agregarFecha(f);
        f = new Fecha("Bolivia", 29);
        dois.agregarFecha(f);
        System.out.println("Costo:"+dois.calcularCosto());
        dois.actuar();
        System.out.println(une);
        System.out.println(dois);
    }
}
