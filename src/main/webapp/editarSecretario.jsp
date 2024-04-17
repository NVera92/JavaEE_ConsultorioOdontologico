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
    <% Secretario s = (Secretario) request.getSession().getAttribute("secretario");
    
        String stringDate = "";
        
        if(s.getFecha_nacimiento() != null){
            Date date = s.getFecha_nacimiento();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            stringDate = dateFormat.format(date);
        }
    
    %>

    <form class="user" action="SvEditarSecretario" method="post">
        <h4>Editar Secretario</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputNombre"
                       name="inputNombre"  value="<%= s.getNombre() %>"required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputApellido"
                       name="inputApellido" value="<%= s.getApellido() %>" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputDni"
                       name="inputDni" value="<%= s.getDni() %>" required>
            </div>
            <div class="col-sm-6">
                <input type="date" class="form-control" id="inputNacimiento"
                       name="inputFechaNacimiento" value="<%= stringDate %>" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputTelefono"
                       name="inputTelefono" value="<%= s.getTelefono() %>" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDireccion"
                       name="inputDireccion" value="<%= s.getDireccion() %>" required>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputSector"
                   name="inputSector" value="<%= s.getSector() %>" required>
        </div>
       
        <!--
        <div class="form-group">
            <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                   placeholder="Email Address">
        </div>
        -->
        </br>
        <hr>
        <h4>Creación Usuario</h4>
        </br>
        <div class="form-group">
            <input type="text" class="form-control" id="inputUsuario"
                   name="inputUsuario" value="<%= s.getUsuario_secretario().getNombre_usuario() %>" required>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control"
                       id="inputPassword" name="inputPassword" value="<%= s.getUsuario_secretario().getPassword_usuario() %>" required>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control"
                       id="inputPassword1" name="inputPassword1" value="<%= s.getUsuario_secretario().getPassword_usuario() %>" required>
            </div>
        </div>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Odontólogo
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
