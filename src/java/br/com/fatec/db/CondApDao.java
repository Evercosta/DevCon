/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.db;

import br.com.fatec.bean.Apartamento;
import br.com.fatec.bean.CondAp;
import br.com.fatec.bean.Condomino;
import br.com.fatec.util.ConexaoDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Everton
 */
public class CondApDao {
    private final Connection c;
    public CondApDao() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    public CondAp busca(CondAp cp) throws SQLException{
        String sql = "select * from cond_ap as cp inner join condomino as c on c.id=cp.idCond inner join apartamento as a on a.idAp=cp.idAp WHERE cp.idCondAp=?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,cp.getIdCondAp() );
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Condomino e Apartamento
                Condomino cond = new Condomino(rs.getInt(4),rs.getString(5),rs.getString(6));
                Apartamento ap = new Apartamento(rs.getInt(7),rs.getString(8),rs.getString(9),rs.getInt(10));
                // criando o objeto CondAp
                cp.setIdCondAp(rs.getInt(1));
                cp.setCondomino(cond);
                cp.setApartamento(ap);                                  
                           
                // adiciona o cp à lista de condAps
            }
        return cp;
    }
    
    public CondAp altera(CondAp cp) throws SQLException{
        String sql = "UPDATE cond_ap SET idCond = ?, idAp = ? WHERE idCondAp = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores       
        stmt.setInt(1,cp.getCondomino().getRegCondomino());
        stmt.setInt(2,cp.getApartamento().getIdAp());        
        stmt.setInt(3,cp.getIdCondAp());
        // executa
        stmt.execute();
        stmt.close();
        return cp;
    }

    public CondAp exclui(CondAp cp) throws SQLException{
        String sql = "delete from cond_ap WHERE idCondAp = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,cp.getIdCondAp());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return cp;
    }
    
    public CondAp inseri(CondAp cp) throws SQLException{
        String sql = "insert into cond_ap" + " (idCond, idAp)" + " values (?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores    
        stmt.setInt(1,cp.getCondomino().getRegCondomino());
        stmt.setInt(2,cp.getApartamento().getIdAp());
        
        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            cp.setIdCondAp(id);
        }
        stmt.close();
        return cp;
    }
    
    public List<CondAp> listaTodos() throws SQLException{
         // conds: array armazena a lista de registros

        List<CondAp> cps = new ArrayList<CondAp>();
        
        String sql = "select * from cond_ap as cp inner join condomino as c on c.id=cp.idCond inner join apartamento as a on a.idAp=cp.idAp";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            // criando o objeto Condomino e Apartamento
            Condomino cond = new Condomino(rs.getInt(4),rs.getString(5),rs.getString(6));
            Apartamento ap = new Apartamento(rs.getInt(7),rs.getString(8),rs.getString(9),rs.getInt(10));
            // criando o objeto CondAp
            CondAp cp = new CondAp(
                rs.getInt(1),
                cond,
                ap
            );
            // adiciona o ap à lista de condaps
            cps.add(cp);
        }
        
        rs.close();
        stmt.close();
        return cps;        
    }
}
