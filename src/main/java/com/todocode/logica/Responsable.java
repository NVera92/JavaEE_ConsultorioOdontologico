package com.todocode.logica;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;

@Entity
public class Responsable extends Persona {

    @Basic
    private String tipo_responsabilidad;

    public Responsable() {
    }

    public Responsable(String tipo_responsabilidad, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fecha_nacimiento) {
        super(id, dni, nombre, apellido, telefono, direccion, fecha_nacimiento);
        this.tipo_responsabilidad = tipo_responsabilidad;
    }

    public String getTipo_responsabilidad() {
        return tipo_responsabilidad;
    }

    public void setTipo_responsabilidad(String tipo_responsabilidad) {
        this.tipo_responsabilidad = tipo_responsabilidad;
    }

    @Override
    public String toString() {
        return "Responsable{" + "tipo_responsabilidad=" + tipo_responsabilidad + '}';
    }

    
}
