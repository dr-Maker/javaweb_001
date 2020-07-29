
<%@page import="java.util.List"%>
<%@page import="modelos.vo.Usuario"%>
<%@page import="modelos.dao.UsuarioDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar</title>
    </head>
    <body>
        <div class="panel2">
            <%
                   
                String usuario = request.getParameter("usuario");
                String clave = request.getParameter("clave");
                
                UsuarioDao dao = new UsuarioDao();
                List<Usuario> Lista = dao.Validar(new Usuario(0, usuario, clave));
                if(Lista.size() > 0)
                {
                    out.print("<h1>Acceso OK</h1>");
                    request.getSession().setAttribute("web", "OK");
                    request.getSession().setAttribute("usuario", usuario);
                    response.sendRedirect("planificaciones.jsp");
                    
                    
                }
                else
                {
                    request.getSession().setAttribute("web", "ERROR");
                    out.print("<h1>Erro de Acceso!</h1>");
                }
                
            %>       
            <a href="index.jsp">Volver a iniciar</a>
        </div>
    </body>
</html>
