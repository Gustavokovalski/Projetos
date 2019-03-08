<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginBean}">
    <jsp:forward page="/index.jsp"> 
        <jsp:param name="msg" value="Usuário precisa se autenticar para acessar o sistema" /> 
    </jsp:forward> 
</c:if>


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
            <h2>${cliente.nome}</h2>
        <div class="jumbotron">
            <h5><strong>CPF:</strong> ${cliente.cpf}</h5>
        <h5><strong>Email: </strong>${cliente.email}</h5>
        <h5><strong>Data de Nascimento:</strong> ${cliente.data}</h5>
        <h5><strong>Rua: </strong>${cliente.rua}</h5>
        <h5><strong>Número:</strong> ${cliente.numero}</h5>
        <h5><strong>CEP: </strong>${cliente.cep}</h5>
        <h5><strong>Estado:</strong> ${cliente.cidade.estado.nome}</h5>
        <h5><strong>Cidade:</strong> ${cliente.cidade.nome}</h5>
        <a href="ClientesServlet"><button type="button" class="btn btn-primary">Retornar</button></a>
      </div>

        <br>
        </div>
    </body>
  
</html>
