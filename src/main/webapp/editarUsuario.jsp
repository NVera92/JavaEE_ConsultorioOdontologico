<%@page import="com.todocode.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->
    <% Usuario u = (Usuario)request.getSession().getAttribute("usuario");%>

    <form class="user" action="SvEditarUsuario" method="post">
        <h4>Editar Usuario</h4>
        <hr>
        </br>
       
        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputUsuario"
                       value="<%= u.getNombre_usuario()%>" name="inputUsuario">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputEspecialidad"
                       value="<%= u.getRol() %>" name="inputEspecialidad">
            </div>

        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control form-control-user" id="inputPassword"
                       value="<%= u.getPassword_usuario()%>" name="inputPassword">
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control form-control-user" id="inputPassword1"
                       value="<%= u.getPassword_usuario()%>" name="inputPassword1">
            </div>

        </div>

        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Usuario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
