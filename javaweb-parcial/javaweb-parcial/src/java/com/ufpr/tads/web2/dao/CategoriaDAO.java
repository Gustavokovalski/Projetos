/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Categoria;
import com.ufpr.tads.web2.beans.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author TC823830
 */
public class CategoriaDAO {

    Categoria obter(int id) throws Exception {
        Connection con = ConnectionFactory.getConnection();
        Categoria categoria = null;
            String sql = "SELECT * FROM tb_categoria WHERE id_categoria = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                categoria = new Categoria();
                categoria.setId(rs.getInt(1));
                categoria.setNome(rs.getString(2));
            }
        st.close();con.close();
        return categoria;
    }
    
}
