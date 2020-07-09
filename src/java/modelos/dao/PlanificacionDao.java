
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Planificacion;


public class PlanificacionDao 
{
    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    Planificacion obj;
    
    public List Listar()
    {
        List<Planificacion> lista = new ArrayList<>();
        try
        {
            db.Conectar();
            sql = "sp_listar_planificacion";
            stmt = db.getConn().prepareStatement(sql);
            rs = db.EjecutarConsulta(stmt);
            while(rs.next())
            {
                obj = new Planificacion();
                obj.setNum(rs.getInt("num"));
                obj.setNumdpto(rs.getInt("numdpto"));
                obj.setNumtaller(rs.getInt("numtaller"));
                obj.setNumtutor(rs.getInt("numtutor"));
                obj.setFecha(rs.getString("fechainicio"));
                obj.setNomarea(rs.getString("nomarea"));
                obj.setNomdpto(rs.getString("nomdpto"));
                obj.setNomtaller(rs.getString("nomtaller"));
                obj.setNomtutor(rs.getString("nomtutor"));
               
                
                lista.add(obj);
            }
            db.Cerrar();
        }
        catch(SQLException exe)
        {
            
            System.out.println(exe.getMessage());
        }
        return lista;
    }
    
    
      public List ListarV2(int numarea, int numdptp, int numtaller, int numtutor)
    {
        List<Planificacion> lista = new ArrayList<>();
        try
        {
            db.Conectar();
            sql = "sp_listar_planificacionV2 ?, ?, ?, ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setInt(1, numarea);
            stmt.setInt(2, numdptp);
            stmt.setInt(3, numtaller);
            stmt.setInt(4, numtutor);
            rs = db.EjecutarConsulta(stmt);
            while(rs.next())
            {
                obj = new Planificacion();
                obj.setNum(rs.getInt("num"));
                obj.setNumdpto(rs.getInt("numdpto"));
                obj.setNumtaller(rs.getInt("numtaller"));
                obj.setNumtutor(rs.getInt("numtutor"));
                obj.setFecha(rs.getString("fechainicio"));
                obj.setNomarea(rs.getString("nomarea"));
                obj.setNomdpto(rs.getString("nomdpto"));
                obj.setNomtaller(rs.getString("nomtaller"));
                obj.setNomtutor(rs.getString("nomtutor"));
               
                
                lista.add(obj);
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
