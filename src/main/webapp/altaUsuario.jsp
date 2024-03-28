<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->

    <% 
        String message = "Resgistrar Usuario";
    %>

    <form class="user" action="SvUsuario" method="post">
        <h4>Alta Usuario</h4>
        <hr>
        </br>

        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputUsuario"
                       placeholder="Usuario" name="inputUsuario" required>
            </div>
            <div class="col-sm-6">
                <select class="form-control" name="inputRol" id="inputRol" required>
                    <option value="" disabled selected>Selecione un Rol</option>
                    <option value="odontologo">Odontólogo</option>
                    <option value="secretario">Secretario</option>
                    <option value="administrador">Administrador</option>
                </select>
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
            Registrar Usuario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
