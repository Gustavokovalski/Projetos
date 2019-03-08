<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page isErrorPage="true" %>

<%
  String pageReturn = (String)request.getAttribute("page");
  String msg = (String)request.getAttribute("msg");
  
    String email = (String)request.getServletContext().getAttribute("configuracao");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAC - BEIBE</title>
        <link href="https://bootswatch.com/3/superhero/bootstrap.css" rel="stylesheet">
        <style>
            #center {
                width: 60%;
                margin: 150px auto;
            }
        </style>
            
    </head>
    <body>
        <div class="container text-center" id="center">
            <h1 class="text-danger">Erro: ${pageContext.exception.message} </h1> 
            <h6>${pageContext.out.flush()}" /></h6>
            <h6>${pageContext.exception.printStackTrace(pageContext.response.writer)}</h6>
        <footer>
            <p> Em caso de problemas contactar o administrador: ${email}</p>
        </footer>
        </div>
    </body>
</html>
