/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.sql.Date;
import java.sql.Time;

public class Cita {

    private int idCita;
    private String empleado;
    private String servicio;
    private String sede;
    private Date fecha;
    private Time horaInicio;
    private Time horaFin;
    private String clienteNombre;
    private String estado;

    // Constructor
    public Cita(int idCita, String empleado, String servicio, String sede, Date fecha, 
                Time horaInicio, Time horaFin, String clienteNombre, String estado) {
        this.idCita = idCita;
        this.empleado = empleado;
        this.servicio = servicio;
        this.sede = sede;
        this.fecha = fecha;
        this.horaInicio = horaInicio;
        this.horaFin = horaFin;
        this.clienteNombre = clienteNombre;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public String getClienteNombre() {
        return clienteNombre;
    }

    public void setClienteNombre(String clienteNombre) {
        this.clienteNombre = clienteNombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    // VALIDACIONES AGREGADAS
    public static boolean validarEstado(String estado) {
        return estado.equalsIgnoreCase("Confirmado") || 
               estado.equalsIgnoreCase("Pendiente") || 
               estado.equalsIgnoreCase("Cancelado");
    }

    public static boolean validarClienteNombre(String clienteNombre) {
    // Solo letras y espacios, y mínimo nombre + apellido
    return clienteNombre.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ]+( [a-zA-ZáéíóúÁÉÍÓÚñÑ]+)+");
    }
    public static boolean validarHoras(Time inicio, Time fin) {
        // La hora de inicio debe ser antes de la hora de fin
        return inicio.before(fin);
    }
}

