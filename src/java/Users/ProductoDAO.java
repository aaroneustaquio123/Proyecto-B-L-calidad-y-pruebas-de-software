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

public class ProductoDAO implements DAO<Producto>{

    // Método para insertar un nuevo producto
    @Override
    public void create(Producto producto) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "INSERT INTO Productos (nombre, precio, stock, sede, descripcion) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, producto.getNombre());
            sentencia.setDouble(2, producto.getPrecio());
            sentencia.setInt(3, producto.getStock());
            sentencia.setString(4, producto.getSede());
            sentencia.setString(5, producto.getDescripcion());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar producto: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar un producto existente
    @Override
    public void update(Producto producto) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE Productos SET nombre = ?, precio = ?, stock = ?, sede = ?, descripcion = ? WHERE id_producto = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, producto.getNombre());
            sentencia.setDouble(2, producto.getPrecio());
            sentencia.setInt(3, producto.getStock());
            sentencia.setString(4, producto.getSede());
            sentencia.setString(5, producto.getDescripcion());
            sentencia.setInt(6, producto.getId());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar producto: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para eliminar un producto por su ID
    public void delete(int id) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM Productos WHERE id_producto = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, id);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar producto: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para listar todos los productos
    @Override
    public LinkedList<Producto> list() {
        LinkedList<Producto> productos = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM Productos";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Producto producto = new Producto();
                producto.setId(resultado.getInt("id_producto"));
                producto.setNombre(resultado.getString("nombre"));
                producto.setPrecio(resultado.getDouble("precio"));
                producto.setStock(resultado.getInt("stock"));
                producto.setSede(resultado.getString("sede"));
                producto.setDescripcion(resultado.getString("descripcion"));

                productos.add(producto);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar productos: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return productos;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}