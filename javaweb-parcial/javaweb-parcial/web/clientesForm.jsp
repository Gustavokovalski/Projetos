<%@page import="com.ufpr.tads.web2.beans.Usuario"%>
<%@page import="com.ufpr.tads.web2.beans.LoginBean"%>
<%@ page errorPage="erro.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<script type="text/javascript" >


$(document).ready(function() {

    $( "#estado" ).change(function() {
      getCidades();
    });
});

function getCidades(){
    var estadoId = $("#estado").val();
    var url = "AJAXServlet";
    $.ajax({
            url : url, // URL da sua Servlet
            data : {
                estadoId : estadoId
            }, // Parâmetro passado para a Servlet
            dataType : 'json',
            success : function(data) {
                // Se sucesso, limpa e preenche a combo de cidade
                // alert(JSON.stringify(data));
                $("#cidade").empty();
                $.each(data, function(i, obj) {
                    $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                });
            },
            error : function(request, textStatus, errorThrown) {
                alert(request.status + ', Error: ' + request.statusText);
                 // Erro
            }
        });
}
</script>

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
        <form class="" method="POST" action="ClientesServlet">
          <input type="hidden" name="action" value="${servletAction}" />

            <input hidden type="text" name="idCliente" id="idCliente" value="${cliente.id}" >
            <input hidden type="text" name="idPerfilCliente" id="idCliente" value="1" >
        <div class="form-group">
          <label for="inputCPF">CPF</label>
          <input type="text" required class="form-control" id="inputCPF" name="cpf" value="${cliente.cpf}">
        </div>
        <div class="form-group">
          <label for="inputNome">Nome</label>
          <input type="text" required class="form-control" id="inputNome" name="nome" value="${cliente.nome}">
        </div>
        <div class="form-group">
          <label for="inputEmail">Email</label>
          <input type="email" required class="form-control" id="inputEmail" name="email" value="${cliente.email}">
        </div>
        <div class="form-group">
          <label for="inputSenha">Senha</label>
          <input type="password" required class="form-control" id="inputSenha" name="senha" value="${cliente.senha}">
        </div>
       <!-- <div class="form-group">
            <label for="datepicker">Data de Nascimento</label>
            <input type="text" required class="form-control" id="datepicker" name="data" value="${cliente.data}"></p>
        </div> -->
      <div class="form-group">
          <label for="inputTelefone">Telefone</label>
          <input type="text" required class="form-control" id="inputTelefone" name="telefone" value="${cliente.telefone}">
        </div>
       <div class="form-group">
          <label for="inputRua">Rua</label>
          <input type="text" required class="form-control" id="inputRua" name="rua" value="${cliente.rua}">
        </div>
       <div class="form-group">
          <label for="inputBairro">Bairro</label>
          <input type="text" required class="form-control" id="inputBairro" name="bairro" value="${cliente.bairro}">
        </div>
        <div class="form-group">
          <label for="inputNúmero">Número</label>
          <input type="text" required class="form-control" id="inputNumero" name="numero" value="${cliente.numero}">
        </div>
       <div class="form-group">
          <label for="inputCep">CEP</label>
          <input type="text" required class="form-control" id="inputCEP" name="cep" value="${cliente.cep}">
        </div>
       <div class="form-group">
          <label for="inputComplemento">Complemento</label>
          <input type="text" required class="form-control" id="inputComplemento" name="complemento" value="${cliente.complemento}">
        </div>
       <div class="form-group">
          <label for="estado">Estado</label>
          <select required class="form-control" id="estado" name="estado" value="${cliente.cidade.estado.id}">
              <option value="${cidadeSelecionada.estado.id}" selected>${cidadeSelecionada.estado.sigla}</option>
              <c:forEach var="estado" items="${estados}">
                  <c:if test="${estado.id != cidadeSelecionada.estado.id}">
                    <option value='<c:out value="${estado.id}"/>'> <c:out value="${estado.sigla}"/></option>
                  </c:if>
              </c:forEach>
          </select>
        </div>
       <div class="form-group">
          <label for="cidade">Cidade</label>
          <select required class="form-control" id="cidade" name="cidade" value="${cliente.cidade.id}">
              <option value="${cidadeSelecionada.id}" selected>${cidadeSelecionada.nome}</option>
          </select>
        </div>
        
       
        <button type="submit" class="btn btn-default">${nomeBotao}</button>
       <a class="btn btn-default" href="ClientesServlet">Voltar</a
        </form>

        <br>
        </div>
    </body>
    
<script>
    $( "#datepicker" ).datepicker({
        dateFormat: 'dd/mm/yy',
        defaultDate: "30/01/1999",
        locale: 'pt-br',
        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
        dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
        nextText: 'Próximo',
        prevText: 'Anterior'
    });
    
    $('#datepicker').mask('00/00/0000');
    $('#inputCEP').mask('00000-000');
    $('#inputCPF').mask('000.000.000-00');
    $("#inputTelefone").mask("(00) 0000-00009");
    $("#inputNumero").mask("#");


</script>
</html>
