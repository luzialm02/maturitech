<%-- 
    Document   : cadastrodevolucao
    Created on : 18 de nov de 2020, 10:58:38
    Author     : entra21
--%>

<%@page import="modelos.Locacao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Devolução</title>
    </head>
    <body>
        <%
            
            String idlocacao = request.getParameter("idlocacao");
            String datadevolucao = request.getParameter("datadevolucao");
            String km = request.getParameter("km");
            if(km != null){
            
            Locacao locacao = new Locacao();
            //locacao.consultar(idlocacao);
           // locacao.setDatadevolucao();
        }
        %>
        <h1>Registrar Devolucao</h1>
        <hr/>
        <form>
            
            <label> Id Locacao</label> <br/>
            <label> Placa carro</label> <br/>
            <label> Cliente</label> <br/>
            
            <label> Data devolução</label>
            <input type="date" name="datadevolucao"/> <br/>
            
            <label>Informe km do veiculo</label>
            <input type="number" name="km"/>
            <hr/>
            <input type="submit" value="Registrar"/>
            
                       
            
            
        </form>
    </body>
</html>
