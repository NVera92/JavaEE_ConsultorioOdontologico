<%@page import="com.todocode.logica.Turno"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.todocode.logica.Secretario"%>
<%@page import="com.todocode.logica.Odontologo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <%        Usuario u = (Usuario) request.getSession().getAttribute("usuarioLogueado");
        String[] c = (String[]) request.getSession().getAttribute("contenido");
    %>

    <div class="container-fluid">
        <h1>Sistema Integral de Gestión</h1>
        <hr>

        <br>

        <% if (u != null) {
                if (u.getRol().equalsIgnoreCase("administrador")) {%>
        <!-- Content Row -->
        <h4>Panel de Administrador</h4>
        </br>
        <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Pacientes</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= c[0]%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-solid fa-user fa-user-injured fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-success shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Turnos</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= c[1]%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-solid fa-calendar-day fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-info shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Odontologos
                                </div>
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><%= c[2]%></div>
                                    </div>
                                    <div class="col">
                                        <div class="progress progress-sm mr-2">
                                            <div class="progress-bar bg-info" role="progressbar"
                                                 style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                 aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-solid fa-hospital-user fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Secretarios</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800"><%= c[3]%></div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-solid fa-user fa-user-edit fa-2x text-gray-300"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% } else if (u.getRol().equalsIgnoreCase("odontologo")) {
            Odontologo od = (Odontologo) request.getSession().getAttribute("odontologo");
            List<Turno> listT = (List) request.getSession().getAttribute("listaTurnos");
        %>
        <!-- Content Row -->
        <h4>Panel de Odontologo</h4>
        </br>
        <p>Hola <%out.print("Dr. " + od.getApellido());%></p>
        </br>

        <!-- Content Row -->
        <div class="row">
            </hr>
            <div class="col-xl-12">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Turnos del Dia</h6>

                        <a><%
                            Date d = Calendar.getInstance().getTime();
                            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            String strDate = dateFormat.format(d);
                            out.print("Fecha: " + strDate);
                            %></a>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <% if (!listT.isEmpty()) {%>
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
                                    <% for (Turno t : listT) {%>
                                    <tr>
                                        <td><%= t.getId_turno()%></td>
                                        <td><%= t.getFecha_turno().toString()%></td>
                                        <td><%= t.getHora_turno()%></td>
                                        <td><% out.print(t.getPaciente().getNombre() + " " + t.getPaciente().getApellido());%></td>
                                        <td><% out.print(t.getOdontologo().getNombre() + " " + t.getOdontologo().getApellido());%></td>
                                        <td><%= t.getAfeccion()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <% } else { %>
                        <a>No se registran turnos para el dia de hoy.</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <%} else {
            Secretario s = (Secretario) request.getSession().getAttribute("secretario");
            List<Turno> listT = (List) request.getSession().getAttribute("listaTurnos");
        %>
        <!-- Content Row -->
        <h4>Panel de Secretario</h4>
        </br>
        <p>Hola <%out.print(s.getNombre());%></p>
        </br>

        <!-- Content Row -->
        <div class="row">
            </hr>
            <div class="col-xl-12">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div
                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Turnos del Dia</h6>

                        <a><%
                            Date d = Calendar.getInstance().getTime();
                            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                            String strDate = dateFormat.format(d);
                            out.print("Fecha: " + strDate);
                            %></a>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <% if (!listT.isEmpty()) {%>
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
                                    <% for (Turno t : listT) {%>
                                    <tr>
                                        <td><%= t.getId_turno()%></td>
                                        <td><%= t.getFecha_turno().toString()%></td>
                                        <td><%= t.getHora_turno()%></td>
                                        <td><% out.print(t.getPaciente().getNombre() + " " + t.getPaciente().getApellido());%></td>
                                        <td><% out.print(t.getOdontologo().getNombre() + " " + t.getOdontologo().getApellido());%></td>
                                        <td><%= t.getAfeccion()%></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <% } else { %>
                        <a>No se registran turnos para el dia de hoy.</a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <% }
        } else {
            response.sendRedirect("404.jsp");
        }%>


    <!-- Content Row -->
    <%@ include file="/Components/bodyFinal.jsp"%>

</html>