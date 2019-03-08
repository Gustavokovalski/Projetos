package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.dao.UsuarioDAO;
import com.ufpr.tads.web2.beans.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.ufpr.tads.web2.beans.*;
import java.util.logging.Level;
import java.util.logging.Logger;
 

@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // pega os dados passados pelo formulario de login
        String emailForm = request.getParameter("email");
        String senhaForm = request.getParameter("senha");
        // instancia um usuarioDAO para usar a função de consulta no banco
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        // consulta se o usuário existe no banco, e guarda o usuario retornado (pode ser null)
        Usuario usuario = null;
        try {
            usuario = usuarioDAO.autenticar(emailForm, senhaForm);
        } catch (Exception ex) {
            request.setAttribute("javax.servlet.jsp.jspException", ex );
            request.setAttribute("javax.servlet.error.status_code", 500);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/erro.jsp");
            rd.forward(request, response);
        }
        
        // se usuario veio null, então falhou o login
        if (usuario == null) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            request.setAttribute("msg", "Erro no login");
            dispatcher.forward(request,response);
        } else {
            
            LoginBean loginBean = new LoginBean(usuario.getId(), usuario.getEmail(), usuario.getPerfil());
            // usuário existe, então cria ou reutiliza uma sessão
            HttpSession session = request.getSession(true);
            // grava o login e a senha na sessão
            session.setAttribute("loginBean", loginBean);
            // redireciona para o portalservlet
            response.sendRedirect("portal.jsp");
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
