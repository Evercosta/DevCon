/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.controler;

import br.com.fatec.bean.Apartamento;
import br.com.fatec.db.ApartamentoDao;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Everton
 */
public class ApartamentoControler {
    public Apartamento inserirApartamento(Apartamento ap) throws SQLException, ClassNotFoundException {
        ApartamentoDao apDao = new ApartamentoDao();
        ap = apDao.inseri(ap);
        return ap;
    }
    public List<Apartamento> listarTodosApartamento() throws SQLException, ClassNotFoundException {
        List<Apartamento>  aps ;
        ApartamentoDao apDao = new ApartamentoDao();
        aps = apDao.listaTodos();
        return aps;
    }
    public Apartamento alterarApartamento(Apartamento ap) throws SQLException, ClassNotFoundException {
        ApartamentoDao apDao = new ApartamentoDao();
        ap = apDao.altera(ap);
        return ap;
    }
    public Apartamento excluirApartamento(Apartamento ap) throws SQLException, ClassNotFoundException {
        ApartamentoDao apDao = new ApartamentoDao();
        ap = apDao.exclui(ap);
        return ap;
    }
}
