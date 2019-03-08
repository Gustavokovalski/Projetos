<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SAC - BEIBE</title>

    <!-- Bootstrap -->
    <link href="https://bootswatch.com/3/superhero/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
    	#center {
    		width: 30%;
    		margin: 150px auto;
    	}
    </style>
  </head>
  <body>
	<div class="container text-center" id="center">
            <c:if test="${not empty msg}">
                <div class="alert">
                    <span class="text-danger"><strong>${msg} </strong></span>
                </div>
            </c:if>
		<h1>Login</h1>
		<form method="POST" action="LoginServlet">
		  <div class="form-group">
		    <label for="inputEmail">Email</label>
		    <input name="email" type="email" class="form-control" id="inputEmail" placeholder="Email">
		  </div>
		  <div class="form-group">
		    <label for="inputSenha">Senha</label>
		    <input name="senha" type="password" class="form-control" id="inputSenha" placeholder="Senha">
		  </div>
		  <button type="submit" class="btn btn-default">Login</button>
                    <a class="btn btn-default" href="ClientesServlet?action=formNew"><strong class="text-info">Cadastrar-se</strong></a>
		</form>
	</div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
