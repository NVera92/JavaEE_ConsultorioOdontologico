package com.todocode.logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Odontologo extends Persona implements Serializable {
    
    @Basic
    private String especialidad;
    private String horario_inicio;
    private String horario_fin;
    @OneToOne
    private Horario horario;
    @OneToMany(mappedBy = "odontologo")
    private List<Turno> lista_turnos;
    @OneToOne
    private Usuario usuario_odontologo;

    public Odontologo() {
    }

    public Odontologo(String especialidad, String horario_inicio, String horario_fin, Horario horario, List<Turno> lista_turnos, Usuario usuario_odontologo, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.especialidad = especialidad;
        this.horario_inicio = horario_inicio;
        this.horario_fin = horario_fin;
        this.horario = horario;
        this.lista_turnos = lista_turnos;
        this.usuario_odontologo = usuario_odontologo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public String getHorario_inicio() {
        return horario_inicio;
    }

    public void setHorario_inicio(String horario_inicio) {
        this.horario_inicio = horario_inicio;
    }

    public String getHorario_fin() {
        return horario_fin;
    }

    public void setHorario_fin(String horario_fin) {
        this.horario_fin = horario_fin;
    }

    public Horario getHorario() {
        return horario;
    }

    public void setHorario(Horario horario) {
        this.horario = horario;
    }

    public List<Turno> getLista_turnos() {
        return lista_turnos;
    }

    public void setLista_turnos(List<Turno> lista_turnos) {
        this.lista_turnos = lista_turnos;
    }

    public Usuario getUsuario_odontologo() {
        return usuario_odontologo;
    }

    public void setUsuario_odontologo(Usuario usuario_odontologo) {
        this.usuario_odontologo = usuario_odontologo;
    }

    @Override
    public String toString() {
        return "Odontologo{" + "especialidad=" + especialidad + ", horario_inicio=" + horario_inicio + ", horario_fin=" + horario_fin + ", horario=" + horario + ", lista_turnos=" + lista_turnos + ", usuario_odontologo=" + usuario_odontologo + '}';
    }
    
    
}
