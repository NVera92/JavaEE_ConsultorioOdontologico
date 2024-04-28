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

    <% List<Paciente> listaP = (List) request.getSession().getAttribute("listaPacientes");
        List<Odontologo> listaO = (List) request.getSession().getAttribute("listaOdontologos");
    %>


    <form class="user" action="SvTurno" method="post">
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


        %>
        <div class="form-group">
            <input type="date" class="form-control" id="inputFecha"
                   name="inputFecha" min="<%= stringDate%>" required>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <select class="form-control" name="inputPaciente" id="inputPaciente" required>
                    <option value="" disabled selected>Selecione el Paciente</option>
                    <% for (Paciente p : listaP) {%>
                    <option value="<%= p.getId()%>"><% out.print(p.getNombre() + " " + p.getApellido());%></option>
                    <% } %>
                </select>
            </div>


            <div class="col-sm-6">
                <select class="form-control" name="inputOdontologo" id="inputOdontologo" required>
                    <option value="" disabled selected>Selecione el Odontologo</option>
                    <% for (Odontologo o : listaO) {%>
                    <option value="<%= o.getId()%>"><% out.print(o.getNombre() + " " + o.getApellido());%></option>
                    <% }%>
                </select>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputAfeccion"
                   name="inputAfeccion" required>
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
