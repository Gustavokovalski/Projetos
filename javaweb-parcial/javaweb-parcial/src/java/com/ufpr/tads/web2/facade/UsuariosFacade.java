/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.UsuarioDAO;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 *
 * @author SAMUEL
 */
public class UsuariosFacade {
    public static void inserir(Usuario c) throws Exception {
        UsuarioDAO clienteDAO = new UsuarioDAO();
        clienteDAO.inserirCliente(c);
    }
    public static void alterar(Usuario c) {
        try {
            UsuarioDAO clienteDAO = new UsuarioDAO();;
            clienteDAO.alterarCliente(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public static Usuario obter(int id) throws Exception{
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.obter(id);
        return usuario;
    }
    public static List<Usuario> buscarTodos() throws Exception {
        UsuarioDAO clienteDAO = new UsuarioDAO();
        List <Usuario> clientes = clienteDAO.listar(); 
        return clientes;
    }
    
    public static void remover(int id) throws Exception {
        UsuarioDAO clienteDAO = new UsuarioDAO();
        clienteDAO.remover(id); 
    }


}
