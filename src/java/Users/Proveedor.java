/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

/**
 *
 * @author Nameless
 */

public class Proveedor {
    private int idProveedor;      // ID único del proveedor
    private String nombre;        // Nombre del proveedor
    private String ruc;           // RUC del proveedor
    private String telefono;      // Teléfono del proveedor
    private String direccion;     // Dirección del proveedor
    private String descripcion;   // Descripción del proveedor

    public Proveedor() {}

    public Proveedor(int idProveedor, String nombre, String ruc, String telefono, String direccion, String descripcion) {
        this.idProveedor = idProveedor;
        this.nombre = nombre;
        this.ruc = ruc;
        this.telefono = telefono;
        this.direccion = direccion;
        this.descripcion = descripcion;
    }

    // Getters y Setters
    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}