/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

/**
 *
 * @author SAMUEL
 */
@WebServlet(name = "StartupServlet", urlPatterns = {"/StartupServlet"}, loadOnStartup = 1)
public class StartupServlet extends HttpServlet {
    
    public void init(ServletConfig config) throws ServletException {
        ConfigBean conf = new ConfigBean();
        conf.setEmail("admin@google.com");
        
        ServletContext ctx = config.getServletContext();
        ctx.setAttribute("configuracao", conf.getEmail());
    }
}
