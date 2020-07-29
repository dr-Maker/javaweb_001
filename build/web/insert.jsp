<%@page import="modelos.dao.PlanificacionDao"%>
<%@page import="modelos.vo.Planificacion"%>
<%

        int numarea = Integer.parseInt(request.getParameter("area"));
        int numdpto = Integer.parseInt(request.getParameter("dpto"));
        int numtaller = Integer.parseInt(request.getParameter("taller"));
        int numtutor = Integer.parseInt(request.getParameter("tutor"));
        String fecha = request.getParameter("fecha");
        
        Planificacion obj= new Planificacion(0, numdpto, numtaller, numtutor, fecha);
        PlanificacionDao dao = new PlanificacionDao();
        dao.Insert(obj);
        
        response.sendRedirect("planificaciones.jsp");


%>
