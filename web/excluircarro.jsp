<%-- 
    Document   : excluircarro
    Created on : 9 de nov de 2020, 09:57:25
    Author     : entra21
--%>

<%@page import="modelos.Carro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Excluir carro</h1>
        <%
            String idcarro = request.getParameter("idcarro");
            Carro c = new Carro();
            if(c.excluir()){
                out.write("Carro excluido com sucesso");
            }
            else
            {
                out.write("Problemas ao excluir carro");
            }
            } 

        %>
        <hr/>
        <a href="consultacarro.jsp">Consulta carros</a>
        <hr/>
        <a href="cadastrarcliente.jsp">Cadastrar cliente</a>
    </body>
</html>
