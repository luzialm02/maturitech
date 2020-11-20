<%-- 
    Document   : excluircliente
    Created on : 18 de nov de 2020, 10:40:18
    Author     : entra21
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Cliente</title>
    </head>
    <body>
        <h1>Excluir Cliente</h1>
        
         <%
            String Cpfcliente = request.getParameter("cpfcliente");
            Cliente c = new Cliente();
            c = c.consultar((Cpfcliente));
            if(c.excluir()){
                out.write("Cliente excluido com sucesso");
            }
            else
            {
                out.write("Problemas ao excluir cliente");
            }
            

        %>
    </body>
</html>
