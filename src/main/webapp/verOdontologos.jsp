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

    <% Usuario u = (Usuario) request.getSession().getAttribute("usuarioLogueado");

        if (u.getRol().equalsIgnoreCase("administrador")) {
    %>

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Ver Odontologos</h1>
        <p class="mb-4">A continuacion se muestra la lista completa de odontologos.
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
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Especialidad</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>Especialidad</th>
                                <th style="width: 210px">Acción</th>
                            </tr>
                        </tfoot>

                        <% List<Odontologo> listaSec = (List) request.getSession().getAttribute("listaOdontologos");%>

                        <tbody>
                            <% for (Odontologo res : listaSec) {%>
                            <tr>
                                <td><%= res.getId()%></td>
                                <td><%= res.getNombre()%></td>
                                <td><%= res.getApellido()%></td>
                                <td><%= res.getTelefono()%></td>
                                <td><%= res.getDireccion()%></td>
                                <td><%= res.getEspecialidad()%></td>

                                <td style="display: flex; width: 230px">
                                    <form name="eliminar" action="SvEditarOdontologo" method="get"> <!-- Esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="margin-right: 5px">
                                            <i class="fas fa-pencil-alt"></i> Editar
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId()%>"> <!-- Esto es para mandar el id al servelt -->
                                    </form>
                                    <form name="eliminar" action="SvEliminarOdontologo" method="post"> <!-- Esto es para mandar el codigo al servlet -->
                                        <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color:red; margin-right: 5px">
                                            <i class="fas fa-trash-alt"></i> Eliminar
                                        </button>
                                        <input type="hidden" name="id" value="<%=res.getId()%>"> <!-- Esto es para mandar el id al servelt -->
                                    </form>
                                </td>

                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <% } else {%>
    <div>
        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Odontologo</h1>
        

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Editar Odontologo</h6>
            </div>
            <div class="card-body">
                <center>
                    <p>Los datos del odontologo <% out.print(u.getNombre_usuario());%> fueron actualizados correctamente.</p>
                <a class="btn btn-primary" href="index.jsp">Aceptar</a>
                </center>
            </div>
        </div>

    </div>
    
    <% } %>
    <!-- /.container-fluid -->


    <!-- End of Main Content -->


    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
