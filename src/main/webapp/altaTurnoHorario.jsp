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

    <% 
        Turno t = (Turno) request.getSession().getAttribute("turno");
        
        
    %>


    <form class="user" action="SvAltaTurnoDisponible" method="post">
        <h4>Alta Turno</h4>
        <hr>
        </br>

        <% Date today = Calendar.getInstance().getTime();

            String stringDate = "";

            if (today != null) {
                Date date = today;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                stringDate = dateFormat.format(date);
            }


            String dateTurno = "";
            if(t.getFecha_turno() != null){
            SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
            dateTurno = formater.format(t.getFecha_turno());
            }
        %>
        

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control" id="inputFecha"
                       name="inputFecha" value="<%= dateTurno %>" min="<%= stringDate%>" required>
            </div>


            <div class="col-sm-6">
                <input class="form-control" type="time" min="<%= t.getOdontologo().getHorario_inicio()%>"
                       max="<%= t.getOdontologo().getHorario_fin() %>" id="inputHora" name="inputHora">
            </div>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <select class="form-control" name="inputPaciente" id="inputPaciente" required>
                    <option value="<%= t.getPaciente().getId_paciente() %>" selected><% out.print(t.getPaciente().getNombre() + " " + t.getPaciente().getApellido());%></option>
                </select>
            </div>


            <div class="col-sm-6">
                <select class="form-control" name="inputOdontologo" id="inputOdontologo" required>
                    <option value="<%= t.getOdontologo().getId() %>" selected><% out.print(t.getOdontologo().getNombre() + " " + t.getOdontologo().getApellido());%></option>  
                </select>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputAfeccion"
                   name="inputAfeccion" value="<%= t.getAfeccion() %>" required>
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
