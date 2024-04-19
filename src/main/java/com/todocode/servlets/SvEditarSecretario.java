package com.todocode.servlets;

import com.todocode.logica.AES256;
import com.todocode.logica.Controladora;
import com.todocode.logica.Secretario;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEditarSecretario", urlPatterns = {"/SvEditarSecretario"})
public class SvEditarSecretario extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Secretario secretario = controladora.traerSecretario(id);

            String pass = AES256.decrypt(secretario.getUsuario_secretario().getPassword_usuario(), secretario.getUsuario_secretario().getRol(), secretario.getUsuario_secretario().getNombre_usuario());
            secretario.getUsuario_secretario().setPassword_usuario(pass);

            HttpSession sesion = request.getSession();
            sesion.setAttribute("secretario", secretario);
            response.sendRedirect("editarSecretario.jsp");
        } catch (Error e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            // Recoleccion de datos del secretario
            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fecha = request.getParameter("inputNacimiento");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");

            // Recoleccion de datos del usuario
            String nombreUsuario = request.getParameter("inputUsuario");
            String password = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");

            // Traemos el secretario que esta en sesion
            Secretario secretario = (Secretario) request.getSession().getAttribute("secretario");

            // Reemplazamos los datos
            secretario.setNombre(nombre);
            secretario.setApellido(apellido);
            secretario.setDni(dni);

            // Conversion de String a Date
            Date dateAux;
            try {
                dateAux = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                secretario.setFecha_nacimiento(dateAux);
            } catch (ParseException ex) {
                Logger.getLogger(SvEditarSecretario.class.getName()).log(Level.SEVERE, null, ex);
            }

            secretario.setTelefono(telefono);
            secretario.setDireccion(direccion);

            Usuario usuario = secretario.getUsuario_secretario();

            if (!controladora.existeUsuario(nombreUsuario)) {
                usuario.setNombre_usuario(nombreUsuario);
                if (password.equals(password1)) {
                    usuario.setPassword_usuario(password);
                    controladora.editarUsuario(usuario);
                    secretario.setUsuario_secretario(usuario);
                } else {
                    String[] arrayError = {"edición de secretario", "Las contraseñas NO coinciden!!", "editarSecretario.jsp"};
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("arrayError", arrayError);
                }
            } else {
                String[] arrayError = {"edición de secretario", "El nombre de usuario ya existe, elija otro.", "editarSecretario.jsp"};
                HttpSession sesion = request.getSession();
                sesion.setAttribute("arrayError", arrayError);
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
