/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.dao.AtendimentoDAO;
import com.ufpr.tads.web2.dao.AtendimentoDAO;
import java.util.List;

/**
 *
 * @author SAMUEL
 */
public class AtendimentoFacade {
     public static void inserir(Atendimento a) throws Exception {
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
        atendimentoDAO.cadastrar(a);
    }
     
    public static void atualizar(Atendimento a) throws Exception {
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();;
        atendimentoDAO.atualizar(a);
        
    }
    public static Atendimento buscar(int id) throws Exception{
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
        Atendimento cliente = atendimentoDAO.obter(id);
        return cliente;
    }
    public static List<Atendimento> buscarTodos() throws Exception {
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
        List <Atendimento> atendimentos = atendimentoDAO.listar(); 
        return atendimentos;
    }
    
    public static void remover(int id) throws Exception {
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
        atendimentoDAO.remover(id); 
    }

    public static List<Atendimento> buscarAbertos() throws Exception{
        AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
        List <Atendimento> atendimentos = atendimentoDAO.listarEmAberto();
        return atendimentos;
    }
}
