<%-- 
    Document   : editarcliente
    Created on : 18 de nov de 2020, 10:31:47
    Author     : entra21
--%>

<%@page import="modelos.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>editar cliente</title>
    </head>
    <body>
        <h1>editar cliente</h1>
        <hr />
        <%
          String cpfcliente = request.getParameter("cpfcliente");
          Cliente c = new Cliente();
          if (cpfcliente != null){
              c = c.consultar((cpfcliente));
          }    
        %>
        <form action="recebeeditacliente.jsp" method="POST">
            <label> cpf cliente </label>
            <input type="text" name="cpfcliente" 
                   readonly="true"
                   value="<%out.write(""+c.getCpf());%>"/>
            <br />
            <label>Cpf</label>
            <input type="text" name="cpf" 
                   value="<%out.write(c.getCpf());%>" />
            <br />
            <label>nome</label>
            <input type="text" name="nome" 
                   value="<%out.write(c.getNome());%>" />
            <br />
            <label>numerocartao</label>
            <input type="text" name="numerocartao" 
                   value="<%out.write(c.getNumeroCartao());%>" />
            
            <br />
            <label>email</label>
            <input type="text" name="email" 
                   value="<%out.write(""+c.getEmail());%>" />
            <br />
           
            <hr />
            <input type="submit" value="Alterar" />
        </form>
    </body>
</html>
