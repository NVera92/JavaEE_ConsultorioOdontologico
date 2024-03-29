
package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Responsable;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SvEditarResponsable", urlPatterns = {"/SvEditarResponsable"})
public class SvEditarResponsable extends HttpServlet {

    Controladora controladora = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       int id = Integer.parseInt(request.getParameter("id"));
       
       Responsable responsable = controladora.traerResponsable(id);
       
       if(responsable != null){
           HttpSession sesion = request.getSession();
           sesion.setAttribute("responsable", responsable);
           response.sendRedirect("editarResponsable.jsp");
       }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("inputNombre");
        String apellido = request.getParameter("inputApellido");
        String dni = request.getParameter("inputDni");
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
