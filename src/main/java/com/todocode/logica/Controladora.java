package com.todocode.logica;
import com.todocode.persistencia.ControladoraPersistencia;
import java.util.ArrayList;
import java.util.List;

public class Controladora {

    ControladoraPersistencia controladoraPersistencia = new ControladoraPersistencia();

    public Controladora() {
    }

    public void crearUsuario(Usuario usuario) {
        String encrytpPassword = AES256.encrypt(usuario.getPassword_usuario(), usuario.getRol(), usuario.getNombre_usuario());
        usuario.setPassword_usuario(encrytpPassword);
        controladoraPersistencia.crearUsuario(usuario);
    }

    public List<Usuario> traerUsuarios() {
        return controladoraPersistencia.traerUsuarios();
    }

    public void eliminarUsuario(int id) {
        controladoraPersistencia.eliminarUsuario(id);
    }

    public Usuario traerUsuarios(int id) {
        return controladoraPersistencia.traerUsuarios(id);
    }

    public void editarUsuario(Usuario usuario) {
        String encrytpPassword = AES256.encrypt(usuario.getPassword_usuario(), usuario.getRol(), usuario.getNombre_usuario());
        usuario.setPassword_usuario(encrytpPassword);
        controladoraPersistencia.editarUsuario(usuario);
    }

    public boolean comprobarIngreso(String nombreUsuario, String password) {
        boolean flag = false;

        List<Usuario> listaUsuarios = new ArrayList<>();
        listaUsuarios = controladoraPersistencia.traerUsuarios();

        for (Usuario usuario : listaUsuarios) {
            if (usuario.getNombre_usuario().equals(nombreUsuario)) {
                String decrypt = AES256.decrypt(usuario.getPassword_usuario(), usuario.getRol(), usuario.getNombre_usuario());
                if (password.equals(decrypt)) {
                    flag = true;
                }
            }
        }
        return flag;
    }

    public Usuario traerUsuarioNombre(String nombreUsuario) {
        List<Usuario> listaUsuarios = controladoraPersistencia.traerUsuarios();
        Usuario usuario = new Usuario();
        try {

            for (Usuario u : listaUsuarios) {
                if (u.getNombre_usuario().equals(nombreUsuario)) {
                    usuario = u;
                }
            }

        } catch (Error e) {
            System.out.println(e.getMessage());
        }
        return usuario;
    }

    public boolean existeUsuario(String nombreUsuario) {
        boolean flag = false;
        try {
            List<Usuario> listaUsuarios = controladoraPersistencia.traerUsuarios();
            for (Usuario u : listaUsuarios) {
                if (u.getNombre_usuario().equalsIgnoreCase(nombreUsuario)) {
                    flag = true;
                }
            }
        } catch (Error e) {
            System.out.println(e.getMessage());
        }

        return flag;
    }

    public void crearResponsable(Responsable res) {
        controladoraPersistencia.crearResponsable(res);
    }

    public List<Responsable> traerResponsables() {
        List<Responsable> listaResponsables = controladoraPersistencia.traerResponsables();
        return listaResponsables;
    }

    public Responsable traerResponsable(int id) {
        Responsable res = controladoraPersistencia.traerResponsable(id);
        return res;
    }

    public void editarResponsable(Responsable res) {
        controladoraPersistencia.editarResponsable(res);
    }

    public void eliminarResponsable(int id) {
        controladoraPersistencia.eliminarResponsable(id);
    }

}
