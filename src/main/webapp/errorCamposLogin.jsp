<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->

    <% 
        String message = (String) request.getSession().getAttribute("error");
    %>

    <form class="user">
        <h4>Alta Usuario</h4>
        <hr>
        </br>
        
        <center style="color: red">
        <h5>Se detectaron errores en uno o varios campos del formulario!!</h5>
        </br>
        <h6 style="align-content: center"><% out.print(message);%></h6>
        </center>

        </br>
        <a class="btn btn-primary btn-user btn-block" href="altaUsuario.jsp">
            Reintentar
        </a>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>

