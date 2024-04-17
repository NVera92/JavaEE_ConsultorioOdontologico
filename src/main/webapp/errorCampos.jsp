<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <%@ include file="/Components/header.jsp"%>
    <%@ include file="/Components/bodyInicio.jsp"%>

    <!-- Page Heading -->

    <% 
        String[] errores = (String[]) request.getSession().getAttribute("errorMessages");
    %>

    <form class="user">
        <h4>Alta Usuario</h4>
        <hr>
        </br>
        
        <center style="color: red">
        <h5>Se detectaron errores en "<% out.print(errores[0]);%></h5>
        </br>
        <h6 style="align-content: center"><% out.print(errores[1]);%></h6>
        </center>

        </br>
        <a class="btn btn-primary btn-user btn-block" href="<%= errores[2]%>">
            Reintentar
        </a>
    </form>

    <%@ include file="/Components/bodyFinal.jsp"%>

</html>
