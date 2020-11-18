<%-- 
    Document   : cadastrarcliente
    Created on : 9 de nov de 2020, 10:41:31
    Author     : entra21
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar cliente</h1>
        
         <hr />
        <form action="recebedadoscliente.jsp" method="POST">
            <label>Informe o cpf</label>
            <input type="text" name="cpf" /> 
            
            <br />
            <label>Informe o nome</label>
            <input type="text" name="nome" />
            
            <br />
            <label>Informe numerocartao</label>
            <input type="text" name="numerocartao" />
            
            <br />
            <label>Informe email</label>
            <input type="text" name="email" />
            
            <br />
            <label>Informe fone</label>
            <input type="text" name="fone" />                        
             
            <hr />
            <input type="submit" value="Salvar" />
        </form>
    </body>
</html>
