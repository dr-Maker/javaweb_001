
<%@page import="modelos.vo.Tutor"%>
<%@page import="modelos.vo.Taller"%>
<%@page import="modelos.dao.TutorDao"%>
<%@page import="modelos.dao.TallerDao"%>
<%@page import="modelos.vo.Dpto"%>
<%@page import="modelos.dao.DptoDao"%>
<%@page import="modelos.vo.Area"%>
<%@page import="modelos.dao.AreaDao"%>
<%@page import="java.util.List"%>
<%@page import="modelos.dao.PlanificacionDao"%>
<%@page import="modelos.vo.Planificacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if(request.getSession().getAttribute("web") == null)
    {
        response.sendRedirect("index.jsp");
    }
    else
    {
        String s = (String)request.getSession().getAttribute("web");
        
        
        if(!s.equals("OK"))
        {
            response.sendRedirect("index.jsp");
        }
    }
    
%>
<%
        String area="0";
        String dpto="0";
        String taller="0";
        String tutor="0";
        String sltop="";
        
        if(request.getParameter("area")!= null)
        {
            area = request.getParameter("area");
            dpto = request.getParameter("dpto");
            taller = request.getParameter("taller");
            tutor = request.getParameter("tutor");
        }
        AreaDao daoareas = new AreaDao();
        List<Area> listaareas = daoareas.Listar();
        
        DptoDao daodptos = new DptoDao();
        List<Dpto> listadptos = daodptos.Listar();
        
        TallerDao daotalleres = new TallerDao();
        List<Taller> listatalleres = daotalleres.Listar();
        
        TutorDao daotutores = new TutorDao();
        List<Tutor> listatutores = daotutores.Listar();
        

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Planificaciones</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" >
            function goSubmit()
            {
                document.getElementById("frm").submit();
            }
            
        </script>
        

      
    </head>
    <body>
        
        <div class="panel2">
            <p>
                Hola <%=request.getSession().getAttribute("usuario") %>
                <br>
                <a href="logout.jsp">Cerrar Session</a>
                
            </p>
            <h1>Planificaciones</h1>
            
             <p>             
                 <a href="registro.jsp">Registrar</a>            
             </p>
             
            <form id="frm" name="frm" action="planificaciones.jsp" method="post">
                <table class="tablaSLT">
                    <tr>
                        <td>Area</td>
                        <td>Dpto.</td>
                        <td>Taller</td>
                        <td>Tutor</td>
                     </tr>
                     <tr>
                         <td>
                             <select class="cssslt" name="area" onchange="goSubmit()">
                                 <option value="0">Selectione...</option>
                                 <%
                                     for(Area item: listaareas)
                                     {
                                         if(Integer.parseInt(area) == item.getNum())
                                         {
                                         %>
                                         <option selected value="<%=item.getNum() %>"><%= item.getNombre()%> </option>
                                        <%
                                         }
                                         else
                                         {
                                         %>
                                        <option value="<%=item.getNum() %>"><%= item.getNombre()%> </option>
                                        <%
                                         }
                                        
                                     }
                                 %>
                             </select>    
                         </td>
                         <td>
                             <select class="cssslt" name="dpto" onchange="goSubmit()">
                                 <option value="0">Selectione...</option>
                                 <%
                                     
                                     
                                        for(Dpto item: listadptos)
                                          {   
                                             if(Integer.parseInt(dpto) == item.getNum())
                                             {
                                                %>
                                                <option selected value="<%=item.getNum() %>"><%= item.getNombre() %> </option>
                                                <%
                                             }
                                             else
                                             {
                                                %>
                                                <option value="<%=item.getNum() %>"><%= item.getNombre() %> </option>
                                                <%
                                             }
                                     }
                                 %>
                             </select>    
                         </td>
                         <td>
                             <select class="cssslt" name="taller" onchange="goSubmit()">
                                 <option value="0">Selectione...</option>
                                 <%
                                     for(Taller item: listatalleres)
                                     {
                                         if(Integer.parseInt(taller)== item.getNum())
                                         {
                                             %>
                                                   <option selected value="<%=item.getNum() %>"><%= item.getNombre() %> </option>   
                                            <%      
                                         }else
                                          {
                                             %>
                                                   <option value="<%=item.getNum() %>"><%= item.getNombre() %> </option>   
                                            <%  
                                          }

                                     }
                                     
                                 %>
                             </select>    
                         </td>
                         <td>
                             <select class="cssslt" name="tutor" onchange="goSubmit()">
                                 <option value="0">Todos</option>
                                 <%
                                    for(Tutor item: listatutores)
                                     {
                                         if(Integer.parseInt(taller)== item.getNum())
                                         {
                                             %>
                                                   <option selected value="<%=item.getNum() %>"><%= item.getNombre() %> </option>   
                                            <%      
                                         }
else
                                          {
                                             %>
                                                   <option value="<%=item.getNum() %>"><%= item.getNombre() %> </option>   
                                            <%  
                                          }
                                       }
                                 %>
                             </select>    
                         </td>
                     </tr>
                </table>
            </form>
                             
                            
                             
                             

            <table class="plani">
                <thead>
                    <tr>
                        <td>Area</td>
                        <td>Dpto.</td>
                        <td>Taller</td>
                        <td>Fec.Inicio</td>
                        <td>Tutor</td>
                    </tr>
                </thead>
                <tbody>
                    <%
                        
                        PlanificacionDao dao = new PlanificacionDao();
                        
                         
                        
                        List<Planificacion> lista = dao.ListarV2(Integer.parseInt(area), Integer.parseInt(dpto),Integer.parseInt(taller), Integer.parseInt(tutor));
                        for(Planificacion item: lista)
                        {
                    %>
                            <tr>
                                <td><%= item.getNomarea() %> </td>
                                <td><%= item.getNomdpto() %> </td>
                                <td><%= item.getNomtaller() %> </td>
                                <td><%= item.getFecha() %> </td>
                                <td><%= item.getNomtutor() %> </td>
                            </tr>
                    <%
                        }
                    
                    %>
                </tbody>
            </table>

        </div>
    </body>
</html>
