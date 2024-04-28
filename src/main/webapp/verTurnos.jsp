<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.todocode.logica.Turno"%>
<%@page import="com.todocode.logica.Odontologo"%>
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

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Ver Turnos</h1>
        <p class="mb-4">A continuacion se muestra la lista completa de turnos.
        </p>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Odontologos</h6>
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
                                <th style="width: 210px">Acción</th>
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
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>

                        <% List<Turno> listaT = (List) request.getSession().getAttribute("listaTurnos");


                        %>

                        <tbody>
                            <% for (Turno res : listaT) {
                                    if (res.getFecha_turno() != null) {
                                        Date dateAux = res.getFecha_turno();
                                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        String strDate = dateFormat.format(dateAux); %>
                                        
                                        

                            <tr>
                                <td><%= res.getId_turno()%></td>
                                <td><% out.print(strDate);%></td>
                                <td><%= res.getHora_turno()%></td>
                                <td><% out.print(res.getPaciente().getNombre()+" "+res.getPaciente().getApellido());%></td>
                                <td><% out.print(res.getOdontologo().getNombre()+" "+res.getOdontologo().getApellido());%></td>
                                <td><%= res.getAfeccion()%></td>
                                

                                <td style="display: flex; width: 230px">
                                    <form name="eliminar" action="SvEditarOdontologo" method="get"> <!-- Esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-right: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId_turno()%>"> <!-- Esto es para mandar el id al servelt -->
                                    </form>
                                    <form name="eliminar" action="SvEliminarTurno" method="post"> <!-- Esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId_turno()%>"> <!-- Esto es para mandar el id al servelt -->
                                    </form>
                                </td>

                            </tr>

                            

                            <%}
                            }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->


    <!-- End of Main Content -->


    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
