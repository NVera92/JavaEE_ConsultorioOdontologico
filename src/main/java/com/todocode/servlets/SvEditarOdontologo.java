package com.todocode.servlets;

import com.todocode.logica.AES256;
import com.todocode.logica.Controladora;
import com.todocode.logica.Odontologo;
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


@WebServlet(name = "SvEditarOdontologo", urlPatterns = {"/SvEditarOdontologo"})
public class SvEditarOdontologo extends HttpServlet {

    Controladora controladora = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            Odontologo odontologo = controladora.traerOdontologo(id);
            String pass = AES256.decrypt(odontologo.getUsuario_odontologo().getPassword_usuario(), odontologo.getUsuario_odontologo().getRol(), odontologo.getUsuario_odontologo().getNombre_usuario());
            odontologo.getUsuario_odontologo().setPassword_usuario(pass);
            HttpSession session = request.getSession();
            session.setAttribute("odontologo", odontologo);
            response.sendRedirect("editarOdontologo.jsp");
            
        }catch(Error e){
            System.out.println(e.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {

            // Recoleccion de datos del Odontologo
            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fecha = request.getParameter("inputNacimiento");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");
            String especialidad = request.getParameter("inputEspecialidad");

            // Recoleccion de datos del Usuario
            String nombreUsuario = request.getParameter("inputUsuario");
            String password = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");

            // Traemos el secretario que esta en sesion
            Odontologo odontologo = (Odontologo) request.getSession().getAttribute("odontologo");

            // Reemplazamos los datos
            odontologo.setNombre(nombre);
            odontologo.setApellido(apellido);
            odontologo.setDni(dni);

            // Conversion de String a Date
            Date dateAux;
            try {
                dateAux = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                odontologo.setFecha_nacimiento(dateAux);
            } catch (ParseException ex) {
                Logger.getLogger(SvEditarSecretario.class.getName()).log(Level.SEVERE, null, ex);
            }

            odontologo.setTelefono(telefono);
            odontologo.setDireccion(direccion);
            odontologo.setEspecialidad(especialidad);

            Usuario usuario = odontologo.getUsuario_odontologo();

            boolean flagUsuario = false;
            boolean flagRedirect = false;

            /// Comprobacion de cambios en el nombre del Usuario
            if (!usuario.getNombre_usuario().equals(nombreUsuario)) {
                if (!controladora.existeUsuario(nombreUsuario)) {
                    usuario.setNombre_usuario(nombreUsuario);
                    flagUsuario = true;
                } else {
                    flagRedirect = true;
                    String idString = String.valueOf(odontologo.getId());
                    String[] arrayError = {"edición de secretario", "El nombre de usuario elegido NO se encuentra disponible, por favor escoja otro.", "SvEditarOdontologo", idString};
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("arrayError", arrayError);
                    response.sendRedirect("errorCampos.jsp");
                }
            }

            /// Comprobando cambios en password del Ususario
            if (password.equals(password1)) {
                usuario.setPassword_usuario(password1);
                flagUsuario = true;
            } else {
                flagRedirect = true;
                String idString = String.valueOf(odontologo.getId());
                String[] arrayError = {"edición de secretario", "Las contraseñas NO coinciden!!", "SvEditarOdontologo", idString};
                HttpSession sesion = request.getSession();
                sesion.setAttribute("arrayError", arrayError);
                response.sendRedirect("errorCampos.jsp");
            }

            /// Comprueba si hubo cambios en Usuario
            if (flagUsuario) {
                /// Impactar los cambios en Usuario
                controladora.editarUsuario(usuario);
                /// Impactar Usuario en Secretario
                odontologo.setUsuario_odontologo(usuario);
            }

            if (!flagRedirect) {
                /// Impactar cambios en Odontologo
                controladora.editarOdontologo(odontologo);

                /// Redireccion a lista de Odontologos
                response.sendRedirect("SvOdontologo");
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
