package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Responsable;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvResponsable", urlPatterns = {"/SvResponsable"})
public class SvResponsable extends HttpServlet {

    private Controladora controladora = new Controladora();

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

        String nombre = request.getParameter("inputNombre");
        String apellido = request.getParameter("inputApellido");
        String dni = request.getParameter("inputDni");
        String fechaNacimiento = request.getParameter("inputFecha");
        String telefono = request.getParameter("inputTelefono");
        String direccion = request.getParameter("inputDireccion");
        String responsabilidad = request.getParameter("inputResponsabilidad");

        Responsable res = new Responsable();

        res.setNombre(nombre);
        res.setApellido(apellido);
        res.setDni(dni);
        
        

        // Conversion de String a Date
        Date date1;
        try {
            date1 = new SimpleDateFormat("yyyy-MM-dd").parse(fechaNacimiento);
            res.setFecha_nacimiento(date1);
        } catch (ParseException ex) {
            Logger.getLogger(SvResponsable.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        res.setTelefono(telefono);
        res.setDireccion(direccion);
        res.setTipo_responsabilidad(responsabilidad);

        

        controladora.crearResponsable(res);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
