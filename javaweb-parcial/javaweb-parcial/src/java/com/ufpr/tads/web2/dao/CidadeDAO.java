/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SAMUEL
 */
public class CidadeDAO {
    public List<Cidade> listar(int estadoId) throws Exception {
        ArrayList <Cidade> cidades = new ArrayList<Cidade>();
        Connection con = ConnectionFactory.getConnection();
        String sql = "SELECT C.id_cidade, C.nome_cidade, C.id_estado, E.nome_estado, E.sigla_estado FROM tb_cidade C, tb_estado E where C.id_estado = E.id_estado AND C.id_estado = ?;";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, estadoId);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            Cidade cidade = new Cidade();
            Estado estado = new Estado();
            cidade.setId(rs.getInt(1));
            cidade.setNome(rs.getString(2));
            estado.setId(rs.getInt(3));
            estado.setNome(rs.getString(4));
            estado.setSigla(rs.getString(5));
            cidade.setEstado(estado);
            cidades.add(cidade);
        }
        st.close();con.close();
        return cidades;
    }
    
    public Cidade obter (int id) throws Exception {
        Usuario cliente = null;
        Estado estado = null;
        Cidade cidade = null;
        Connection con = ConnectionFactory.getConnection();
        String sql = "SELECT CD.id_cidade, CD.nome_cidade, E.id_estado, E.nome_estado, E.sigla_estado FROM tb_cidade CD, tb_estado E WHERE CD.id_estado = E.id_estado AND CD.id_cidade = ?;";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            cidade = new Cidade();
            estado = new Estado();
            cidade.setId(rs.getInt(1));
            cidade.setNome(rs.getString(2));
            estado.setId(rs.getInt(3));
            estado.setNome(rs.getString(4));
            estado.setSigla(rs.getString(5));
            cidade.setEstado(estado);
        }
        st.close();con.close();
        return cidade;
    } 
}
