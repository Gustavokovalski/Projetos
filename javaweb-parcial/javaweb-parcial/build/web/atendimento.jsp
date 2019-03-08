<%@page import="com.ufpr.tads.web2.beans.Atendimento"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginBean}">
    <jsp:forward page="/index.jsp"> 
        <jsp:param name="msg" value="Usuário precisa se autenticar para acessar o sistema" /> 
    </jsp:forward> 
</c:if>

<c:if test="${requestScope.form == 'alterar'}" >
    <c:set value="Editar Cliente" var="acaoPagina" />
    <c:set value="Alterar" var="nomeBotao" />
    <c:set value="update" var="servletAction" />
</c:if>

<c:if test="${requestScope.form != 'alterar'}" >
    <c:set value="Cadastrar Cliente" var="acaoPagina" />
    <c:set value="Salvar" var="nomeBotao" />
    <c:set value="new" var="servletAction" />
</c:if>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>

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
            <h2>${acaoPagina}</h2>
        <form class="" method="POST" action="AtendimentoServlet">
          <input type="hidden" name="action" value="${servletAction}" />

            <input hidden type="text" name="idCliente" id="idCliente" value="${atendimento.id}" >
        <div class="panel-body">
            Cód: ${atendimento.id}
        </div>
        <div class="panel-body">
            Data: ${atendimento.dataHora}
        </div>
        <div class="panel-body">
            Descrição: ${atendimento.descricao}
        </div>
        <div class="panel-body">
            Tipo: ${atendimento.tipoAtendimento.nome}
        </div>
        <div class="panel-body">
            Produto: ${atendimento.produto.nome}
        </div>
        <div class="panel-body">
            Funcionário: ${atendimento.funcionario.nome}
        </div>
        <div class="panel-body">
            Cliente: ${atendimento.cliente.nome}
        </div>
        <div class="panel-body">
            Status: ${atendimento.status}
        </div>
        <div class="form-group">
          <label for="inputSolucao">Solução do atendimento:</label>
          <textarea required class="form-control" id="inputSolucao" name="solucaoAtendimento" value="${atendimento.descSolucao}"></textarea>
        </div>
        <button type="submit" class="btn btn-default">${nomeBotao}</button>
        <a href="/portal.jsp"><button type="button" class="btn btn-default">Cancelar</button></a>
      </form>

        
        <br>
        </div>
    </body>
   
</html>
