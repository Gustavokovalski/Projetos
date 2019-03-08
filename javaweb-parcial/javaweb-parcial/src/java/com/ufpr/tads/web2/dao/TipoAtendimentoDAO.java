/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.beans.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TC823830
 */
public class TipoAtendimentoDAO {

public List<TipoAtendimento> listar() throws Exception {
        ArrayList <TipoAtendimento> tipoAtendimentos = new ArrayList<TipoAtendimento>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_tipo_atendimento";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TipoAtendimento tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setId(rs.getInt(1));
                tipoAtendimento.setNome(rs.getString(2));
                tipoAtendimentos.add(tipoAtendimento);
        }
       return tipoAtendimentos;
    }  
    
    
    public boolean cadastrar(TipoAtendimento tipoAtendimento) throws Exception {
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "INSERT INTO tb_tipo_atendimento(nome_tipo_atendimento) VALUES (?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, tipoAtendimento.getNome());
        st.execute();
        result = true;

        return result;
    } 
    
     public TipoAtendimento obter(int id) throws Exception{
        TipoAtendimento tipoAtendimento = null;
        Connection con = ConnectionFactory.getConnection();
        
            String sql = "SELECT * FROM tb_tipo_atendimento WHERE id_tipo_atendimento = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                tipoAtendimento = new TipoAtendimento();
                tipoAtendimento.setId(rs.getInt(1));
                tipoAtendimento.setNome(rs.getString(2));
            }
            st.close();con.close();
        return tipoAtendimento;
    } 
     
    public boolean remover(int id) throws Exception{
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "DELETE FROM tb_tipo_atendimento WHERE id_tipoAtendimento = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        st.execute();
        result = true;
        st.close();con.close();
        return result;
    }
    
    public boolean atualizar(TipoAtendimento tipoAtendimento) throws Exception {
        Connection con = ConnectionFactory.getConnection();
            String sql = "UPDATE tb_tipo_atendimento SET nome_tipo_atendimento = ? WHERE id_tipo_atendimento = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, tipoAtendimento.getNome());
            st.setInt(2, tipoAtendimento.getId());
            st.executeUpdate();
            st.close();con.close();
            return true;
    }
    
}
