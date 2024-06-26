<%@page import="com.todocode.logica.Odontologo"%>
<%@page import="com.todocode.logica.Secretario"%>
<%@page import="com.todocode.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <%
        Usuario usuarioLog = (Usuario) request.getSession().getAttribute("usuarioLogueado");
        

    %>

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-solid fa-tooth"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Consultorio</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Gestión
    </div>

    <!-- Nav Item - Paciente Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-solid fa-user fa-user-injured"></i>
            <span>Pacientes</span>
        </a>
        <div id="collapseOne" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvVerPaciente">Ver Pacientes</a>
                <a class="collapse-item" href="SvPaciente">Alta Pacientes</a>
            </div>
        </div>
        <div id="collapseOne" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Responsables</h6>
                <a class="collapse-item" href="SvResponsable">Ver Responsables</a>
                <a class="collapse-item" href="altaResponsable.jsp">Alta Responsables</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-solid fa-calendar-day"></i>
            <span>Turnos</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvVerTurnos">Ver Turnos</a>
                <a class="collapse-item" href="SvTurno">Alta Turnos</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Odontologo Collapse Menu -->
    <% if (usuarioLog != null) {
            if (usuarioLog.getRol().equalsIgnoreCase("administrador")) {%>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-solid fa-hospital-user"></i>
            <span>Odontólogos</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvOdontologo">Ver Odontólogos</a>
                <a class="collapse-item" href="altaOdontologo.jsp">Alta Odontólogos</a>
            </div>
        </div>
    </li>
    <% } else if (usuarioLog.getRol().equalsIgnoreCase("odontologo")) {        
        Odontologo o = (Odontologo) request.getSession().getAttribute("odontologo");
    %>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-solid fa-hospital-user"></i>
            <span>Odontólogo</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <form action="SvEditarOdontologo" method="get">
                    <input hidden="true" value="<%= o.getId()%>" name="id" id="id">
                    <center>
                        <button class="btn btn-secondary" type="sumbit">Editar Perfil</button>
                    </center>
                </form>
            </div>
        </div>
    </li>
    <% }
        }
    %>

    <!-- Nav Item - Secretario Collapse Menu -->
    <%  if (usuarioLog != null) {
            if (usuarioLog.getRol().equalsIgnoreCase("administrador")) {%>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-solid fa-user fa-user-edit"></i>
            <span>Secretarios</span>
        </a>
        <div id="collapseFour" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvSecretario">Ver Secretarios</a>
                <a class="collapse-item" href="altaSecretario.jsp">Alta Secretarios</a>
            </div>
        </div>
    </li>
    <% } else if (usuarioLog.getRol().equalsIgnoreCase("secretario")) {
        Secretario s = (Secretario) request.getSession().getAttribute("secretario");
    %>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFour"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-solid fa-user fa-user-edit"></i>
            <span>Secretario</span>
        </a>
        <div id="collapseFour" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <form action="SvEditarSecretario" method="get">
                    <input hidden="true" value="<%= s.getId()%>" name="id" id="id">
                    <center>
                        <button class="btn btn-secondary" type="sumbit">Editar Perfil</button>
                    </center>
                </form>
            </div>
        </div>
    </li>
    <%}
        } else {
            response.sendRedirect("404.jsp");
        }%>
    <!-- Nav Item - Secretario Collapse Menu -->
    <% if (usuarioLog != null) {
            if (usuarioLog.getRol().equalsIgnoreCase("administrador")) {%>
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFive"
           aria-expanded="true" aria-controls="collapseThree">
            <i class="fas fa-solid fa-user"></i>
            <span>Administradores</span>
        </a>
        <div id="collapseFive" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvAdministrador">Ver Administradores</a>
                <a class="collapse-item" href="altaAdministrador.jsp">Alta Administradores</a>
            </div>
        </div>
    </li>
    <% }
        }%>

    <!-- Divider -->
    <hr class="sidebar-divider">

</ul>
<!-- End of Sidebar -->
