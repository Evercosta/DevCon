/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec.db;

import br.com.fatec.bean.Apartamento;
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
public class ApartamentoDao {
    private final Connection c;
    public ApartamentoDao() throws SQLException, ClassNotFoundException{
        this.c = new ConexaoDB().getConnection();
    }
    public Apartamento busca(Apartamento ap) throws SQLException{
        String sql = "select * from apartamento WHERE idAp = ?";
        
        PreparedStatement stmt = this.c.prepareStatement(sql);
            // seta os valores
            stmt.setInt(1,ap.getIdAp());
            // executa
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                // criando o objeto Apartamento
                ap.setIdAp(rs.getInt(1));
                ap.setBloco(rs.getString(2));
                ap.setAndar(rs.getString(3));
                ap.setNumero(rs.getInt(4));               
                           
                // adiciona o ap à lista de apartamentos
            }
        return ap;
    }
    
    public Apartamento altera(Apartamento ap) throws SQLException{
        String sql = "UPDATE apartamento SET bloco = ?, andar = ?, numero = ? WHERE idAp = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setString(1,ap.getBloco());
        stmt.setString(2,ap.getAndar());
        stmt.setInt(3,ap.getNumero());
        stmt.setInt(4,ap.getIdAp());
        // executa
        stmt.execute();
        stmt.close();
        return ap;
    }

    public Apartamento exclui(Apartamento ap) throws SQLException{
        String sql = "delete from apartamento WHERE idAp = ?";
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql);
        // seta os valores
        stmt.setInt(1,ap.getIdAp());
        // executa
        stmt.execute();
        stmt.close();
        c.close();
        return ap;
    }
    
    public Apartamento inseri(Apartamento ap) throws SQLException{
        String sql = "insert into apartamento" + " (bloco, andar, numero)" + " values (?,?,?)";
    
        // prepared statement para inserção
        PreparedStatement stmt = c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);

        // seta os valores
        stmt.setString(1,ap.getBloco());
        stmt.setString(2,ap.getAndar());
        stmt.setInt(3,ap.getNumero());

        // executa
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            int id = rs.getInt(1);
            ap.setIdAp(id);
        }
        stmt.close();
        return ap;
    }
    
    public List<Apartamento> listaTodos() throws SQLException{
         // conds: array armazena a lista de registros

        List<Apartamento> aps = new ArrayList<Apartamento>();
        
        String sql = "select * from apartamento";
        PreparedStatement stmt = this.c.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {      
            // criando o objeto Apartamento
            Apartamento ap = new Apartamento(
                rs.getInt(1),
                rs.getString(2),
                rs.getString(3),
                rs.getInt(4)
            );
            // adiciona o ap à lista de aps
            aps.add(ap);
        }
        
        rs.close();
        stmt.close();
        return aps;        
    }
}
