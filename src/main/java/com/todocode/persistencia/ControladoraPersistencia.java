package com.todocode.persistencia;

import com.todocode.logica.AES256;
import com.todocode.logica.Responsable;
import com.todocode.logica.Usuario;
import com.todocode.persistencia.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ControladoraPersistencia {
    
    OdontologoJpaController odontologoJpaController = new OdontologoJpaController();
    PacienteJpaController pacienteJpaController = new PacienteJpaController();
    PersonaJpaController personaJpaController = new PersonaJpaController();
    ResponsableJpaController responsableJpaController = new ResponsableJpaController();
    SecretarioJpaController secretarioJpaController = new SecretarioJpaController();
    TurnoJpaController turnoJpaController = new TurnoJpaController();
    UsuarioJpaController usuarioJpaController = new UsuarioJpaController();

    public ControladoraPersistencia() {
    }
    
    
    

    public void crearUsuario(Usuario usuario) {
        usuarioJpaController.create(usuario);
    }

    public List<Usuario> traerUsuarios() {
        return usuarioJpaController.findUsuarioEntities();
    }

    public void eliminarUsuario(int id) {
        try {
            usuarioJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuarios(int id) {
        return usuarioJpaController.findUsuario(id);
    }

    public void editarUsuario(Usuario usuario) {
        try {
            usuarioJpaController.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearResponsable(Responsable res) {
        responsableJpaController.create(res);
    }

    

    
    
    
    
    
}
