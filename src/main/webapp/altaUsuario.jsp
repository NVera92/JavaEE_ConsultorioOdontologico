<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvUsuario" method="post">
        <h4>Alta Usuario</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputUsuario"
                       placeholder="Usuario" name="inputUsuario">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputEspecialidad"
                       placeholder="Especialidad" name="inputEspecialidad">
            </div>

        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control form-control-user" id="inputPassword"
                       placeholder="Contraseña" name="inputPassword">
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control form-control-user" id="inputPassword1"
                       placeholder="Repetir Contraseña" name="inputPassword1">
            </div>

        </div>

        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Usuario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
