<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvAdministrador" method="post">
        <h4>Alta Administrador</h4>
        <hr>
        </br>

        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputUsuario"
                       placeholder="Usuario" name="inputUsuario" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputRol" name="inputRol" value="Administrador" disabled>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control" id="inputPassword"
                       placeholder="Contraseña" name="inputPassword" required>
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="inputPassword1"
                       placeholder="Repetir Contraseña" name="inputPassword1" required>
            </div>

        </div>

        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Administrador
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
