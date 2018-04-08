/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.controler;

import br.com.fatec.bean.Condomino;
import br.com.fatec.db.CondominoDao;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Everton
 */
public class CondominoControler {
    public Condomino inserirCondomino(Condomino cond) throws SQLException, ClassNotFoundException {
        CondominoDao condDao = new CondominoDao();
        cond = condDao.inseri(cond);
        return cond;
    }
    public List<Condomino> listarTodosCondomino() throws SQLException, ClassNotFoundException {
        List<Condomino>  conds ;
        CondominoDao condDao = new CondominoDao();
        conds = condDao.listaTodos();
        return conds;
    }
    public Condomino alterarCondomino(Condomino cond) throws SQLException, ClassNotFoundException {
        CondominoDao condDao = new CondominoDao();
        cond = condDao.altera(cond);
        return cond;
    }
    public Condomino excluirCondomino(Condomino cond) throws SQLException, ClassNotFoundException {
        CondominoDao condDao = new CondominoDao();
        cond = condDao.exclui(cond);
        return cond;
    }
}
