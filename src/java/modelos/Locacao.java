/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;




import java.sql.Connection;
import utils.Conexao;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import java.sql.Date;



/**
 *
 * @author entra21
 */
public class Locacao {
    private int id;
    private Date dataentrega;
    private Date datadevolucao;
    private Date data;
     private Carro carro;
    private Cliente cliente;
    
    
    
    public ResultSet consultarInner(){
        Connection con = Conexao.conectar();
        String sql = "select l.id, l.idcarro, c.placa, c.modelo, "+
               " l.cpfcliente, cli.nome, l.data, "+
                "l.dataentrega, l.datadevolucao "+
                "from locacao l, carro c, cliente cli "+
                "where l.idcarro = c.id "+
                "and l.cpfcliente = cli.cpf ";
        ResultSet rs = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            rs= stm.executeQuery();            
        }catch (SQLException ex){
            
        }
        return rs;
        
    }
    
    public ResultSet consultarInner(int id){
         Connection con = Conexao.conectar();
        Locacao locacao = new Locacao();
        String sql ="select l.id, l.idcarro, c.placa, c.modelo,\n "+
               " l.cpfcliente, cli.nome, l.data,\n "+
                "l.dataentrega, l.datadevolucao \n" +
                "from locacao l, carro c, cliente cli\n "+
                "where l.idcarro = c.id \n"+
                "and l.cpfcliente = cli.cpf\n "+
                "and l.id=?";
       ResultSet rs = null;
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            rs = stm.executeQuery();
        }catch(SQLException ex){
        }
        
                
         return rs;
    }
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update locacao set"+
                "idcarro=?,"+
                "cpfcliente=?"+
                "dataentrega=?"+
                "data=?"+
                "datadevolucao=?"+
                "where id=?";
        try{
            PreparedStatement stm=con.prepareStatement(sql);
            stm.setInt(1, this.carro.getId());
            stm.setString(2,this.cliente.getCpf());
            stm.setDate(3, this.dataentrega);
            stm.setDate(4,this.data);
            stm.setDate(5, this.datadevolucao);
            stm.setInt(6,this.id);
            
            stm.execute();
        }catch(SQLException ex){
            System.out.print("Erro:" + ex.getMessage());
        }
        return true;
            
            
       
    }
    
     public List<Locacao> consultar(String cliente){
     List<Locacao> lista = new ArrayList<>();
     Connection con = Conexao.conectar();     
     String sql = "select id, idcarro, cpfcliente, data, dataentrega, datadevolucao";
            sql += " from locacao where cpfcliente = ?";
      try {
          PreparedStatement stm = con.prepareStatement(sql);
          stm.setString(1, cliente);
          ResultSet rs = stm.executeQuery();
         
          while(rs.next()){
             Locacao locacao = new Locacao();
             locacao.setId(rs.getInt("id"));
             
             Cliente cli = new Cliente();
             cli = cli.consultar(rs.getString("cpfcliente"));             
             locacao.setCliente(cli);
             
             Carro car = new Carro();
             car=car.consultar(rs.getInt("idcarro"));                     
             locacao.setCarro(car);
             
             locacao.setData(rs.getDate("data"));
             locacao.setDataentrega(rs.getDate("dataentrega"));
             locacao.setDatadevolucao(rs.getDate("datadevolucao"));
             
             lista.add(locacao);
          }
      } catch (SQLException ex) {
          System.out.println("Erro: " + ex.getMessage());
      }     
     return lista;
    
     }
    public boolean salvar(){
        Connection con = Conexao.conectar();
        String sql = "insert into locacao";
               sql += "(data,dataentrega, idcarro, cpfcliente)";
               sql += "values(?,?,?,?)";
               
         try{
             PreparedStatement stm = con.prepareStatement(sql);
             stm.setDate(1, this.data);
             stm.setDate(2, this.dataentrega);
             stm.setInt(3,this.carro.getId());
             stm.setString(4, this.cliente.getCpf());
             
             stm.execute();
         }catch (SQLException ex){
             System.out.println("Erro: " + ex.getMessage());
             return false;
             
         }
         return true;        
       
}                      
    @Override
    public String toString() {
        return "Locacao{" + "id=" + id + ", dataentrega=" + dataentrega + ", datadevolucao=" + datadevolucao + ", data=" + data + '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

    

    public Carro getCarro() {
        return carro;
    }

    public void setCarro(Carro carro) {
        this.carro = carro;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Date getDataentrega() {
        return dataentrega;
    }

    public void setDataentrega(Date dataentrega) {
        this.dataentrega = dataentrega;
    }

    public Date getDatadevolucao() {
        return datadevolucao;
    }

    public void setDatadevolucao(Date datadevolucao) {
        this.datadevolucao = datadevolucao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    
   
   
           
}
