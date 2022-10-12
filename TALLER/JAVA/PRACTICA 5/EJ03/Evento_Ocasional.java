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
public class Evento_Ocasional extends Recital{
    private String motivo;
    private String contratante;
    private int dia;
    public Evento_Ocasional(String motivo, String contratante, int dia, String nombreBanda, int df) {
        super(nombreBanda, df);
        this.motivo = motivo;
        this.contratante=contratante;
        this.dia=dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    
    @Override
    public void actuar (){
        if(this.motivo.toLowerCase().equals("beneficiencia")){
            System.out.println("Recuerden colaborar con..."+this.contratante);
        }else if (this.motivo.toLowerCase().equals("tv")){
            System.out.println("Saludos amigos televidentes");
        }else{
            System.out.println("Un feliz cumpleaños para..."+this.contratante);
        }
        super.actuar();
    }
    @Override
    public int calcularCosto(){
        if (this.motivo.toLowerCase().equals("beneficiencia")){
            return 0;
        }else if (this.motivo.toLowerCase().equals("tv")){
            return 50000;
        }else{
            return 150000;
        }
    }

}
