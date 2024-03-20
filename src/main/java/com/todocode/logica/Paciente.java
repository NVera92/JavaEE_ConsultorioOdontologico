package com.todocode.logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Paciente extends Persona implements Serializable {

    @Basic
    private int id_paciente;
    private boolean posee_OS;
    private String tipo_sangre;
    @OneToOne
    private Responsable responsable;
    @OneToMany(mappedBy = "paciente")
    private List<Turno> lista_turnos;

    public Paciente() {
    }

    public Paciente(int id_paciente, boolean posee_OS, String tipo_sangre, Responsable responsable, List<Turno> lista_turnos, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.id_paciente = id_paciente;
        this.posee_OS = posee_OS;
        this.tipo_sangre = tipo_sangre;
        this.responsable = responsable;
        this.lista_turnos = lista_turnos;
    }

    public int getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(int id_paciente) {
        this.id_paciente = id_paciente;
    }

    public boolean isPosee_OS() {
        return posee_OS;
    }

    public void setPosee_OS(boolean posee_OS) {
        this.posee_OS = posee_OS;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public Responsable getResponsable() {
        return responsable;
    }

    public void setResponsable(Responsable responsable) {
        this.responsable = responsable;
    }

    public List<Turno> getLista_turnos() {
        return lista_turnos;
    }

    public void setLista_turnos(List<Turno> lista_turnos) {
        this.lista_turnos = lista_turnos;
    }

    @Override
    public String toString() {
        return "Paciente{" + "id_paciente=" + id_paciente + ", posee_OS=" + posee_OS + ", tipo_sangre=" + tipo_sangre + ", responsable=" + responsable + ", lista_turnos=" + lista_turnos + '}';
    }

}
