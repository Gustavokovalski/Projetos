<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ufpr.tads.web2.dao.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Cliente"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@ page errorPage="erro.jsp" %>

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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <style>
            #center {
              width: 60%;
              margin: 150px auto;
            }
            #center th {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container text-center" id="center">
        <h1>Bem vindo, ${loginBean.nome}</h1>
        

              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>CPF</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th></th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="cliente" items="${clientes}">
                   <tr>
                    <td> ${cliente.getCpf()} </td>
                    <td> ${cliente.getNome()}  </td>
                    <td> ${cliente.getEmail()}  </td>
                    <td>
                        <a href="ClientesServlet?action=show&id=${cliente.getId()} "><i class="fas fa-search"></i></a>
                    </td>
                    
                    <td>
                        <a href="ClientesServlet?action=formUpdate&id=${cliente.getId()}"><i class="fas fa-edit"></i></a>
                    </td>
                    
                    <td>
                        <a onclick="return confirm('Deseja remover o cliente?')" href="ClientesServlet?action=remove&id=${cliente.getId()}"><i class="fas fa-trash-alt"></i></a>
                    </td>
                    
                  </tr>                   
                </c:forEach>
                     
                  
                </tbody>
              </table> 
              <a class="btn btn-default text-info" href="ClientesServlet?action=formNew"><strong class="text-success">Inserir novo</strong></a>   
        <br>
        </div>
    </body>
</html>
