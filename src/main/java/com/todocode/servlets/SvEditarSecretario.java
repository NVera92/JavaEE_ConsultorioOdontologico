package com.todocode.servlets;

import com.todocode.logica.AES256;
import com.todocode.logica.Controladora;
import com.todocode.logica.Secretario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvEditarSecretario", urlPatterns = {"/SvEditarSecretario"})
public class SvEditarSecretario extends HttpServlet {

    Controladora controladora = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Secretario secretario = controladora.traerSecretario(id);

            String pass = AES256.decrypt(secretario.getUsuario_secretario().getPassword_usuario(), secretario.getUsuario_secretario().getRol(), secretario.getUsuario_secretario().getNombre_usuario());
            secretario.getUsuario_secretario().setPassword_usuario(pass);

            HttpSession sesion = request.getSession();
            sesion.setAttribute("secretario", secretario);
            response.sendRedirect("editarSecretario.jsp");
        } catch (Error e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
