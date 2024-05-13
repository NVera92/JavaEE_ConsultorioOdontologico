package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Horario;
import com.todocode.logica.Odontologo;
import com.todocode.logica.Secretario;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@WebServlet(name = "SvOdontologo", urlPatterns = {"/SvOdontologo"})
public class SvOdontologo extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            List<Odontologo> listaOdontologos = new ArrayList<>();
            listaOdontologos = controladora.traerOdontologos();
            
            HttpSession sesion = request.getSession();
            sesion.setAttribute("listaOdontologos", listaOdontologos);
            response.sendRedirect("verOdontologos.jsp");
            
        }catch(Error e){
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            /// Recopilacion de datos de Odontologo
            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fecha = request.getParameter("inputFecha");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");
            String horaInicio = request.getParameter("inputHorarioInicio");
            String horaFin = request.getParameter("inputHorarioFin");
            String especialidad = request.getParameter("inputEspecialidad");

            /// Recopilacion de datos Usuario
            String nombreUsuario = request.getParameter("inputUsuario");
            String password0 = request.getParameter("inputPassword");
            String password1 = request.getParameter("inputPassword1");

            Odontologo odontologo = new Odontologo();

            /// Se asignan los valores Odontologo
            odontologo.setNombre(nombre);
            odontologo.setApellido(apellido);
            odontologo.setDni(dni);
            odontologo.setTelefono(telefono);
            odontologo.setDireccion(direccion);
            odontologo.setEspecialidad(especialidad);
            odontologo.setHorario_inicio(request.getParameter("inputHorarioInicio"));
            odontologo.setHorario_fin(request.getParameter("inputHorarioFin"));

            /// Casteo de String a Date
            Date dateaux;
            try {
                dateaux = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                odontologo.setFecha_nacimiento(dateaux);
            } catch (ParseException ex) {
                Logger.getLogger(SvOdontologo.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Creacion de Horario
            Horario horario = new Horario();
            horario.setHorario_inicio(request.getParameter("inputHorarioInicio"));
            horario.setHorario_fin(request.getParameter("inputHorarioFin"));
            controladora.crearHorario(horario);

            odontologo.setHorario(horario);

            /// Creacion de Usuario del Odontologo
            if (!controladora.existeUsuario(nombreUsuario)) {
                Usuario usuario = new Usuario();
                usuario.setNombre_usuario(nombreUsuario);

                // Comprobacion de que las passwords coincidan
                if (password0.equals(password1)) {
                    usuario.setPassword_usuario(password1);
                    usuario.setRol("odontologo");
                    controladora.crearUsuario(usuario);
                    odontologo.setUsuario_odontologo(usuario);
                    controladora.crearOdontologo(odontologo);
                    doGet(request, response);
                } else {
                    String arrayError[] = {"alta de Odontologo", "Contraseñas no coinciden, reintente.", "altaSecretario.jsp"};
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("arrayError", arrayError);
                    response.sendRedirect("errorCampos.jsp");
                }

            } else {
                String arrayError[] = {"alta de Odontologo", "El nombre de usuario ya se encuentra registrado.", "altaSecretario.jsp"};
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
