<%-- 
    Document   : recebedadoscliente
    Created on : 11 de nov de 2020, 08:59:33
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
        <h1>Recebe dados cliente</h1>
          <hr />
        <%
        //recebe os valores da tela HTML  
          String cpf = request.getParameter("cpf");
          String nome = request.getParameter("nome");
          String numerocartao = request.getParameter("numerocartao");
          String email = request.getParameter("email");
          String fone = request.getParameter("fone");
                   
          
          Cliente cliente = new Cliente();
          cliente.setCpf(cpf);
          cliente.setNome(nome);
          cliente.setNumeroCartao(numerocartao);
          cliente.setEmail(email);
          cliente.setFone(fone);
                
         
        
          if(cliente.salvar()){
              out.write("Cliente inserido com sucesso");
          }
          else
          {
              out.write("Problemas ao salvar cliente");
          }
          
        %>        
       
        <hr />
    </body>
</html>
