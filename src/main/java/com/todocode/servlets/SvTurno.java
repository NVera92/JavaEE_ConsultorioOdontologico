package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Odontologo;
import com.todocode.logica.Paciente;
import com.todocode.logica.Turno;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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

@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno"})
public class SvTurno extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<Paciente> listaPacientes = controladora.traerPacientes();
            List<Odontologo> listaOdontologos = controladora.traerOdontologos();

            HttpSession sesionPacientes = request.getSession();
            sesionPacientes.setAttribute("listaPacientes", listaPacientes);
            HttpSession sesionOdontologos = request.getSession();
            sesionOdontologos.setAttribute("listaOdontologos", listaOdontologos);

            response.sendRedirect("altaTurno.jsp");

        } catch (Error e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            /// Recolecciones de datos
            String fecha = request.getParameter("inputFecha");
            int idPaciente = Integer.parseInt(request.getParameter("inputPaciente"));
            int idOdontologo = Integer.parseInt(request.getParameter("inputOdontologo"));
            String afeccion = request.getParameter("inputAfeccion");

            /// Odontologo
            Odontologo odontologo = controladora.traerOdontologo(idOdontologo);

            /// Paciente
            Paciente paciente = controladora.traerPaciente(idPaciente);

            /// Creacion de Turno
            Turno turno = new Turno();
            turno.setOdontologo(odontologo);
            turno.setPaciente(paciente);
            turno.setAfeccion(afeccion);

            /// Casteo de String a Date
            Date dateAux;
            try {
                dateAux = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                Calendar cal = Calendar.getInstance();
                cal.setTime(dateAux);
                int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
                System.out.println("Dia de la semana: " + dayOfWeek);

                /// Verificar que sea de lunes a viernes
                if (dayOfWeek == 1 || dayOfWeek == 7) {
                    System.out.println("Fin de semana");
                    response.sendRedirect("index.jsp");
                } else {
                    System.out.println("Dia Laboral");
                    if (!odontologo.getLista_turnos().isEmpty()) {
                        List<Turno> listaTurnos = controladora.traerTurnosDia(dateAux);

                        if (!listaTurnos.isEmpty()) {
                            HttpSession sessionListaTurno = request.getSession();
                            sessionListaTurno.setAttribute("listaTurnos", listaTurnos);
                            HttpSession sessionOdontologo = request.getSession();
                            sessionOdontologo.setAttribute("odontologo", odontologo);
                            HttpSession sessionPaciente = request.getSession();
                            sessionPaciente.setAttribute("paciente", paciente);
                            turno.setFecha_turno(dateAux);
                            HttpSession sessionTurno = request.getSession();
                            sessionTurno.setAttribute("turno", turno);
                            response.sendRedirect("altaTurnoDisponibilidad.jsp");

                        } else {
                            HttpSession sessionListaTurno = request.getSession();
                            sessionListaTurno.setAttribute("listaTurnos", listaTurnos);
                            HttpSession sessionOdontologo = request.getSession();
                            sessionOdontologo.setAttribute("odontologo", odontologo);
                            HttpSession sessionPaciente = request.getSession();
                            sessionPaciente.setAttribute("paciente", paciente);
                            turno.setFecha_turno(dateAux);
                            HttpSession sessionTurno = request.getSession();
                            sessionTurno.setAttribute("turno", turno);
                            response.sendRedirect("altaTurnoDisponibilidad.jsp");
                            
                        }

                    } else {
                       
                            HttpSession sessionOdontologo = request.getSession();
                            sessionOdontologo.setAttribute("odontologo", odontologo);
                            HttpSession sessionPaciente = request.getSession();
                            sessionPaciente.setAttribute("paciente", paciente);
                            turno.setFecha_turno(dateAux);
                            HttpSession sessionTurno = request.getSession();
                            sessionTurno.setAttribute("turno", turno);
                            response.sendRedirect("altaTurnoHorario.jsp"); 
                    }

                }

            } catch (ParseException ex) {
                Logger.getLogger(SvTurno.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (Error e) {
            response.sendRedirect("404.jsp");
            System.out.println(e.getMessage());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
