package com.todocode.logica;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Secretario extends Persona {

    @Basic
    private String sector;
    @OneToOne
    private Usuario usuario_secretario;

    public Secretario() {
    }

    public Secretario(String sector, Usuario usuario_secretario, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.sector = sector;
        this.usuario_secretario = usuario_secretario;
    }

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public Usuario getUsuario_secretario() {
        return usuario_secretario;
    }

    public void setUsuario_secretario(Usuario usuario_secretario) {
        this.usuario_secretario = usuario_secretario;
    }

    @Override
    public String toString() {
        return "Secretario{" + "sector=" + sector + ", usuario_secretario=" + usuario_secretario + '}';
    }

    
}
