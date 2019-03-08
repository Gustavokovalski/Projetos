/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.*;
import com.ufpr.tads.web2.dao.*;
import com.ufpr.tads.web2.facade.UsuariosFacade;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
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
 * @author SAMUEL
 */
@WebServlet(name = "ClientesServlet", urlPatterns = {"/ClientesServlet"})
public class ClientesServlet extends HttpServlet {

    

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
            throws ServletException, IOException, Exception {
        
        RequestDispatcher rd = null;
        ServletContext ctx = request.getServletContext();
        HttpSession session = request.getSession();
        int id;
        try {
            id = ((LoginBean)session.getAttribute("loginBean")).getId();
        } catch (Exception e) {
            id = 0;
        }
        String action = (String)request.getParameter("action");
        
          
            int idCliente = 0;
            Usuario cliente = null;
            EstadoDAO estadoDAO = new EstadoDAO();
            CidadeDAO cidadeDAO = new CidadeDAO();
            List<Estado> estados = null;
            Estado estado = null;
            Cidade cidade = null;
            Perfil perfil = null;
            if (action == null) {
                if (id == 0) {
                    rd = getServletContext().getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }  else {
                   List<Usuario> lista = UsuariosFacade.buscarTodos();
                  rd = getServletContext().getRequestDispatcher("/portal.jsp");
                  request.setAttribute("clientes", lista);                   
                }
               
               rd.forward(request, response);               
            } else if (action.equals("show")){
                idCliente = Integer.parseInt(request.getParameter("id"));
                cliente = UsuariosFacade.obter(idCliente);
                if (cliente != null) {
                    rd = getServletContext().getRequestDispatcher("/clientesVisualizar.jsp");
                    request.setAttribute("cliente", cliente);
                    rd.forward(request, response);
                }
            }
                else if (action.equals("formCliente")) {
                    idCliente = Integer.parseInt(request.getParameter("id"));
                    cliente = UsuariosFacade.obter(idCliente);
                    estados = estadoDAO.listar();
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("estados", estados);
                    request.setAttribute("cidadeSelecionada", cliente.getCidade());
                    request.setAttribute("form", "alterar");
                    rd = ctx.getRequestDispatcher("/clientesForm.jsp");
                    rd.forward(request, response);
                } else if (action.equals("listarAtendimentos")) {
                    idCliente = Integer.parseInt(request.getParameter("id"));
                    AtendimentoDAO atendimentoDAO = new AtendimentoDAO();
                    List<Atendimento> atendimentos = atendimentoDAO.listarPorCliente(idCliente);
                    request.setAttribute("atendimentos", atendimentos);
                    rd = ctx.getRequestDispatcher("/atendimentoListar.jsp");
                    rd.forward(request, response);
                } else if (action.equals("atendimento")) {
                    idCliente = Integer.parseInt(request.getParameter("id"));
                    cliente = UsuariosFacade.obter(idCliente);
                    request.setAttribute("usuario", cliente);
                    rd = ctx.getRequestDispatcher("AtendimentoServlet");
                    rd.forward(request, response);
                }
                else if(action.equals("remove")) {
                    idCliente = Integer.parseInt(request.getParameter("id"));
                    UsuariosFacade.remover(idCliente); 
                    response.sendRedirect("ClientesServlet");
                }
                else if (action.equals("update")) {
                    cliente = new Usuario();
                    estado = new Estado();
                    cidade = new Cidade();
                    cliente.setId( (Integer.parseInt(request.getParameter("idCliente"))) );
                    cliente.setCpf( request.getParameter("cpf"));
                    cliente.setNome( request.getParameter("nome"));
                    cliente.setEmail( request.getParameter("email"));
                    cliente.setRua( request.getParameter("rua"));
                    cliente.setCep( request.getParameter("cep"));
                    cliente.setNumero(  Integer.parseInt(request.getParameter("numero")) );
                    try {
                        cidade = cidadeDAO.obter(Integer.parseInt(request.getParameter("cidade")));
                    } catch (Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);
                    }
                    cliente.setCidade(cidade);
                    UsuariosFacade.alterar(cliente);
                    response.sendRedirect("ClientesServlet");
                }
                else if (action.equals("formNew")) {
                    rd = getServletContext().getRequestDispatcher("/clientesForm.jsp");
                    try {
                        estados = estadoDAO.listar();
                    } catch (Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);
                    }
                    request.setAttribute("estados", estados);
                    rd.forward(request, response);
                }
                else if (action.equals("new")) {
                    cliente = new Usuario();
                    perfil = new Perfil();
                    perfil.setId(1);
                    perfil.setNome("cliente");
                    cliente.setPerfil(perfil);
                    cliente.setCpf(request.getParameter("cpf").replaceAll("\\W", ""));
                    cliente.setTelefone(request.getParameter("telefone").replaceAll("\\W", ""));
                    cliente.setNome(request.getParameter("nome"));
                    cliente.setEmail(request.getParameter("email"));
                    // criptografia da senha
                    String s = request.getParameter("senha");
                    MessageDigest m = MessageDigest.getInstance("MD5");
                    m.update(s.getBytes(),0,s.length());
                    cliente.setSenha(new BigInteger(1,m.digest()).toString(16));
                    
                    /*SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
                    String str = request.getParameter("data");   // Data como String
                    Date data = null;
                    try {
                            data = Date.valueOf(str); 
                    } 
                    catch (Exception e) {
                           rd = getServletContext().getRequestDispatcher("/inserir.jsp");
                           request.setAttribute("msg", e.getMessage());
                           rd.forward(request, response);
                    }

                    cliente.setData(data);*/
                    cliente.setRua(request.getParameter("rua"));
                    cliente.setBairro(request.getParameter("bairro"));
                    cliente.setComplemento(request.getParameter("complemento"));
                    cliente.setCep(request.getParameter("cep").replaceAll("\\W", ""));
                    cliente.setNumero(Integer.parseInt(request.getParameter("numero")));
                    try {
                        cidade = cidadeDAO.obter(Integer.parseInt(request.getParameter("cidade")));
                        cliente.setCidade(cidade);
                        UsuariosFacade.inserir(cliente);
                        response.sendRedirect("portal.jsp");
                    } catch (SQLException ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);
                    }
                }
                else if (action.equals("newUser")){
                    rd = getServletContext().getRequestDispatcher("/inserir.jsp");
                    try {
                        estados = estadoDAO.listar();
                    } catch (Exception ex) {
                        request.setAttribute("javax.servlet.jsp.jspException", ex );
                        request.setAttribute("javax.servlet.error.status_code", 500);
                        rd = getServletContext().getRequestDispatcher("/erro.jsp");
                        rd.forward(request, response);
                    }
                    request.setAttribute("estados", estados);
                    rd.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
       
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
