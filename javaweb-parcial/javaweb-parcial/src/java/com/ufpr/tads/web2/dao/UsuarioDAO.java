/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Date;

/**
 *
 * @author SAMUEL
 */
public class UsuarioDAO {
    public List<Usuario> listar() throws Exception {
        ArrayList <Usuario> usuarios = new ArrayList<Usuario>();
        Connection con = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM tb_usuario C, tb_estado E, tb_cidade CD, tb_perfil P WHERE C.id_cidade = CD.id_cidade AND CD.id_estado = E.id_estado AND C.id_perfil = P.id_perfil;";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                Estado estado = new Estado();
                Cidade cidade = new Cidade();
                Perfil perfil = new Perfil();
                usuario.setId(rs.getInt(1));
                usuario.setCpf(rs.getString(2));
                usuario.setNome(rs.getString(3));
                usuario.setEmail(rs.getString(4));
                perfil.setId(rs.getInt(13));
                if (perfil.getId() == 1) {
                    MessageDigest md = MessageDigest.getInstance("MD5");
                    byte[] arr = md.digest(new String().getBytes(rs.getString(5)));
                    usuario.setSenha(Base64.getEncoder().encodeToString(arr));                    
                } else {
                
                    usuario.setSenha(rs.getString(5));}

                usuario.setTelefone(rs.getString(6));
                usuario.setRua(rs.getString(7));
                usuario.setBairro(rs.getString(8));
                usuario.setNumero(rs.getInt(9));
                usuario.setCep(rs.getString(10));
                usuario.setComplemento(rs.getString(11));
                cidade.setId(rs.getInt(12));
                
                estado.setId(rs.getInt(14));
                estado.setNome(rs.getString(15));
                estado.setSigla(rs.getString(16));
                cidade.setNome(rs.getString(18));
                perfil.setNome(rs.getString(21));
                cidade.setEstado(estado);
                usuario.setPerfil(perfil);
                usuario.setCidade(cidade);
               
                usuarios.add(usuario);
        }
            st.close();con.close();
       return usuarios;
    }  
    
  public Usuario autenticar(String login, String senha) throws Exception{
        Usuario usu = null;
        CidadeDAO cidadeDAO = new CidadeDAO();
        PerfilDAO perfilDAO = new PerfilDAO();
        // obtém conexão com o banco
        Connection con = ConnectionFactory.getConnection();
        String query = "SELECT * FROM tb_usuario WHERE email_usuario = ? AND senha_usuario = ?";
        ArrayList<Usuario> usuarios = new ArrayList<>();
        PreparedStatement st = con.prepareStatement(query);
        st.setString(1, login);
        MessageDigest m = MessageDigest.getInstance("MD5");
        m.update(senha.getBytes(),0,senha.length());
        st.setString(2, new BigInteger(1,m.digest()).toString(16));
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            usu = new Usuario();
            usu.setId(rs.getInt(1));
            usu.setCpf(rs.getString(2));
            usu.setNome(rs.getString(3));
            usu.setEmail(rs.getString(4));
            usu.setSenha(rs.getString(5));
            usu.setTelefone(rs.getString(6));
            usu.setRua(rs.getString(7));
            usu.setBairro(rs.getString(8));
            usu.setNumero(rs.getInt(9));
            usu.setCep(rs.getString(10));
            usu.setComplemento(rs.getString(11));
            usu.setCidade(cidadeDAO.obter(rs.getInt(12)));
            usu.setPerfil(perfilDAO.obter(rs.getInt(13)));
        }
        st.close();con.close();
        return usu; // retorna o Usuario obtido 
        // se usuario não existir, vai retornar null
    }
    
    
    public boolean inserirCliente(Usuario usuario) throws Exception {
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "INSERT INTO tb_usuario(cpf_usuario, nome_usuario, email_usuario, senha_usuario, tel_usuario,"
                + "rua_usuario, bairro_usuario, nr_usuario, cep_usuario, complemento_usuario,"
                + "id_cidade, id_perfil) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, usuario.getCpf());
        st.setString(2, usuario.getNome());
        st.setString(3, usuario.getEmail());
        st.setString(4, usuario.getSenha());
        st.setString(5, usuario.getTelefone());
        st.setString(6, usuario.getRua());
        st.setString(7, usuario.getBairro());
        st.setInt(8, usuario.getNumero());
        st.setString(9, usuario.getCep());
        st.setString(10, usuario.getComplemento());
        st.setInt(11, usuario.getCidade().getId());
        st.setInt(12, usuario.getPerfil().getId());
        
        st.execute();
        result = true;

        return result;
    } 
    
     public Usuario obter(int id) throws Exception{
        Usuario usuario = new Usuario();
        Connection con = ConnectionFactory.getConnection();
        CidadeDAO cidadeDAO = new CidadeDAO();
        PerfilDAO perfilDAO = new PerfilDAO();
        String sql = "SELECT * FROM tb_usuario WHERE id_usuario = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        
        if (rs.next()){
            usuario.setId(rs.getInt(1));
            usuario.setCpf(rs.getString(2));
            usuario.setNome(rs.getString(3));
            usuario.setEmail(rs.getString(4));
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] arr = md.digest(new String().getBytes(rs.getString(5)));
            usuario.setSenha(Base64.getEncoder().encodeToString(arr));            
            usuario.setTelefone(rs.getString(6));
            usuario.setRua(rs.getString(7));
            usuario.setBairro(rs.getString(8));
            usuario.setNumero(rs.getInt(9));
            usuario.setCep(rs.getString(10));
            usuario.setComplemento(rs.getString(11));
            usuario.setCidade(cidadeDAO.obter(rs.getInt(12)));
            usuario.setPerfil(perfilDAO.obter(rs.getInt(13)));            
        }
        return usuario;
    } 
     
    public boolean remover(int id) throws Exception{
        boolean result = false;
        Connection con = ConnectionFactory.getConnection();
        String sql = "DELETE FROM tb_usuario WHERE id_usuario = ?";
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);
        st.execute();
        result = true;
        st.close();con.close();
        return result;
    }
    

    public boolean alterarCliente(Usuario usuario) throws Exception {
        Connection con = ConnectionFactory.getConnection();
            String sql = "UPDATE tb_usuario SET nome_usuario = ?, "
                    + "senha_usuario = ?, tel_usuario = ?, rua_usuario = ?, bairro_usuario = ?, nr_usuario = ? "
                    + "cep_usuario = ?, complemento_usuario = ?, id_cidade = ? WHERE id_usuario = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, usuario.getNome());
            st.setString(2, usuario.getSenha());
            st.setString(3, usuario.getTelefone());
            st.setString(4, usuario.getRua());
            st.setString(5, usuario.getBairro());
            st.setInt(6, usuario.getNumero());
            st.setString(7, String.valueOf(usuario.getCep()));
            st.setString(8, usuario.getComplemento());
            st.setInt(9, usuario.getCidade().getId());
            st.setInt(10, usuario.getId());
            st.executeUpdate();
            st.close();con.close();
            return true;
    }
    
}
