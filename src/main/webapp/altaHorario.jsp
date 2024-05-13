<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvHorario" method="post">
        <h4>Alta Horario</h4>
        <hr>
        </br>

        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="time" class="form-control" id="inputInicio"
                       name="inputInicio" required>
            </div>
            <div class="col-sm-6">
                <input type="time" class="form-control" id="inputFin"
                       name="inputFin" required>
            </div>
        </div>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Horario
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
