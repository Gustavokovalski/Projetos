/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Categoria;
import com.ufpr.tads.web2.beans.Perfil;
import com.ufpr.tads.web2.beans.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author SAMUEL
 */
class PerfilDAO {

    Perfil obter(int id) throws Exception {
        Connection con = ConnectionFactory.getConnection();
        Perfil perfil = null;
            String sql = "SELECT * FROM tb_perfil WHERE id_perfil = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                perfil = new Perfil();
                perfil.setId(rs.getInt(1));
                perfil.setNome(rs.getString(2));
            }
            st.close();con.close();
        return perfil;    }
    
}
