<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>


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
        <h1> Bem vindo</h1>
        <nav class="navbar navbar-default">
            
            <c:if test="${loginBean.perfil.nome.equals('cliente')}">
                <a class="btn btn-default" href="ClientesServlet?action=formCliente&id=${loginBean.id} "><strong class="text-info">Alterar Dados</strong></a>
                <a class="btn btn-default" href="ClientesServlet?action=listarAtendimentos&id=${loginBean.id} "><strong class="text-info">Meus Atendimentos</strong></a>
                <a class="btn btn-default" href="AtendimentoServlet?action=formAtendimento&idUsuario=${loginBean.id} "><strong class="text-info">Solicitar Atendimento</strong></a>
                <a class="btn btn-default" href="LogoutServlet"><strong class="text-warning">Logout</strong></a>  
             </c:if>
            <c:if test="${loginBean.perfil.nome.equals('funcionario')}">
                <a class="btn btn-default" href="AtendimentoServlet?action=listarAtendimentos&filter=abertos&id=${loginBean.id} "><strong class="text-info">Atendimentos em Aberto</strong></a>
                <a class="btn btn-default" href="AtendimentoServlet?action=listarAtendimentos&filter=todos"><strong class="text-info">Todos os Atendimentos</strong></a>
                <a class="btn btn-default" href="/cadastrarCategoria.jsp"><strong class="text-info">Cadastrar Categoria</strong></a>
                <a class="btn btn-default" href="/cadastrarProduto.jsp"><strong class="text-info">Cadastrar Produto</strong></a>
                <a class="btn btn-default" href="LogoutServlet"><strong class="text-warning">Logout</strong></a>  
             </c:if>
            <c:if test="${loginBean.perfil.nome.equals('gerente')}">
                <a class="btn btn-default" href="ClientesServlet?action=formCliente&id=${loginBean.id} "><strong class="text-info">Alterar Dados</strong></a>
                <a class="btn btn-default" href="ClientesServlet?action=listarAtendimentos&id=${loginBean.id} "><strong class="text-info">Meus Atendimentos</strong></a>
                <a class="btn btn-default" href="ClientesServlet?action=atendimento&id=${loginBean.id} "><strong class="text-info">Solicitar Atendimento</strong></a>
                <a class="btn btn-default" href="LogoutServlet"><strong class="text-warning">Logout</strong></a>  
             </c:if>
        </nav>

        <br>
        </div>
    </body>
</html>

