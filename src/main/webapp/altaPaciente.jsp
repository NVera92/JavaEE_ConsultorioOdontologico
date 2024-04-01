<%@page import="java.util.List"%>
<%@page import="com.todocode.logica.Responsable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <form class="user" action="SvPaciente" method="post">
        <h4>Alta Pacientes</h4>
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
                <input type="number" class="form-control" id="inputDni"
                       placeholder="DNI" name="inputDni" required>
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control" id="inputFecha"
                       placeholder="Fecha Nacimiento" name="inputFecha" required>
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
        
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <select class="form-control" name="inputGrupoSanguineo" id="inputGrupoSanguineo" required>
                        <option value="" disabled selected>Selecione el grupo sanguineo</option>
                        <option value="A+">A positivo (A +)</option>
                        <option value="A-">A negativo (A-)</option>
                        <option value="B+">B positivo (B +)</option>
                        <option value="B-">B negativo (B-)</option>
                        <option value="AB+">AB positivo (AB+)</option>
                        <option value="AB-">AB negativo (AB-)</option>
                        <option value="O+">O positivo (O+)</option>
                        <option value="O-">O negativo (O-)</option>
                    </select>
            </div>
            <% List<Responsable> listaRes = (List) request.getSession().getAttribute("listaResponsables");%>
            
            <div class="col-sm-6">
                 <select class="form-control" name="inputResponsable" id="inputResponsable">
                        <option value="0" disabled selected>Selecione el responsable</option>
                        <option value="0">No Posee</option>
                        <option disabled>--------------------------------</option>
                        <% for(Responsable r : listaRes){%>
                        <option value="<%= r.getId()%>"><% out.print(r.getNombre()+" "+r.getApellido());%></option>
                        <% } %>
                        
                    </select>
            </div>
        </div>

        <center>
            <div class="form-group">
                <label>Posee Obra Social?</label>
                <input type="checkbox" class="form-control" id="inputOs" name="inputOs">
            </div>
        </center>

        </br>
        <hr>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Registrar Paciente
        </button>>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
