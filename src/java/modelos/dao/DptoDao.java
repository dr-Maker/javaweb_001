
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
         
         public List<Dpto> Listar(int numarea)
         {
             List<Dpto> lista = new ArrayList<Dpto>();
             
             try
             {
             db.Conectar();
             sql = "select * from tbl_dpto where numarea = ?";
             stmt = db.getConn().prepareStatement(sql);
             stmt.setInt(1, numarea);
             rs = db.EjecutarConsulta(stmt);
             while(rs.next())
             {
                 int num = rs.getInt("num");
                 String nombre = rs.getString("nombre");
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
