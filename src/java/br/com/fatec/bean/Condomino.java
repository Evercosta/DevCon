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
public class Condomino{
    private int regCondomino;
    private String nome;
    private String email;
    
    public Condomino(int regCondomino,String nome,String email){        
        this.regCondomino=regCondomino;
        this.nome=nome;
        this.email=email;
    }

    public int getRegCondomino() {
        return regCondomino;
    }

    public void setRegCondomino(int regCondomino) {
        this.regCondomino = regCondomino;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

     
}
