<%-- 
    Document   : recebedadoslocacao
    Created on : 11 de nov de 2020, 08:38:12
    Author     : entra21
--%>

<%@page import="modelos.Carro"%>
<%@page import="modelos.Cliente"%>
<%@page import="modelos.Locacao"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Recebe dados</h1>
        <%
          String idcarro = request.getParameter("idcarro");
          String cpfcliente = request.getParameter("cfpcliente");
          String data = request.getParameter("dataretirada");
          
          Cliente cli = new Cliente();
          cli = cli.consultar(cpfcliente);             
           
          Carro car = new Carro();
          car=car.consultar(Integer.parseInt(idcarro));                     
            
          Locacao locacao = new Locacao();
          locacao.setCarro(car);
          locacao.setCliente(cli);
          locacao.setData(Date.valueOf(data));
          locacao.setDataentrega(Date.valueOf(data));
          if(locacao.salvar()){
              out.write("Locçaõ salva com sucesso");
          }

          
        
        %>
    </body>
</html>
