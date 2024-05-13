package com.todocode.servlets;

import com.todocode.logica.Controladora;
import com.todocode.logica.Odontologo;
import com.todocode.logica.Secretario;
import com.todocode.logica.Turno;
import com.todocode.logica.Usuario;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
            HttpSession user = request.getSession();
            Usuario u = (Usuario)user.getAttribute("usuarioLogueado");
            
            String [] contenido = new String [5];
            
            if(user != null){
                if(u.getRol().equalsIgnoreCase("administrador")){
                    int cantidadPacientes = controladora.contarPacientes();
                    int cantidadTurnos = controladora.contarTurnos();
                    int cantidadOdontologos = controladora.contarOdontologos();
                    int cantidadSecretarios = controladora.contarSecretarios();
                    contenido[0] = String.valueOf(cantidadPacientes);
                    contenido[1] = String.valueOf(cantidadTurnos);
                    contenido[2] = String.valueOf(cantidadOdontologos);
                    contenido[3] = String.valueOf(cantidadSecretarios);
                    HttpSession contenidoSession = request.getSession();
                    contenidoSession.setAttribute("contenido", contenido);
                    response.sendRedirect("index.jsp");
                }else if(u.getRol().equalsIgnoreCase("odontologo")){
                    Date d = Calendar.getInstance().getTime();
                    List<Turno> listaTurnos = controladora.traerTurnosDia(d);
                    Odontologo odontologo = controladora.traerOdontologoUsuario(u.getId_usuario());
                    HttpSession sessionOdontologo = request.getSession();
                    sessionOdontologo.setAttribute("odontologo", odontologo);
                    HttpSession sessionTurnos = request.getSession();
                    sessionTurnos.setAttribute("listaTurnos", listaTurnos);
                    response.sendRedirect("index.jsp");
                }else{
                    Date d = Calendar.getInstance().getTime();
                    List<Turno> listaTurnos = controladora.traerTurnosDia(d);
                    Secretario secretario = controladora.traerSecretarioUsuario(u.getId_usuario());
                    HttpSession sessionSecretario = request.getSession();
                    sessionSecretario.setAttribute("secretario", secretario);
                    HttpSession sessionTurnos = request.getSession();
                    sessionTurnos.setAttribute("listaTurnos", listaTurnos);
                    response.sendRedirect("index.jsp");
                }
            }else{
                response.sendRedirect("404.jsp");
            }
            
            
            
        }catch(Error e){
            System.out.println(e.getMessage());
            response.sendRedirect("404.jsp");
        }
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombreUsuario = request.getParameter("inputUsuario");
        String password = request.getParameter("inputPassword");
        

        boolean validation = false;
        validation = controladora.comprobarIngreso(nombreUsuario, password);
        
        Usuario usuarioLogueado = controladora.traerUsuarioNombre(nombreUsuario);
        
        if (validation == true) {
            HttpSession miSesion = request.getSession(true);
            miSesion.setAttribute("usuarioLogueado",usuarioLogueado );
            doGet(request, response);
        } else {
           
            response.sendRedirect("loginError.jsp");
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
