package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    private Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> listaUsuaraios = new ArrayList<Usuario>();

        listaUsuaraios = controladora.traerUsuarios();

        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaUsuarios", listaUsuaraios);

        response.sendRedirect("verAdministradores.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreUsuario = request.getParameter("inputUsuario");
        String rol = request.getParameter("inputRol");
        String password = request.getParameter("inputPassword");
        String password1 = request.getParameter("inputPassword1");
        
        String error = "";
        
        HttpSession miSession = request.getSession();

        if (nombreUsuario == null || rol == null || password == null || password1 == null) {
            response.sendRedirect("errorCamposLogin.jsp");
        } else {
            if (! controladora.existeUsuario(nombreUsuario)) {
                Usuario usuario = new Usuario();

                usuario.setNombre_usuario(nombreUsuario);
                usuario.setRol(rol);

                if (password.equals(password1)) {
                    usuario.setPassword_usuario(password);
                    controladora.crearUsuario(usuario);
                    doGet(request, response);
                } else {
                    error = "Verifique cuidadosamente los datos ingresados y reintente.";
                    miSession.setAttribute("error", error);
                    response.sendRedirect("errorCamposLogin.jsp");
                }
            }else{
                error = "El nombre de usuario que esta intentando crear, no esta disponible, por favor elija otro.";
                miSession.setAttribute("error", error);
                response.sendRedirect("errorCamposLogin.jsp");
            }
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
