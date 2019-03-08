<%@page import="com.ufpr.tads.web2.beans.Atendimento"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty loginBean}">
    <jsp:forward page="/index.jsp"> 
        <jsp:param name="msg" value="Usuário precisa se autenticar para acessar o sistema" /> 
    </jsp:forward> 
</c:if>

<c:if test="${!usuario.perfil.nome.equals('cliente')}" >
    <jsp:forward page="/index.jsp"> 
        <jsp:param name="msg" value="Apenas clientes podem criar atendimentos" /> 
    </jsp:forward> 
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
            <h2>Solicitar Atendimento</h2>
        <form class="" method="POST" action="AtendimentoServlet">
          <input type="hidden" name="action" value="new" />

            <input hidden type="text" name="idCliente" id="idCliente" value="${usuario.id}" >
        <div class="form-group">
          <label for="inputCPF">Descrição</label>
          <textarea required class="form-control" id="inputDescricao" name="descricao"></textarea>
        </div>
        
        <div class="form-group">
          <label for="tipoAtendimento">Tipo Atendimento</label>
          <select required class="form-control" id="tipoAtendimento" name="tipoAtendimento">
              <c:forEach var="tipo" items="${tiposAtendimento}">
                    <option value='<c:out value="${tipo.id}"/>'> <c:out value="${tipo.nome}"/></option>
              </c:forEach>
          </select>
        </div>
        
        <div class="form-group">
          <label for="produto">Produto</label>
          <select required class="form-control" id="produto" name="produto">
              <c:forEach var="produto" items="${produtos}">
                    <option value='<c:out value="${produto.id}"/>'> <c:out value="${produto.nome}"/></option>
              </c:forEach>
          </select>
        </div>
              
        <button type="submit" class="btn btn-default">Salvar</button>
        <a href="/portal.jsp"><button type="button" class="btn btn-default">Cancelar</button></a>
      </form>

        <br>
        </div>
    </body>
</html>
