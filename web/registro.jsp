<%@page import="modelos.vo.Tutor"%>
<%@page import="modelos.dao.TutorDao"%>
<%@page import="modelos.vo.Taller"%>
<%@page import="modelos.dao.TallerDao"%>
<%@page import="modelos.vo.Dpto"%>
<%@page import="modelos.dao.DptoDao"%>
<%@page import="modelos.vo.Area"%>
<%@page import="java.util.List"%>
<%@page import="modelos.dao.AreaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String area ="0";
    String dpto ="0";
    String taller ="0";
    String tutor ="0";
    String sltop ="";
    String fecha ="";
    
    
    if(request.getParameter("area")!= null)
    {
        if(!request.getParameter("area").equals(""))
        {
            area = request.getParameter("area");
        }
        
        if(!request.getParameter("dpto").equals(""))
        {
            dpto = request.getParameter("dpto");
        }
        
        if(!request.getParameter("taller").equals(""))
        {
            taller = request.getParameter("taller");
        }
        
        if(!request.getParameter("tutor").equals(""))
        {
            tutor = request.getParameter("tutor");
        }
        
        fecha = request.getParameter("fecha");
     }
         
        
        AreaDao daoareas = new AreaDao();
        List<Area> listaareas = daoareas.Listar();
        
        DptoDao daodptos = new DptoDao();
        List<Dpto> listadptos = daodptos.Listar(Integer.parseInt(area));
        
        TallerDao daotalleres = new TallerDao();
        List<Taller> listatalleres = daotalleres.Listar();
        
        TutorDao daotutores = new TutorDao();
        List<Tutor> listatutores = daotutores.Listar();
        
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function goSubmit()
            {
                
                document.getElementById("frm").action="registro.jsp";
                document.getElementById("frm").submit();
            }
        </script>
    </head>
    <body>
        <div class="panel">
            <h1>Registrar planificacion</h1>
            <form id="frm" name="frm" action="insert.jsp" method="post"> 
                
                <p>
                    <label>Area</label>
                    <select required class="cssslt" name="area" onchange="goSubmit()"> 
                            <option value="" >Seleccione...</option>
                            <%
                            
                                for(Area item: listaareas)
                                {
                                    if(Integer.parseInt(area)== item.getNum())
                                    {
                                        %>
                                        <option selected value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option  value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    
                                    }                      
                                }
                            
                            %>    
                      
                    </select>
                 </p>
                 
                 <p>
                    <label>Dpto.</label>
                    <select required class="cssslt" name="dpto" onchange="goSubmit()"> 
                          <option value="" >Seleccione..</option>
                
                             <%
                            
                                for(Dpto item: listadptos)
                                {
                                    if(Integer.parseInt(dpto)== item.getNum())
                                    {
                                        %>
                                        <option selected value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option  value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    
                                    }                      
                                }
                            
                            %>  
                            
                    </select>
                    
                      
                </p>   
           
                <p>
                    <label>Taller</label>
                    <select required class="cssslt" name="taller" onchange="goSubmit()"> 
                            <option value="" >Seleccione..</option>
                            
                         <%
                            
                                for(Taller item: listatalleres)
                                {
                                    if(Integer.parseInt(taller)== item.getNum())
                                    {
                                        %>
                                        <option selected value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option  value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    
                                    }                      
                                }
                            
                            %> 
                            
                     </select>
                   </p>
                   
                <p>
                    <label>Fecha de Inicio</label>
                    <input required type="date" name="fecha" value="<%= fecha %>">
                </p>
                   <p>
                    <label>Tutor</label>
                    <select required class="cssslt" name="tutor" onchange="goSubmit()"> 
                            <option value="" >Seleccione..</option>
                             <%
                            
                                for(Tutor item: listatutores)
                                {
                                    if(Integer.parseInt(tutor)== item.getNum())
                                    {
                                        %>
                                        <option selected value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    }
                                    else
                                    {
                                        %>
                                        <option  value="<%=item.getNum() %>" > <%=item.getNombre() %> </option>
                                        <%
                                    
                                    }                      
                                }
                            
                            %> 
                            
                            
                            
                    </select>
                 </p>
   
               
                <p>
                    <input type="submit" value="Registrar" />
                </p>
            </form>
            <p>
                <a href="planificaciones.jsp">Volver</a>
            </p>
            
        </div>
    </body>
</html>
