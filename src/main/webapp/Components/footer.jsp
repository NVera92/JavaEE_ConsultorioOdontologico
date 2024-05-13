<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Sistema Integral de Gestion Odontologico. <% int year = Calendar.getInstance().get(Calendar.YEAR);
                out.print(year);%></span>
        </div>
    </div>
</footer>
<!-- End of Footer -->
