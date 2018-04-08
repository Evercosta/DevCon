/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.db;

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
public class CondominoDao {
    private final Connection c;
    public CondominoDao() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    public Condomino busca(Condomino cond) throws SQLException{
        String sql = "select * from condomino WHERE regCondomino = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,cond.getRegCondomino());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Condomino
                cond.setRegCondomino(rs.getInt(1));
                cond.setNome(rs.getString(2));
                cond.setEmail(rs.getString(3));            
                // adiciona o cond à lista de condominos
            }
        return cond;
    }
    
    public Condomino altera(Condomino cond) throws SQLException{
        String sql = "UPDATE condomino SET nome = ?, email = ? WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,cond.getNome());
        stmt.setString(2,cond.getEmail());
        stmt.setInt(3,cond.getRegCondomino());
        // executa
        stmt.execute();
        stmt.close();
        return cond;
    }

    public Condomino exclui(Condomino cond) throws SQLException{
        String sql = "delete from condomino WHERE id = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,cond.getRegCondomino());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return cond;
    }
    
    public List<Condomino> listaTodos() throws SQLException{
         // conds: array armazena a lista de registros

        List<Condomino> conds = new ArrayList<Condomino>();
        
        String sql = "select * from condomino";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Condomino
            Condomino cond = new Condomino(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3)               
            );
            // adiciona o cond à lista de conds
            conds.add(cond);
        }
        
        rs.close();
        stmt.close();
        return conds;        
    }
    
    public Condomino inseri(Condomino cond) throws SQLException{
        String sql = "insert into condomino" + " (nome, email)" + " values (?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setString(1,cond.getNome());
        stmt.setString(2,cond.getEmail());    

        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            cond.setRegCondomino(id);
        }
        stmt.close();
        return cond;
    }
}
