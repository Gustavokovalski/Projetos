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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TC823830
 */

public class AtendimentoDAO {
  public List<Atendimento> listar() throws Exception {
        TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        UsuarioDAO clienteDAO = new UsuarioDAO();
        ProdutoDAO produtoDAO = new ProdutoDAO();
        ArrayList <Atendimento> atendimentos = new ArrayList<Atendimento>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_atendimento";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setId(rs.getInt(1));
                atendimento.setDataHora(rs.getTimestamp(2));
                atendimento.setDescricao(rs.getString(3));
                TipoAtendimento tipoAtendimento = tipoAtendimentoDAO.obter(rs.getInt(4));
                atendimento.setTipoAtendimento(tipoAtendimento);
                Usuario usuario = usuarioDAO.obter(rs.getInt(5));
                atendimento.setCliente(usuario);
                atendimento.setStatus(rs.getString(6).charAt(0));
                Produto produto = produtoDAO.obter(rs.getInt(7));
                atendimento.setProduto(produto);
                atendimento.setSolucao(rs.getString(8));
                atendimentos.add(atendimento);
        }
            st.close();con.close();
       return atendimentos;
    }  
  
    public List<Atendimento> listarEmAberto() throws Exception {
        TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        UsuarioDAO clienteDAO = new UsuarioDAO();
        ArrayList <Atendimento> atendimentos = new ArrayList<Atendimento>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_atendimento WHERE res_atendimento = 'N'";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setId(rs.getInt(1));
                atendimento.setDataHora(rs.getTimestamp(2));
                atendimento.setDescricao(rs.getString(3));
                TipoAtendimento tipoAtendimento = tipoAtendimentoDAO.obter(rs.getInt(4));
                atendimento.setTipoAtendimento(tipoAtendimento);
                Usuario usuario = usuarioDAO.obter(rs.getInt(5));
                atendimento.setCliente(usuario);
                atendimento.setStatus(rs.getString(7).charAt(0));
                
                atendimentos.add(atendimento);
        }
            st.close();con.close();
       return atendimentos;
    }
  
    public List<Atendimento> listarPorCliente(int idCliente) throws Exception {
        TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        UsuarioDAO clienteDAO = new UsuarioDAO();
        ProdutoDAO produtoDAO = new ProdutoDAO();
        ArrayList <Atendimento> atendimentos = new ArrayList<Atendimento>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_atendimento WHERE id_cliente = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idCliente);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Atendimento atendimento = new Atendimento();
                atendimento.setId(rs.getInt(1));
                atendimento.setDataHora(rs.getTimestamp(2));
                atendimento.setDescricao(rs.getString(3));
                TipoAtendimento tipoAtendimento = tipoAtendimentoDAO.obter(rs.getInt(4));
                atendimento.setTipoAtendimento(tipoAtendimento);
                Usuario usuario = usuarioDAO.obter(rs.getInt(5));
                atendimento.setCliente(usuario);
                Usuario cliente = clienteDAO.obter(rs.getInt(6));
                atendimento.setCliente(cliente);
                atendimento.setStatus(rs.getString(7).charAt(0));
                atendimento.setProduto(produtoDAO.obter(rs.getInt(8)));
                atendimento.setSolucao(rs.getString(9));
                atendimentos.add(atendimento);
        }
            st.close();con.close();
       return atendimentos;
    } 
    
    
    public boolean cadastrar(Atendimento atendimento) throws Exception {
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "INSERT INTO tb_atendimento(dt_hr_atendimento, dsc_atendimento, id_tipo_atendimento, id_usuario, id_cliente, res_atendimento) VALUES (NOW(), ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, atendimento.getDescricao());
        st.setInt(2, atendimento.getTipoAtendimento().getId());
        st.setInt(3, atendimento.getCliente().getId());
        st.setInt(4, atendimento.getCliente().getId());
        st.setString(5, String.valueOf(atendimento.getStatus()));
        st.execute();
        result = true;
        st.close();con.close();
        return result;
    } 
    
     public Atendimento obter(int id) throws Exception{
        TipoAtendimentoDAO tipoAtendimentoDAO = new TipoAtendimentoDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        UsuarioDAO clienteDAO = new UsuarioDAO();
        Atendimento atendimento = null;
        Estado estado = null;
        Cidade cidade = null;
        Connection con = ConnectionFactory.getConnection();
        
            String sql = "SELECT * FROM tb_atendimento C, tb_cidade CD, tb_estado E WHERE id_atendimento = ? AND C.id_cidade = CD.id_cidade AND CD.id_estado = E.id_estado;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                atendimento = new Atendimento();
                atendimento.setId(rs.getInt(1));
                atendimento.setDataHora(rs.getTimestamp(2));
                atendimento.setDescricao(rs.getString(3));
                TipoAtendimento tipoAtendimento = tipoAtendimentoDAO.obter(rs.getInt(4));
                atendimento.setTipoAtendimento(tipoAtendimento);
                Usuario usuario = usuarioDAO.obter(rs.getInt(5));
                atendimento.setCliente(usuario);
                atendimento.setStatus(rs.getString(7).charAt(0));
            }
            st.close();con.close();
        return atendimento;
    } 
     
    public boolean remover(int id) throws Exception{
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "DELETE FROM tb_atendimento WHERE id_atendimento = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        st.execute();
        result = true;
        st.close();con.close();
        return result;
    }
    
    public boolean atualizar(Atendimento atendimento) throws Exception {
        Connection con = ConnectionFactory.getConnection();
            String sql = "UPDATE tb_atendimento SET dt_hr_atendimento = ?, dsc_atendimento = ?, id_tipo_atendimento = ?, "
                    + "id_cliente = ?, res_atendimento = ?, id_produto = ?, solucao_atendimento = ? WHERE id_atendimento = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setTimestamp(1, atendimento.getDataHora());
            st.setString(2, atendimento.getDescricao());
            st.setInt(3, atendimento.getTipoAtendimento().getId());
            st.setInt(4, atendimento.getCliente().getId());
            st.setString(5, String.valueOf(atendimento.getStatus()));
            st.setInt(6, atendimento.getProduto().getId());
            st.setString(7, atendimento.getSolucao());
            st.setInt(8, atendimento.getId());
            st.executeUpdate();
            st.close();con.close();
            return true;
    }
    
}
