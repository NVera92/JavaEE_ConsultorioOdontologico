<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body id="page-top">

    <!-- Validacion Sesion -->
    <%  HttpSession miSesion = request.getSession();
        String usuario = (String) request.getSession().getAttribute("nombreUsuario");
        
        if(usuario == null){
            response.sendRedirect("login.jsp");
        }
    %>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="/Components/sidebar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="/Components/topbar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

