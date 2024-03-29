package com.todocode.servlets;

import com.todocode.logica.AES256;
import com.todocode.logica.Controladora;
import com.todocode.logica.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEditarUsuario", urlPatterns = {"/SvEditarUsuario"})
public class SvEditarUsuario extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Usuario usuario = controladora.traerUsuarios(id);

        String pass = AES256.decrypt(usuario.getPassword_usuario(), usuario.getRol(), usuario.getNombre_usuario());
        usuario.setPassword_usuario(pass);

        if (usuario != null) {
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("usuario", usuario);
            response.sendRedirect("editarUsuario.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreUsuario = request.getParameter("inputUsuario");
        String rol = request.getParameter("inputRol");
        String password = request.getParameter("inputPassword");
        String password1 = request.getParameter("inputPassword1");

        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        usuario.setNombre_usuario(nombreUsuario);
        usuario.setRol(rol);
        
        if (password.equals(password1)) {
            
            usuario.setPassword_usuario(password);
            controladora.editarUsuario(usuario);
            response.sendRedirect("SvUsuario");
            
        } else {
            response.sendRedirect("errorCamposEditarUsuario.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
