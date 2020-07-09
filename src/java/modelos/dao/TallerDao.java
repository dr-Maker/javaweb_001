
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Dpto;
import modelos.vo.Taller;


public class TallerDao 
{
        BaseDatos db = new BaseDatos();
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
        Taller obj;
         
         public List<Taller> Listar()
         {
             List<Taller> lista = new ArrayList<Taller>();
             
             try
             {
             db.Conectar();
             sql = "select * from tbl_taller";
             stmt = db.getConn().prepareStatement(sql);
             rs = db.EjecutarConsulta(stmt);
             while(rs.next())
             {
                 int num = rs.getInt("num");
                 String nombre = rs.getString("nombre");
                 int horas = rs.getInt("horas");
                 int cupos = rs.getInt("cupos");
                 
                 lista.add(new Taller(num, nombre, horas, cupos));
                 
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
