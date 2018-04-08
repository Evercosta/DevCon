/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.bean;

/**
 *
 * @author Everton
 */
public class Apartamento {
    private int idAp;
    private String bloco;
    private String andar;
    private int numero;
    
    public Apartamento(int idAp,String bloco,String andar,int numero){
        this.idAp=idAp;
        this.bloco=bloco;
        this.andar=andar;
        this.numero=numero;
    }

    public int getIdAp() {
        return idAp;
    }

    public void setIdAp(int idAp) {
        this.idAp = idAp;
    }

    public String getBloco() {
        return bloco;
    }

    public void setBloco(String bloco) {
        this.bloco = bloco;
    }

    public String getAndar() {
        return andar;
    }

    public void setAndar(String andar) {
        this.andar = andar;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
    
}
