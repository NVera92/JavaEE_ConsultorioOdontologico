<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.todocode.logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="com.todocode.logica.Responsable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->


    <% Paciente p = (Paciente) request.getSession().getAttribute("paciente");
        
        String stringDate = "";
        
        if (p.getFecha_nacimiento() != null) {
            Date date = p.getFecha_nacimiento();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            stringDate = dateFormat.format(date);
        }
        
        String os = "";
        
        os = (p.isPosee_OS() ? "checked" : "false");
        

    %>

    <form class="user" action="SvEditarPaciente" method="post">
        <h4>Editar Pacientes</h4>
        <hr>
        </br>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputNombre"
                       value="<%= p.getNombre()%>" name="inputNombre" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputApellido"
                       value="<%= p.getApellido()%>" name="inputApellido" required>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputDni"
                       value="<%= p.getDni()%>" name="inputDni" required>
            </div>
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="date" class="form-control" id="inputFecha"
                       value="<%= stringDate%>" name="inputFecha" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <input type="text" class="form-control" id="inputTelefono"
                       value="<%= p.getTelefono()%>" name="inputTelefono" required>
            </div>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="inputDireccion"
                       value="<%= p.getDireccion()%>" name="inputDireccion" required>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <label>Grupo Sanguineo:</label>
                <select class="form-control" name="inputGrupoSanguineo" id="inputGrupoSanguineo" required>
                    <option value="<%= p.getTipo_sangre()%>" disabled>Tipo de Sangre:</option>
                    <option value="<%= p.getTipo_sangre()%>" selected><% out.print(p.getTipo_sangre());%></option>
                    <option value="" disabled>-------------------------------------------------</option>
                    <option value="A positivo (A +)">A positivo (A +)</option>
                    <option value="A negativo (A-)">A negativo (A-)</option>
                    <option value="B positivo (B +)">B positivo (B +)</option>
                    <option value="B negativo (B-)">B negativo (B-)</option>
                    <option value="AB positivo (AB+)">AB positivo (AB+)</option>
                    <option value="AB negativo (AB-)">AB negativo (AB-)</option>
                    <option value="O positivo (O+)">O positivo (O+)</option>
                    <option value="O negativo (O-)">O negativo (O-)</option>
                </select>
            </div>

            <% List<Responsable> listaResponsables = (List) request.getSession().getAttribute("listaResponsables");%>
            
            <div class="col-sm-6">
                <label>Responsable:</label>
                <select class="form-control" name="inputResponsable" id="inputResponsable">
                    <% if (p.getResponsable() != null) {%>
                    <option disabled>Responsable actual:</option>
                    <option value="<%= p.getResponsable().getId()%>" selected><% out.print(p.getResponsable().getNombre() + " " + p.getResponsable().getApellido());%></option>
                    <% } %>
                    <option disabled>-------------------------------------------------</option>
                    <% if(!listaResponsables.isEmpty()){%>
                        <%for(Responsable r : listaResponsables){ %>
                        <option value="<%= r.getId() %>"><% out.print(r.getNombre()+" "+r.getApellido()); %></option> 
                       <% } %>
                    
                    <% } %>
                </select>
            </div>
        </div>

        <center>
            <div class="form-group">
                <label>Posee Obra Social?</label>
                <input type="checkbox" class="form-control" id="inputOs" name="inputOs" <%= os%>>
            </div>
        </center>

        </br>
        <hr>
        </br>
        <button class="btn btn-primary btn-user btn-block" type="submit">
            Modificar Paciente
        </button>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
