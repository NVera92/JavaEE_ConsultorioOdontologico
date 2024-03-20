
package com.todocode.logica;

import com.todocode.persistencia.ControladoraPersistencia;
import java.util.ArrayList;
import java.util.List;
import jdk.javadoc.internal.doclets.toolkit.util.Utils;


public class Controladora {
    
    ControladoraPersistencia controladoraPersistencia = new ControladoraPersistencia();

    public Controladora() {
    }
    
    
    

    public void crearUsuario(Usuario usuario) {
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
        controladoraPersistencia.editarUsuario(usuario);
    }

    public boolean comprobarIngreso(String nombreUsuario, String password) {
        boolean flag = false;
        
        List<Usuario> listaUsuarios = new ArrayList<>();
        listaUsuarios = controladoraPersistencia.traerUsuarios();
        
        
        for(Usuario usuario : listaUsuarios){
            if(usuario.getNombre_usuario().equals(nombreUsuario)){
                String decrypt = AES256.decrypt(usuario.getPassword_usuario(), usuario.getRol(), usuario.getNombre_usuario());
                if(password.equals(decrypt)){
                    flag = true;
                }
            }
        }
        return flag;
    }
 
}
