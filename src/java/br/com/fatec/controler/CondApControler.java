/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.controler;

import br.com.fatec.bean.CondAp;
import br.com.fatec.db.CondApDao;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Everton
 */
public class CondApControler {
    public CondAp inserirCondAp(CondAp cp) throws SQLException, ClassNotFoundException {
        CondApDao cpDao = new CondApDao();
        cp = cpDao.inseri(cp);
        return cp;
    }
    public List<CondAp> listarTodosCondAp() throws SQLException, ClassNotFoundException {
        List<CondAp>  aps ;
        CondApDao apDao = new CondApDao();
        aps = apDao.listaTodos();
        return aps;
    }
    public CondAp alterarCondAp(CondAp cp) throws SQLException, ClassNotFoundException {
        CondApDao apDao = new CondApDao();
        cp = apDao.altera(cp);
        return cp;
    }
    public CondAp excluirCondAp(CondAp cp) throws SQLException, ClassNotFoundException {
        CondApDao apDao = new CondApDao();
        cp = apDao.exclui(cp);
        return cp;
    }
}
