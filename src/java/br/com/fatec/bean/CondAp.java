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
public class CondAp {
    private int idCondAp;
    private Condomino condomino;
    private Apartamento apartamento;
    
    public CondAp(int idCondAp,Condomino condomino,Apartamento apartamento){
        this.idCondAp=idCondAp;
        this.condomino=condomino;
        this.apartamento=apartamento;
    }   

    public int getIdCondAp() {
        return idCondAp;
    }

    public void setIdCondAp(int idCondAp) {
        this.idCondAp = idCondAp;
    }

    public Condomino getCondomino() {
        return condomino;
    }

    public void setCondomino(Condomino condomino) {
        this.condomino = condomino;
    }

    public Apartamento getApartamento() {
        return apartamento;
    }

    public void setApartamento(Apartamento apartamento) {
        this.apartamento = apartamento;
    }
    
}
