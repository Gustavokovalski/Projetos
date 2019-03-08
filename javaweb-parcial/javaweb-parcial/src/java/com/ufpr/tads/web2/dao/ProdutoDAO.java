/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Produto;
import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.Categoria;
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
public class ProdutoDAO {
    public List<Produto> listar() throws Exception {
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        UsuarioDAO clienteDAO = new UsuarioDAO();
        ArrayList <Produto> produtos = new ArrayList<Produto>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_produto";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt(1));
                produto.setNome(rs.getString(2));
                produto.setDescricao(rs.getString(3));
                produto.setPeso(rs.getDouble(4));
                Categoria categoria = categoriaDAO.obter(rs.getInt(5));
                produto.setCategoria(categoria);
                produtos.add(produto);
        }
       return produtos;
    }  
    
    
    public boolean cadastrar(Produto produto) throws Exception {
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "INSERT INTO tb_produto(nome_produto, desc_produto, peso_produto, id_categoria VALUES (?, ?, ? ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, produto.getNome());
        st.setString(2, produto.getDescricao());
        st.setDouble(3, produto.getPeso());
        st.setInt(4, produto.getCategoria().getId());
        st.execute();
        result = true;
        return result;
    } 
    
     public Produto obter(int id) throws Exception{
        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Connection con = ConnectionFactory.getConnection();
        Produto produto = null;
            String sql = "SELECT * FROM tb_produto WHERE id_produto = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                produto = new Produto();
                produto.setId(rs.getInt(1));
                produto.setNome(rs.getString(2));
                produto.setDescricao(rs.getString(3));
                produto.setPeso(rs.getDouble(4));
                Categoria categoria = categoriaDAO.obter(rs.getInt(5));
                produto.setCategoria(categoria);
            }
            st.close();con.close();
        return produto;
    } 
     
    public boolean remover(int id) throws Exception{
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "DELETE FROM tb_produto WHERE id_produto = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        st.execute();
        result = true;
        st.close();con.close();
        return result;
    }
    
    public boolean atualizar(Produto produto) throws Exception {
        Connection con = ConnectionFactory.getConnection();
            String sql = "UPDATE tb_produto SET nome_produto = ?, desc_produto = ?, peso_produto = ?, "
                    + "id_categoria = ? WHERE id_produto = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, produto.getNome());
            st.setString(2, produto.getDescricao());
            st.setDouble(3, produto.getPeso());
            st.setInt(4, produto.getCategoria().getId());
            st.setInt(5, produto.getId());
            st.executeUpdate();
            st.close();con.close();
            return true;
    }
}
