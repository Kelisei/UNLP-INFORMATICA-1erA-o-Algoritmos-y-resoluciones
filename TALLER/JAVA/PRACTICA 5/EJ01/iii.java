/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ01;

/**
 *
 * @author frank
 */
public class iii {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Proyecto proyecto = new Proyecto("Nombre", 2131231, "Director Pollón");
        Investigador unInvestigador = new Investigador(
        "Ruperto Aguirre",
        5,
        "Filosofo"
        );
        Subsidio s = new Subsidio(123123.23, "Cancer");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(777, "Zapallos");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(777, "Zapallos");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(777, "Zapallos");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(777, "Zapallos");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(777, "Zapallos");
        unInvestigador.agregarSubsidio(s);
        proyecto.agregarInvestigador(unInvestigador);
        
        unInvestigador = new Investigador(
        "Juan Ignacio Tau",
        5,
        "Transductor"
        );
        s = new Subsidio(666, "Aritmetica");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(420.69, "Aliens");
        unInvestigador.agregarSubsidio(s);
        proyecto.agregarInvestigador(unInvestigador);
        
        unInvestigador = new Investigador(
        "Goku K-on",
        5,
        "Peleador"
        );
        s = new Subsidio(666, "Impotencia");
        unInvestigador.agregarSubsidio(s);
        s = new Subsidio(420.69, "Espadas");
        unInvestigador.agregarSubsidio(s);
        proyecto.agregarInvestigador(unInvestigador);
        System.out.println(proyecto.toString());
    }
}
