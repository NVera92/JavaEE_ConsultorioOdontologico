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

@WebServlet(name = "SvAdministrador", urlPatterns = {"/SvAdministrador"})
public class SvAdministrador extends HttpServlet {

    private Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Usuario> listaUsuarios = new ArrayList<Usuario>();

            listaUsuarios = controladora.traerUsuarios();

            List<Usuario> listaAdmins = new ArrayList<>();

            if (!listaUsuarios.isEmpty()) {
                for (Usuario u : listaUsuarios) {
                    if (u.getRol().equalsIgnoreCase("administrador")) {
                        listaAdmins.add(u);
                    }
                }
            }

            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("listaAdministradores", listaAdmins);

            response.sendRedirect("verAdministradores.jsp");

        } catch (Error e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String nombreUsuario = request.getParameter("inputUsuario");
            String password = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");


            HttpSession miSession = request.getSession();
            
            

            if (nombreUsuario == null || password == null || password1 == null) {
                String arrayError[] = {"alta de administrador", "Complete todos los campos solicitados.", "altaAdministrador.jsp"};
                miSession.setAttribute("arrayError", arrayError);
                response.sendRedirect("errorCampos.jsp");
            } else {
                if (!controladora.existeUsuario(nombreUsuario)) {
                    Usuario usuario = new Usuario();

                    usuario.setNombre_usuario(nombreUsuario);
                    usuario.setRol("administrador");

                    if (password.equals(password1)) {
                        usuario.setPassword_usuario(password);
                        controladora.crearUsuario(usuario);
                        doGet(request,response);
                    } else {
                        String [] arrayError = {"alta de administrador","Las contraseñas NO coinciden, por favor verifique los datos","altaAdministrador.jsp"};
                        miSession.setAttribute("arrayError", arrayError);
                        response.sendRedirect("errorCampos.jsp");
                    }
                } else {
                    String [] arrayError = {"alta de administrador.","El nombre de usuario que esta intentando crear, no esta disponible, por favor elija otro.","altaAdministrador.jsp"};
                    miSession.setAttribute("arrayError", arrayError);
                    response.sendRedirect("errorCampos.jsp");
                }
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
