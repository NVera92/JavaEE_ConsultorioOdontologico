package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    private Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Usuario> listaUsuaraios = new ArrayList<Usuario>();
        
        listaUsuaraios = controladora.traerUsuarios();  
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaUsuarios", listaUsuaraios);
        
        response.sendRedirect("verUsuarios.jsp");
    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
        String nombreUsuario = request.getParameter("inputUsuario");
        String especialidad = request.getParameter("inputRol");
        String password = request.getParameter("inputPassword");
        String password1 = request.getParameter("inputPassword1");
        
        Usuario usuario = new Usuario();
        
        usuario.setNombre_usuario(nombreUsuario);
        usuario.setRol(especialidad);
        
        if(password.equals(password1)){
            usuario.setPassword_usuario(password);
            controladora.crearUsuario(usuario);
        }else{
            System.out.println("Error en validacion de password");
        }
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
