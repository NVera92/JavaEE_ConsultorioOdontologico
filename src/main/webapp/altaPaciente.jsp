<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user">
        <h4>Alta Pacientes</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputDni"
                       placeholder="DNI">
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control form-control-user" id="inputTelefono"
                       placeholder="Fecha Nacimiento">
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
                <input type="radio" class="form-control form-control-user" id="inputTelefono"
                       placeholder="Telefono">
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputDireccion"
                       placeholder="Dirección">
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
        </br>
        <a href="login.html" class="btn btn-primary btn-user btn-block">
            Registrar Paciente
        </a>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
