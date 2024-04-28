<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.todocode.logica.Paciente"%>
<%@page import="com.todocode.logica.Odontologo"%>
<%@page import="com.todocode.logica.Turno"%>
<%@page import="com.todocode.logica.Secretario"%>
<%@page import="com.todocode.logica.Responsable"%>
<%@page import="com.todocode.logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <%            List<Turno> listaT = (List) request.getSession().getAttribute("listaTurnos");
            Odontologo odontologo = (Odontologo) request.getSession().getAttribute("odontologo");
            Paciente paciente = (Paciente) request.getSession().getAttribute("paciente");
            Turno turno = (Turno) request.getSession().getAttribute("turno");

            Date today = Calendar.getInstance().getTime();

            String stringDateAux = "";
            
            String turnoString = "";

            if (today != null) {
                Date dateAux = today;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                stringDateAux = dateFormat.format(dateAux);
            }
            

            if(turno.getFecha_turno()!= null){
                Date turnoDate;
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                turnoString = dateFormat.format(turno.getFecha_turno());
                
            }

        %>

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Disponibilidad de Turnos</h1>
        <p class="mb-4">A continuacion se muestra los turnos del Dr. <% out.print(odontologo.getNombre() + " " + odontologo.getApellido());%> para el dia seleccionado.</br>
            Estimar que una atencion normal contempla 30 minutos.
        </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Turnos</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Paciente</th>
                                <th>Odontologo</th>
                                <th>Afeccion</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Paciente</th>
                                <th>Odontologo</th>
                                <th>Afeccion</th>
                            </tr>
                        </tfoot>


                        <tbody>
                            <% for (Turno t : listaT) {
                                    String stringDate = "";

                                    if (t.getFecha_turno() != null) {
                                        Date date = t.getFecha_turno();
                                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        stringDate = dateFormat.format(date);
                                    }

                            %>
                            <tr>
                                <td><%= t.getId_turno()%></td>
                                <td><%= stringDate%></td>
                                <td><%= t.getHora_turno()%></td>
                                <td><% out.print(paciente.getNombre() + " " + paciente.getApellido());%></td>
                                <td><% out.print(odontologo.getNombre() + " " + odontologo.getApellido());%></td>
                                <td><%= t.getAfeccion()%></td>



                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>


        <form class="user" action="SvAltaTurnoDisponible" method="post">
            <h4>Alta Turno</h4>
            <hr>
            </br>

            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <select class="form-control" name="inputPaciente" id="inputPaciente" required>
                        <option value="<%= paciente.getId()%>" selected><% out.print(paciente.getNombre() + " " + paciente.getApellido());%></option>
                    </select>
                </div>


                <div class="col-sm-6">
                    <select class="form-control" name="inputOdontologo" id="inputOdontologo" required>
                        <option value="<%= odontologo.getId()%>" selected><% out.print(odontologo.getNombre() + " " + odontologo.getApellido());%></option>
                    </select>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="date" class="form-control" id="inputFecha"
                            value="<%= turnoString%>"name="inputFecha" min="<%= stringDateAux%>" required>
                </div>


                <div class="col-sm-6">
                    <input type="time" class="form-control" id="inputHora"
                            name="inputHora" min="<%= odontologo.getHorario_inicio()%>" max="<%= odontologo.getHorario_fin()%>" required>
                </div>
            </div>


            <div class="form-group">
                <input type="text" class="form-control" id="inputAfeccion"
                       value="<%= turno.getAfeccion()%>" name="inputAfeccion" required>
            </div>
            </br>
            <hr>
            </br>
            <button  class="btn btn-primary btn-user btn-block" type="submit">
                Buscar Disponibilidad
            </button>
        </form>
    </div>
    <!-- /.container-fluid -->


    <!-- End of Main Content -->


    <%@ include file="/Components/bodyFinal.jsp"%>

</html>