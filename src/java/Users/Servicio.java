/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

/**
 *
 * @author Nameless
 */
public class Servicio {
    private int idServicio;        // ID único del servicio
    private String nombreservicio; // Nombre del servicio
    private double precio;         // Precio del servicio
    private String descripcion;    // Descripción del servicio

    public Servicio() {}

    public Servicio(int idServicio, String nombreservicio, double precio, String descripcion) {
        this.idServicio = idServicio;
        this.nombreservicio = nombreservicio;
        this.precio = precio;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public String getNombreservicio() {
        return nombreservicio;
    }

    public void setNombreservicio(String nombreservicio) {
        this.nombreservicio = nombreservicio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}