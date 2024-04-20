package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Secretario;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvSecretario", urlPatterns = {"/SvSecretario"})
public class SvSecretario extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{
            List<Secretario> listaSecretarios = controladora.traerSecretarios();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listaSecretarios", listaSecretarios);
            response.sendRedirect("verSecretarios.jsp");
        }catch(Error e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Recogiendo los datos
            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fecha = request.getParameter("inputFechaNacimiento");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");
            String sector = request.getParameter("inputSector");
            String nombreUsuario = request.getParameter("inputUsuario");
            String password0 = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");

            //Creacion del Secretario
            Secretario secretario = new Secretario();
            secretario.setNombre(nombre);
            secretario.setApellido(apellido);
            secretario.setDni(dni);

            // Casteo de String a Date
            Date dateAux;
            try {
                dateAux = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                secretario.setFecha_nacimiento(dateAux);
            } catch (ParseException ex) {
                Logger.getLogger(SvSecretario.class.getName()).log(Level.SEVERE, null, ex);
            }

            secretario.setTelefono(telefono);
            secretario.setDireccion(direccion);
            secretario.setSector(sector);

            // Creacion del Usuario del Secretario
            if (!controladora.existeUsuario(nombreUsuario)) {
                Usuario usuario = new Usuario();
                usuario.setNombre_usuario(nombreUsuario);

                // Comprobacion de que las passwords coincidan
                if (password0.equals(password1)) {
                    usuario.setPassword_usuario(password1);
                    usuario.setRol("secretario");
                    controladora.crearUsuario(usuario);
                    secretario.setUsuario_secretario(usuario);
                    controladora.crearSecretario(secretario);
                    doGet(request, response);
                } else {
                    String arrayError[] = {"alta de Secretario", "Contraseñas no coinciden, reintente.", "altaSecretario.jsp"};
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("arrayError", arrayError);
                    response.sendRedirect("errorCampos.jsp");
                }
                
                
                

            } else {
                String arrayError[] = {"alta de Secretario", "El nombre de usuario ya se encuentra registrado.", "altaSecretario.jsp"};
                HttpSession sesion = request.getSession();
                sesion.setAttribute("arrayError", arrayError);
                response.sendRedirect("errorCampos.jsp");
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
