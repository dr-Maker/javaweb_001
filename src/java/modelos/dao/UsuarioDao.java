
package modelos.dao;

import data.BaseDatos;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.vo.Usuario;


public class UsuarioDao 
{
    BaseDatos db = new BaseDatos();
    String sql;
    PreparedStatement stmt;
    ResultSet rs;
    Usuario obj;
    
    
    public List Validar(Usuario obj)
    {
        List<Usuario> lista = new ArrayList<>();
        try
        {
            db.Conectar();
            sql = "sp_valida_usuario ?, ?";
            stmt = db.getConn().prepareStatement(sql);
            stmt.setString(1, obj.getUsuario());
            stmt.setString(2, obj.getClave());
            rs = db.EjecutarConsulta(stmt);
            while(rs.next())
            {
                obj = new Usuario();
                obj.setNum(rs.getInt("num"));
                obj.setUsuario(rs.getString("usuario"));
                obj.setClave("*****");
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
