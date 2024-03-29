package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreUsuario = request.getParameter("inputUsuario");
        String password = request.getParameter("inputPassword");
        

        boolean validation = false;
        validation = controladora.comprobarIngreso(nombreUsuario, password);
        
        Usuario usuarioLogueado = controladora.traerUsuarioNombre(nombreUsuario);
        
        if (validation == true) {
            HttpSession miSesion = request.getSession(true);
            miSesion.setAttribute("usuarioLogueado",usuarioLogueado );
            response.sendRedirect("index.jsp");
        } else {
           
            response.sendRedirect("loginError.jsp");
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
