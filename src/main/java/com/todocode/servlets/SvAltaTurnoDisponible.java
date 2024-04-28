package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Odontologo;
import com.todocode.logica.Paciente;
import com.todocode.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvAltaTurnoDisponible", urlPatterns = {"/SvAltaTurnoDisponible"})
public class SvAltaTurnoDisponible extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String hora = request.getParameter("inputHora");

            Turno t = (Turno) request.getSession().getAttribute("turno");
            Paciente p = (Paciente) request.getSession().getAttribute("paciente");
            Odontologo o = (Odontologo) request.getSession().getAttribute("odontologo");

            /// Casteo de String a Date (Hora Turno)
            SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
            Date date1 = null;
            try {
                date1 = formatter.parse(hora);
            } catch (ParseException ex) {
                Logger.getLogger(SvAltaTurnoDisponible.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Casteo de String a Date (Hora Inicio)
            SimpleDateFormat formaterInicio = new SimpleDateFormat("HH:mm");
            Date dateInicio = null;
            try {
                dateInicio = formaterInicio.parse(o.getHorario_inicio());
            } catch (ParseException ex) {
                Logger.getLogger(SvAltaTurnoDisponible.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Casteo de String a Date (Hora Fin)
            SimpleDateFormat formaterFin = new SimpleDateFormat("HH:mm");
            Date dateFin = null;
            try {
                dateFin = formaterFin.parse(o.getHorario_fin());
            } catch (ParseException ex) {
                Logger.getLogger(SvAltaTurnoDisponible.class.getName()).log(Level.SEVERE, null, ex);
            }

            if (date1.after(dateInicio) && date1.before(dateFin)) {
                t.setHora_turno(hora);
                o.getLista_turnos().add(t);
                p.getLista_turnos().add(t);
                controladora.crearTurno(t);
                response.sendRedirect("SvVerTurnos");

            } else {
                String arrayError[] = {"alta de Turno", "El Dr. No trabaja en ese horario", "SvTurno"};
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
