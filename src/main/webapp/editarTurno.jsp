<%@page import="com.todocode.logica.Turno"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.todocode.logica.Odontologo"%>
<%@page import="com.todocode.logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <%        Turno t = (Turno) request.getSession().getAttribute("turno");

        String stringDate = "";
        
        Date currentDate = new Date();
        String stringCurrentDate = "";
        if(currentDate != null){
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            stringCurrentDate = format.format(currentDate);
        }
        

        if (t.getFecha_turno() != null) {
            Date date = t.getFecha_turno();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            stringDate = dateFormat.format(date);
        }
    %>

    <form class="user" action="SvEditarTurno" method="post">
        <h4>Editar Turno</h4>
        <hr>
        </br>


        <div class="form-group">
            <input type="date" class="form-control" id="inputFecha"
                   name="inputFecha" min="<%= stringCurrentDate%>" value="<%= stringDate%>" required>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <select class="form-control" name="inputPaciente" id="inputPaciente" required>
                    
                    <option value="<%= t.getPaciente().getId()%>"><% out.print(t.getPaciente().getNombre() + " " + t.getPaciente().getApellido());%></option>
                </select>
            </div>


            <div class="col-sm-6">
                <select class="form-control" name="inputOdontologo" id="inputOdontologo" required>
                    
                    
                    <option value="<%= t.getOdontologo().getId()%>"><% out.print(t.getOdontologo().getNombre() + " " + t.getOdontologo().getApellido());%></option>
                    
                </select>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputAfeccion"
                   name="inputAfeccion" value="<%= t.getAfeccion()%>" required>
        </div>
        </br>
        <hr>
        </br>
        <button  class="btn btn-primary btn-user btn-block" type="submit">
            Buscar Disponibilidad
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
