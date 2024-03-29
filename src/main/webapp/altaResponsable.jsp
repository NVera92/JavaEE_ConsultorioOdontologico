<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvResponsable" method="post">
        <h4>Alta Responsables</h4>
        <hr>
        </br>


        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputNombre"
                       placeholder="Nombre" name="inputNombre" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputApellido"
                       placeholder="Apellido" name="inputApellido" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputDni"
                       placeholder="DNI" name="inputDni" required>
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control form-control-user" id="inputFecha"
                       placeholder="Fecha Nacimiento" name="inputFecha" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control form-control-user" id="inputTelefono"
                       placeholder="Telefono" name="inputTelefono" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control form-control-user" id="inputDireccion"
                       placeholder="Dirección" name="inputDireccion" required>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control form-control-user" id="inputResponsabilidad"
                   placeholder="Tipo de Responsabilidad" name="inputResponsabilidad">
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
        <button  class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Responsable
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
