/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial3;
/**
 *
 * @author frank
 */
public class Parcial3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        DeGrado x1 = new DeGrado("Biología", "Rodolfo Amargini", 1202312);
        for (int i = 0; i < 30; i++) {
            Materia m = new Materia(4+( (double)i/10), "21 de mayo");
            x1.aprobarMateria(m);
        }
        System.out.println(x1.toString());
        Posgrado x2 = new Posgrado("Biologo", "UNLP", "Pitufo Amargini", 0102312);
        for (int i = 0; i < 8; i++) {
            Materia m = new Materia(6+( (double)i/10), "21 de mayo");
            x2.aprobarMateria(m);
        }
        System.out.println(x2.toString());
    }
    
    
}
