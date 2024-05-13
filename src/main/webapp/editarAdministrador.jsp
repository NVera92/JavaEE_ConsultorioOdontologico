<%@page import="com.todocode.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->
    <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");%>

    <form class="user" action="SvEditarAdministrador" method="post">
        <h4>Editar Usuario</h4>
        <hr>
        </br>

        <input type="text" class="form-control" id="inputUsuario"
               value="<%= u.getNombre_usuario()%>" name="inputUsuario" hidden>
        <div class="form-group row">

            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputFalse"
                       value="<%= u.getNombre_usuario()%>" name="inputFalse" disabled>
            </div>
            <div class="col-sm-6">
                <input class="form-control" name="inputRol" id="inputRol" value="Administrador" disabled>
            </div>

        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control" id="inputPassword"
                       value="<%= u.getPassword_usuario()%>" name="inputPassword" required>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="inputPassword1"
                       value="<%= u.getPassword_usuario()%>" name="inputPassword1" required>
            </div>

        </div>

        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Usuario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
