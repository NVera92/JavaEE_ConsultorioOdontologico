<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

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

    <!-- Nav Item - Odontologo Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
           aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-solid fa-hospital-user"></i>
            <span>Odontólogos</span>
        </a>
        <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="#">Ver Odontólogos</a>
                <a class="collapse-item" href="altaOdontologo.jsp">Alta Odontólogos</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Paciente Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-solid fa-user fa-user-injured"></i>
            <span>Pacientes</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="">Ver Pacientes</a>
                <a class="collapse-item" href="">Alta Pacientes</a>
            </div>
        </div>
    </li>

    <!-- Nav Item - Usuario Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
           aria-expanded="true" aria-controls="collapseThree">
            <i class="fas fa-solid fa-user"></i>
            <span>Usuarios</span>
        </a>
        <div id="collapseThree" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Acciones</h6>
                <a class="collapse-item" href="SvUsuario">Ver Usuarios</a>
                <a class="collapse-item" href="altaUsuario.jsp">Alta Usuarios</a>
            </div>
        </div>
    </li>
    
    <!-- Divider -->
    <hr class="sidebar-divider">

</ul>
<!-- End of Sidebar -->
