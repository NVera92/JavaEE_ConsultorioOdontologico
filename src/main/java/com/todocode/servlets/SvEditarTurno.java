
package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Turno;
import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet(name = "SvEditarTurno", urlPatterns = {"/SvEditarTurno"})
public class SvEditarTurno extends HttpServlet {

    Controladora controladora = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            int id = Integer.valueOf(request.getParameter("id"));
            Turno turno = controladora.traerTurno(id);
            HttpSession session = request.getSession();
            session.setAttribute("turno", turno);
            response.sendRedirect("editarTurno.jsp");
        }catch(Error e){
            System.out.println(e.getMessage());
        }
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            /// Recoleccion de datos
            Turno turno = (Turno)request.getSession().getAttribute("turno");
            String fecha = request.getParameter("inputFecha");
            String afeccion = request.getParameter("inputAfeccion");
            
            Date turnoDate = new Date();
            try {
                /// Casteo de String a Date
                turnoDate = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                
            } catch (ParseException ex) {
                Logger.getLogger(SvEditarTurno.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            List<Turno> listaTurnos = new ArrayList<>();
            
           if(!turno.getOdontologo().getLista_turnos().isEmpty()){
               for(Turno t : turno.getOdontologo().getLista_turnos()){
                   if(t.getFecha_turno().equals(turnoDate)){
                       listaTurnos.add(t);
                   }
               }
           }
           
           HttpSession sessionFecha = request.getSession();
           sessionFecha.setAttribute("fecha", fecha);
           
           HttpSession sessionTurno = request.getSession();
           sessionTurno.setAttribute("listaTurnos", listaTurnos);
           response.sendRedirect("editarTurnoDisponibilidad.jsp");
           
        }catch(Error e){
            System.out.println(e.getMessage());
            response.sendRedirect("index.jsp");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
