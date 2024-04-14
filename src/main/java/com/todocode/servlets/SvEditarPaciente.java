package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Paciente;
import com.todocode.logica.Responsable;
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

@WebServlet(name = "SvEditarPaciente", urlPatterns = {"/SvEditarPaciente"})
public class SvEditarPaciente extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String s = request.getParameter("id");
            int id = Integer.valueOf(s);

            Paciente paciente = controladora.traerPaciente(id);

            HttpSession pacienteSesion = request.getSession();
            pacienteSesion.setAttribute("paciente", paciente);

            List<Responsable> listaResponsables = controladora.traerResponsables();
            HttpSession responsablesSesion = request.getSession(true);
            responsablesSesion.setAttribute("listaResponsables", listaResponsables);

            response.sendRedirect("editarPaciente.jsp");
            
        } catch (Error e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            // Captura de datos
            String nombre = request.getParameter("inputNombre");
            String apellido = request.getParameter("inputApellido");
            String dni = request.getParameter("inputDni");
            String fecha = request.getParameter("inputFecha");
            String telefono = request.getParameter("inputTelefono");
            String direccion = request.getParameter("inputDireccion");
            String grupoSanguineo = request.getParameter("inputGrupoSanguineo");
            int idResponsable = Integer.valueOf(request.getParameter("inputResponsable"));
            
            
            // Obtencio del responsable
            Responsable responsable = new Responsable();
            if(idResponsable > 0){
                responsable = controladora.traerResponsable(idResponsable);
            }
            
            // Obtencion del paciente mediante sesion
            HttpSession sesionPaciente = request.getSession();
            Paciente p = (Paciente) sesionPaciente.getAttribute("paciente");
            
            p.setNombre(nombre);
            p.setApellido(apellido);
            p.setDni(dni);
            p.setTelefono(telefono);
            p.setDireccion(direccion);
            p.setTipo_sangre(grupoSanguineo);
            p.setResponsable(responsable);
            
            // Converison de String a Date y asignacion de fecha
            try {
                Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);
                p.setFecha_nacimiento(date1);
            } catch (ParseException ex) {
                Logger.getLogger(SvEditarPaciente.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            // Guardado en BBDD
            controladora.editarPaciente(p);
            
            // Redireccion a Ver Pacientes
            response.sendRedirect("SvVerPaciente");
        
        }catch(Error e){
            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
