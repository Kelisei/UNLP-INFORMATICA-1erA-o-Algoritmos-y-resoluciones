/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p5.EJ01;

/**
 *
 * @author alumnos
 */
public class Subsidio {
    private boolean otorgado;
    private double monto;
    private String motivo;

    public Subsidio(double monto, String motivo) {
        this.otorgado = false;
        this.monto = monto;
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
    @Override
    public String toString() {
        return "Subsidio{" + "otorgado=" + otorgado 
                + ", monto=" + monto 
                + ", motivo=" + motivo + '}';
    }
    
}
