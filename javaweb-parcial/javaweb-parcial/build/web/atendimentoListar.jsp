<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.ufpr.tads.web2.beans.Atendimento"%>
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
              margin: 100px auto;
            }
            #center th {
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container text-center" id="center">
        <h1>Atendimentos</h1>
        

              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Cód.</th>
                    <th>Data</th>
                    <th>Descrição</th>
                    <th>Tipo</th>
                    <th>Produto</th>
                    <th>Cliente</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="atendimento" items="${atendimentos}">
                   <tr>
                    <td> ${atendimento.id} </td>
                    <td> ${atendimento.dataHora}  </td>
                    <td> ${atendimento.descricao}  </td>
                    <td> ${atendimento.tipoAtendimento.nome}</td>
                    <td> ${atendimento.produto.nome}</td>
                    <td> ${atendimento.cliente.nome}</td>
                    <td> ${atendimento.status}</td>
                   <td>
                        <a onclick="return confirm('Deseja remover o atendimento?')" href="AtendimentoServlet?action=remove&id=${atendimento.getId()}"><i class="fas fa-trash-alt"></i></a>
                    </td>
                    
                    <td>
                        <a href="AtendimentoServlet?action=atender&id=${atendimento.getId()}"><i class="fas fa-edit"></i></a>
                    </td>
                  </tr>                   
                </c:forEach>
                     
                  
                </tbody>
              </table> 
              <a class="btn btn-default text-info" href="AtendimentoServlet?action=formNew"><strong class="text-success">Inserir novo</strong></a>   
        <br>
        </div>
    </body>
</html>
