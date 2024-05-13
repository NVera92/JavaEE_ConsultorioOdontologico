<%@page import="com.todocode.logica.Odontologo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.todocode.logica.Secretario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->
    <% Odontologo o = (Odontologo) request.getSession().getAttribute("odontologo");

        String stringDate = "";

        if (o.getFecha_nacimiento() != null) {
            Date date = o.getFecha_nacimiento();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            stringDate = dateFormat.format(date);
        }

    %>

    <form class="user" action="SvEditarOdontologo" method="post">
        <h4>Editar Odontologo</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputNombre"
                       name="inputNombre"  value="<%= o.getNombre()%>"required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputApellido"
                       name="inputApellido" value="<%= o.getApellido()%>" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputDni"
                       name="inputDni" value="<%= o.getDni()%>" required>
            </div>
            <div class="col-sm-6">
                <input type="date" class="form-control" id="inputNacimiento"
                       name="inputNacimiento" value="<%= stringDate%>" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputTelefono"
                       name="inputTelefono" value="<%= o.getTelefono()%>" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDireccion"
                       name="inputDireccion" value="<%= o.getDireccion()%>" required>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputEspecialidad"
                   name="inputEspecialidad" value="<%= o.getEspecialidad()%>" required>
        </div>
        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label for="birthdaytime">Horario Inicio</label>
                <input type="time" class="form-control" id="inputHorarioInicio" name="inputHorarioInicio"
                       value="<%= o.getHorario_inicio() %>" required>
            </div>
            <div class="col-sm-6">
                <label for="birthdaytime">Horario Fin</label>
                <input type="time" class="form-control" id="inputHorarioFin" name="inputHorarioFin"
                       value="<%= o.getHorario_fin() %>" required>
            </div>
        </div>
        </br>
        <hr>
        <h4>Editar Usuario</h4>
        </br>
        <div class="form-group">
            <input type="text" class="form-control" id="inputUsuario"
                   name="inputUsuario" value="<%= o.getUsuario_odontologo().getNombre_usuario()%>" required>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control"
                       id="inputPassword" name="inputPassword" value="<%= o.getUsuario_odontologo().getPassword_usuario()%>" required>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control"
                       id="inputPassword1" name="inputPassword1" value="<%= o.getUsuario_odontologo().getPassword_usuario()%>" required>
            </div>
        </div>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Editar Odontologo
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
