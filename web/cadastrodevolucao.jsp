<%-- 
    Document   : cadastrodevolucao
    Created on : 18 de nov de 2020, 10:58:38
    Author     : entra21
--%>
<%@page import="modelos.Cliente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Carro"%>
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
            Locacao locacao = new Locacao();
            ResultSet rs= locacao.consultarInner(Integer.parseInt(idlocacao));
            String placa = "";
            String cliente ="";
            if(rs.next()){
                locacao.setId(rs.getInt("id"));
                
                Cliente cli = new Cliente();
                cli = cli.consultar(rs.getString("cpfcliente"));
                locacao.setCliente(cli);
                
                Carro carro = new Carro();
                carro = carro.consultar("pPlaca");                
                locacao.setCarro(carro);
                
                locacao.setData(rs.getDate("data"));
                locacao.setDataentrega(rs.getDate("dataentrega"));
                placa =rs.getString("placa")+ "-" +rs.getString("modelo");
                cliente=rs.getString("cpfcliente")+ "-" +rs.getString("nome");
            }
              String km = request.getParameter("km");
           if (km != null){   
               String datadevolucao = request.getParameter("datadevolucao");
               locacao.setDatadevolucao(Date.valueOf(datadevolucao));
               //chamar metodo para atualizar locacao
               locacao.alterar();
               //atualiz km do carro
               Carro carro = new Carro();
               carro = carro.consultar(rs.getString("placa"));
               carro.setKm(Integer.parseInt(km));
               carro.alterar();
        }
        %>
        <h1>Registrar Devolucao</h1>
        <hr/>
        <form  action="cadastrodevolucao.jsp" method="Post">
            
            <label> Id Locacao</label> 
            <input type="text" name="idlocacao" readonly="true"
                   
            <label> Placa carro</label> 
            <input type="text" readonly="true" value="<%out.write(placa);%>"/> <br/>
            
            <label> Cliente</label> <br/>
            <input type="text" readonly="true" value="<%out.write(cliente);%>"/> <br/>
                        
            <label> Data devolução</label>
            <input type="date" name="datadevolucao"/> <br/>
            
            <label>Informe km do veiculo</label>
            <input type="number" name="km"/>
            <hr/>
            <input type="submit" value="Registrar"/>
            
                       
            
            
        </form>
    </body>
</html>
