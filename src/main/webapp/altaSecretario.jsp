<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvSecretario" method="post">
        <h4>Alta Secretario</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputNombre"
                       placeholder="Nombre" name="inputNombre" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputApellido"
                       placeholder="Apellido" name="inputApellido" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputDni"
                       placeholder="DNI" name="inputDni" required>
            </div>
            <div class="col-sm-6">
                <input type="date" class="form-control" id="inputNacimiento"
                       name="inputFechaNacimiento" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputTelefono"
                       placeholder="Telefono" name="inputTelefono" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDireccion"
                       placeholder="Dirección" name="inputDireccion" required>
            </div>
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
                   placeholder="Usuario" name="inputUsuario" required>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="password" class="form-control"
                       id="inputPassword" placeholder="Contraseña" name="inputPassword">
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control"
                       id="inputPassword1" placeholder="Repetir Contraseña" name="inputPassword1">
            </div>
        </div>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Secretario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
