/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProveedorDAO implements DAO<Proveedor> {

    // Método para insertar un nuevo proveedor
    @Override
    public void create(Proveedor proveedor) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta(); // Conexión a la base de datos
            String query = "INSERT INTO Proveedor (nombre, ruc, telefono, direccion, descripcion) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, proveedor.getNombre());
            sentencia.setString(2, proveedor.getRuc());
            sentencia.setString(3, proveedor.getTelefono());
            sentencia.setString(4, proveedor.getDireccion());
            sentencia.setString(5, proveedor.getDescripcion());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar proveedor: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar un proveedor existente
    @Override
    public void update(Proveedor proveedor) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE Proveedor SET nombre = ?, ruc = ?, telefono = ?, direccion = ?, descripcion = ? WHERE idProveedor = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, proveedor.getNombre());
            sentencia.setString(2, proveedor.getRuc());
            sentencia.setString(3, proveedor.getTelefono());
            sentencia.setString(4, proveedor.getDireccion());
            sentencia.setString(5, proveedor.getDescripcion());
            sentencia.setInt(6, proveedor.getIdProveedor());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar proveedor: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para eliminar un proveedor por su ID
    public void delete(int idProveedor) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM Proveedor WHERE idProveedor = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, idProveedor);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar proveedor: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para listar todos los proveedores
    @Override
    public LinkedList<Proveedor> list() {
        LinkedList<Proveedor> proveedores = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM Proveedor";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Proveedor proveedor = new Proveedor();
                proveedor.setIdProveedor(resultado.getInt("idProveedor"));
                proveedor.setNombre(resultado.getString("nombre"));
                proveedor.setRuc(resultado.getString("ruc"));
                proveedor.setTelefono(resultado.getString("telefono"));
                proveedor.setDireccion(resultado.getString("direccion"));
                proveedor.setDescripcion(resultado.getString("descripcion"));

                proveedores.add(proveedor);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar proveedores: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProveedorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return proveedores;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}