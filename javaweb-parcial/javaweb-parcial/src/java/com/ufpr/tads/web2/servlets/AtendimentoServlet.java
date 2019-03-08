/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.Cidade;
import com.ufpr.tads.web2.beans.Atendimento;
import com.ufpr.tads.web2.beans.Estado;
import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.beans.TipoAtendimento;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.CidadeDAO;
import com.ufpr.tads.web2.dao.EstadoDAO;
import com.ufpr.tads.web2.dao.ProdutoDAO;
import com.ufpr.tads.web2.dao.TipoAtendimentoDAO;
import com.ufpr.tads.web2.dao.UsuarioDAO;
import com.ufpr.tads.web2.facade.AtendimentoFacade;
import com.ufpr.tads.web2.facade.UsuariosFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TC823830
 */
@WebServlet(name = "AtendimentoServlet", urlPatterns = {"/AtendimentoServlet"})
public class AtendimentoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = null;
        ServletContext ctx = request.getServletContext();
        HttpSession session = request.getSession();
        int id;
        try {
            id = ((LoginBean)session.getAttribute("loginBean")).getId();
        } catch (Exception e) {
            id = 0;
        }
        
        if (id == 0) {
            rd = getServletContext().getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Usuario precisa estar autenticado para acessar o sistema");
            rd.forward(request, response);
        } else {
            String action = (String)request.getParameter("action");
            
            Usuario usuario = null;
            int idAtendimento = 0;
            Atendimento atendimento = null;
            EstadoDAO estadoDAO = null;
            CidadeDAO cidadeDAO = null;
            UsuarioDAO usuarioDAO = null;
            ProdutoDAO produtoDAO = null;
            TipoAtendimentoDAO tipoAtendimentoDAO = null;
            List<Estado> estados = null;
            Estado estado = null;
            Cidade cidade = null;
            if (action.equals("formAtendimento")) {
                    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                try {
                    usuario = UsuariosFacade.obter(idUsuario);
                    tipoAtendimentoDAO = new TipoAtendimentoDAO();
                    produtoDAO = new ProdutoDAO();
                    request.setAttribute("tiposAtendimento", tipoAtendimentoDAO.listar());
                    request.setAttribute("produtos", produtoDAO.listar());
                    request.setAttribute("usuario", usuario);
                    rd = ctx.getRequestDispatcher("/atendimentoCriar.jsp");
                    rd.forward(request, response);
                } catch (Exception ex) {
                    request.setAttribute("javax.servlet.jsp.jspException", ex );
                    request.setAttribute("javax.servlet.error.status_code", 500);
                    rd = getServletContext().getRequestDispatcher("/erro.jsp");
                    rd.forward(request, response);
                }
             } 
                else if (action.equals("new")) {
                    atendimento = new Atendimento();
                    DateFormat formatter;
                    formatter = new SimpleDateFormat("dd/MM/yyyy");
                    Date date = new Date();
                    try {
                     tipoAtendimentoDAO = new TipoAtendimentoDAO();
                     atendimento.setDescricao((String)request.getParameter("descricao"));
                     TipoAtendimento tipoAtendimento = tipoAtendimentoDAO.obter(Integer.parseInt(request.getParameter("tipoAtendimento")));
                     atendimento.setTipoAtendimento(tipoAtendimento);
                     int idCliente = Integer.parseInt(request.getParameter("idCliente"));
                     usuario = usuarioDAO.obter(idCliente);

                     atendimento.setCliente(usuario);
                     atendimento.setStatus('N');
                     atendimento.setSolucao(null);
                     AtendimentoFacade.inserir(atendimento);
                     response.sendRedirect("/portal.jsp");
                    } catch (Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);
                    }
            } else if (action.equals("listarAtendimentos")) {
                if (((String)request.getParameter("filter")).equals("todos")) {
                    try {
                        List<Atendimento> lista = AtendimentoFacade.buscarTodos();
                        rd = getServletContext().getRequestDispatcher("/atendimentoListar.jsp");
                        request.setAttribute("atendimentos", lista);
                        rd.forward(request, response);
                    } catch(Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);                
                    }
     
                }
                if (((String)request.getParameter("filter")).equals("abertos")) {
                    try {
                        List<Atendimento> lista = AtendimentoFacade.buscarAbertos();
                        rd = getServletContext().getRequestDispatcher("/atendimentoListar.jsp");
                        request.setAttribute("atendimentos", lista);
                        rd.forward(request, response);
                    } catch(Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);                
                    }
     
                }
            }
            
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
