
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Area;


public class AreaDao 
{
        BaseDatos db = new BaseDatos();
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
       
         Area obj;
         
         public List<Area> Listar()
         {
             List<Area> lista = new ArrayList<Area>();
             
             try
             {
             db.Conectar();
             sql = "select * from tbl_area";
             stmt = db.getConn().prepareStatement(sql);
             rs = db.EjecutarConsulta(stmt);
             while(rs.next())
             {
                 int num = rs.getInt("num");
                 String nombre = rs.getString("nombre");
                 lista.add(new Area(num, nombre));
                 
             }
             db.Cerrar();
             }catch(SQLException exe)
             {
                 System.out.println(exe.getMessage());
             }
             
             return lista;
         }
}
