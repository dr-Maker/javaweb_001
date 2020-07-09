
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Taller;
import modelos.vo.Tutor;


public class TutorDao 
{
    
        BaseDatos db = new BaseDatos();
        String sql;
        PreparedStatement stmt;
        ResultSet rs;
        Tutor obj;
         
         public List<Tutor> Listar()
         {
             List<Tutor> lista = new ArrayList<Tutor>();
             
             try
             {
             db.Conectar();
             sql = "select * from tbl_tutor";
             stmt = db.getConn().prepareStatement(sql);
             rs = db.EjecutarConsulta(stmt);
             while(rs.next())
             {
                 int num = rs.getInt("num");
                 String nombre = rs.getString("nombre");
                 String email = rs.getString("email");
                 String fono = rs.getString("fono");
                
                 
                 lista.add(new Tutor(num, nombre, email, fono));
                 
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
    

