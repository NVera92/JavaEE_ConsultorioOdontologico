package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Paciente;
import com.todocode.logica.Responsable;
import java.io.IOException;
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

@WebServlet(name = "SvPaciente", urlPatterns = {"/SvPaciente"})
public class SvPaciente extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Se captura la sesion y se enia el listado de responsables
            List<Responsable> listaResponsables = new ArrayList<>();
            listaResponsables = controladora.traerResponsables();

            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("listaResponsables", listaResponsables);

            response.sendRedirect("altaPaciente.jsp");

        } catch (Error e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fechaStr = request.getParameter("inputFecha");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");
            String grupoSanguineo = request.getParameter("inputGrupoSanguineo");
            int idResponsable = Integer.parseInt(request.getParameter("inputResponsable"));
            String poseeOs = request.getParameter("inputOs");

            Paciente paciente = new Paciente();

            paciente.setNombre(nombre);
            paciente.setApellido(apellido);
            paciente.setDni(dni);
            paciente.setTelefono(telefono);
            paciente.setDireccion(direccion);
            paciente.setTipo_sangre(grupoSanguineo);
            
            Responsable responsable = controladora.traerResponsable(idResponsable);
            paciente.setResponsable(responsable);

            // Paseo de string a boolean y comprobacion del estado
            if (poseeOs != null) {
                if (poseeOs.equals("on")) {
                    paciente.setPosee_OS(true);
                } else {
                    paciente.setPosee_OS(false);
                }
            }

            // Conversion de String a Date
            Date date1;
            try {
                date1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaStr);
                paciente.setFecha_nacimiento(date1);
            } catch (ParseException ex) {
                Logger.getLogger(SvResponsable.class.getName()).log(Level.SEVERE, null, ex);
            }

            controladora.crearPaciente(paciente);
            response.sendRedirect("SvVerPaciente");

        } catch (Error e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
