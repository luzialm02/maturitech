<%-- 
    Document   : recebeeditacliente
    Created on : 20 de nov de 2020, 11:21:53
    Author     : entra21
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>recebe edita cliente</h1>
          <%
        //recebe os valores da tela HTML  
          String idcliente = request.getParameter("idcliente");
          String cpf = request.getParameter("cpf");
          String nome  = request.getParameter("nome");
          String numerocartao = request.getParameter("numerocartao");
          String email = request.getParameter("email");
          String fone = request.getParameter("fone");
          
          
          //instancia o carro
          Cliente cliente = new Cliente();
          cliente.consultar(idcliente);
          cliente.setCpf(cpf);
          cliente.setNome(nome);
          cliente.setNumeroCartao(numerocartao);
          cliente.setEmail(email);
          cliente.setFone(fone);
          
         
          if(cliente.alterar()){
              out.write("Cliente alterado com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar cliente");
          }
          
        %>        
       
        <hr />
        <a href="consultacliente.jsp">Consulta cliente</a
    </body>
</html>
