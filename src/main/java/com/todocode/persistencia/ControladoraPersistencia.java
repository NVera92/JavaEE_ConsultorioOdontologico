package com.todocode.persistencia;

import com.todocode.logica.Paciente;
import com.todocode.logica.Responsable;
import com.todocode.logica.Secretario;
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

    public Usuario traerUsuario(int id) {
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

    public List<Responsable> traerResponsables() {
        List<Responsable> listaResponsables = responsableJpaController.findResponsableEntities();
        return listaResponsables;
    }

    public Responsable traerResponsable(int id) {
        Responsable res = responsableJpaController.findResponsable(id);
        return res;
    }

    public void editarResponsable(Responsable res) {
        try {
            responsableJpaController.edit(res);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarResponsable(int id) {
        try {
            responsableJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearPaciente(Paciente paciente) {
        pacienteJpaController.create(paciente);
    }

    public List<Paciente> traerPacientes() {
        List<Paciente> listaPacientes = new ArrayList<>();
        listaPacientes = pacienteJpaController.findPacienteEntities();
        
        return listaPacientes;
    }

    public void eliminarPaciente(int id) {
        try {
            pacienteJpaController.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Paciente traerPaciente(int id) {
        Paciente paciente = pacienteJpaController.findPaciente(id);
        return paciente;
    }

    public void editarPaciente(Paciente paciente) {
        try {
            pacienteJpaController.edit(paciente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearSecretario(Secretario secretario) {
        secretarioJpaController.create(secretario);
    }

    public List<Secretario> traerSecretarios() {
        List<Secretario> listaSecretarios = new ArrayList<>();
        listaSecretarios = secretarioJpaController.findSecretarioEntities();
        return listaSecretarios;
    }

    public Secretario traerSecretario(int id) {
        Secretario secretario = new Secretario();
        secretario = secretarioJpaController.findSecretario(id);
        return secretario;
    }

    public void editarSecretario(Secretario secretario) {
        try {
            secretarioJpaController.edit(secretario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

    
    
    
    
    
}
