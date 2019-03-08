/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SAMUEL
 */
public class EstadoDAO {
    public List<Estado> listar() throws Exception {
        ArrayList <Estado> estados = new ArrayList<Estado>();
        Connection con = ConnectionFactory.getConnection();
        String sql = "SELECT * FROM tb_estado";
        PreparedStatement st = con.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Estado estado = new Estado();
            estado.setId(rs.getInt(1));
            estado.setNome(rs.getString(2));
            estado.setSigla(rs.getString(3));
            estados.add(estado);
        }
        st.close();con.close();
        return estados;
    }
}
