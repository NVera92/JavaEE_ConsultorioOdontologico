package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvEditarTurnoConfirmado", urlPatterns = {"/SvEditarTurnoConfirmado"})
public class SvEditarTurnoConfirmado extends HttpServlet {

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

            Turno t = (Turno) request.getSession().getAttribute("turno");
            List<Turno> listaT = (List) request.getSession().getAttribute("listaTurnos");
            String fecha = request.getParameter("inputFecha");
            String hora = request.getParameter("inputHora");
            String afeccion = request.getParameter("inputAfeccion");
            
            
            

            Date f = null;
            try {
                /// Casteo de String a Date
                f = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);

            } catch (ParseException ex) {
                Logger.getLogger(SvEditarTurnoConfirmado.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Casteo de String a Hora
            Date aux1 = null;
            try {
                aux1 = new SimpleDateFormat("HH:mm").parse(hora);

            } catch (ParseException ex) {
                Logger.getLogger(SvEditarTurnoConfirmado.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Casteo de String a Hora
            Date aux2 = null;
            try {
                aux2 = new SimpleDateFormat("HH:mm").parse(t.getHora_turno());

            } catch (ParseException ex) {
                Logger.getLogger(SvEditarTurnoConfirmado.class.getName()).log(Level.SEVERE, null, ex);
            }

            /// Validar que no se pisen los turnos
            if (!listaT.isEmpty()) {
                for (Turno tu : listaT) {
                    if (tu.getFecha_turno().equals(f)) {
                        if (aux1.before(aux2)) {
                            t.setHora_turno(hora);
                            t.setFecha_turno(f);
                            t.setAfeccion(afeccion);
                            controladora.editarTurno(t);

                        }
                    }
                }
            } else {
                t.setHora_turno(hora);
                t.setFecha_turno(f);
                t.setAfeccion(afeccion);
                controladora.editarTurno(t);
            }

            response.sendRedirect("SvVerTurnos");
            
        } catch (Error e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
