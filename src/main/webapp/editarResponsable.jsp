<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.todocode.logica.Responsable"%>
<%@page import="com.todocode.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->
    <% Responsable r = (Responsable) request.getSession().getAttribute("responsable");
    
        String stringDate = "";
        
        if(r.getFecha_nacimiento() != null){
            Date date = r.getFecha_nacimiento();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            stringDate = dateFormat.format(date);
        }
    %>

    <form class="user" action="SvEditarResponsable" method="post">
        <h4>Editar Responsable</h4>
        <hr>
        </br>


        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputNombre"
                       value="<%= r.getNombre() %>" name="inputNombre" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputApellido"
                       value="<%= r.getApellido() %>" name="inputApellido" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputDni"
                       value="<%= r.getDni()%>" name="inputDni" required>
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control" id="inputFecha"
                       value="<%= stringDate %>" name="inputFecha" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputTelefono"
                       value="<%= r.getTelefono() %>" name="inputTelefono" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDireccion"
                       value="<%= r.getDireccion() %>" name="inputDireccion" required>
            </div>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="inputResponsabilidad"
                   value="<%= r.getTipo_responsabilidad() %>" name="inputResponsabilidad">
        </div>
        </br>
        <hr>
        </br>
        <button  class="btn btn-primary btn-user btn-block" type="submit">
            Editar Responsable
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
