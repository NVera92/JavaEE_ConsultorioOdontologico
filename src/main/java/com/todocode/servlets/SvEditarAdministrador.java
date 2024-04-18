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

@WebServlet(name = "SvEditarAdministrador", urlPatterns = {"/SvEditarAdministrador"})
public class SvEditarAdministrador extends HttpServlet {

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
            response.sendRedirect("editarAdministrador.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            
            String nombreUsuario = request.getParameter("inputUsuario");
            String rol = request.getParameter("inputRol");
            String password = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            usuario.setNombre_usuario(nombreUsuario);
            usuario.setRol("administrador");

            if (password.equals(password1)) {

                usuario.setPassword_usuario(password);
                controladora.editarUsuario(usuario);
                response.sendRedirect("SvAdministrador");

            } else {
                String [] arrayError = {"alta de administrador","Las contraseñas NO coinciden, por favor verifique los datos","editarAdministrador.jsp"};
                session.setAttribute("arrayError", arrayError);
                response.sendRedirect("errorCamposEditarUsuario.jsp");
            }
        } catch (Error e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
