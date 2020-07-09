
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Area;
import modelos.vo.Dpto;


public class DptoDao 
{
        BaseDatos db = new BaseDatos();
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
        Dpto obj;
         
         public List<Dpto> Listar()
         {
             List<Dpto> lista = new ArrayList<Dpto>();
             
             try
             {
             db.Conectar();
             sql = "select * from tbl_dpto";
             stmt = db.getConn().prepareStatement(sql);
             rs = db.EjecutarConsulta(stmt);
             while(rs.next())
             {
                 int num = rs.getInt("num");
                 String nombre = rs.getString("nombre");
                 int numarea = rs.getInt("numarea");
                 lista.add(new Dpto(num, nombre, numarea));
                 
             }
             db.Cerrar();
             }
             catch(SQLException exe)
             {
                 System.out.println(exe.getMessage());
             }
             
             return lista;
         }
    
}
