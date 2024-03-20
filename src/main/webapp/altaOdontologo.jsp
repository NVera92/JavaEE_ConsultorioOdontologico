<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->
    

    <form class="user">
        <h4>Alta Odontólogos</h4>
        <hr>
        </br>
    
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputDni"
                       placeholder="DNI">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputEspecialidad"
                       placeholder="Especialidad">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputNombre"
                       placeholder="Nombre">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputApellido"
                       placeholder="Apellido">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputTelefono"
                       placeholder="Telefono">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputDireccion"
                       placeholder="Dirección">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control form-control-user" id="inputTelefono"
                       placeholder="Fecha Nacimiento">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputDireccion"
                       placeholder="Dirección">
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label for="birthdaytime">Horario Inicio</label>
                <input type="time" class="form-control form-control-user" id="inputHorarioInicio">
            </div>
            <div class="col-sm-6">
                <label for="birthdaytime">Horario Fin</label>
                <input type="time" class="form-control form-control-user" id="inputHorarioFin">
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
        <h4>Creacion Usuario</h4>
        </br>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user"
                       id="exampleInputPassword" placeholder="Usuario">
            </div>
            <div class="col-sm-6">
                <input type="password" class="form-control form-control-user"
                       id="exampleRepeatPassword" placeholder="Contraseña">
            </div>
        </div>
        </br>
        <a href="login.html" class="btn btn-primary btn-user btn-block">
            Register Account
        </a>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
