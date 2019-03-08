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
            <h1>Cadastrar novo usuário</h1>
            <form action="CadastrarUsuarioServlet" method="POST">
                <div class="form-group">
               <label for="inputUsuario">Usuario</label>
             <input name="usuario" type="text" class="form-control" id="inputUsuario" placeholder="Usuario">
             </div>
              <div class="form-group">
               <label for="inputNome">Nome</label>
                <input name="nome" type="text" class="form-control" id="inputNome" placeholder="Nome">
              </div>
              <div class="form-group">
                <label for="inputSenha">Senha</label>
                <input name="senha" type="password" class="form-control" id="exampleInputSenha" placeholder="Senha">
             </div>
             <button type="submit" class="btn btn-default">Salvar</button>
              </form>
        </div>
        
    </body>
</html>
