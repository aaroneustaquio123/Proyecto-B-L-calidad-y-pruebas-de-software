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

public class ServicioDAO implements DAO<Servicio> {

    // Método para insertar un nuevo servicio
    @Override
    public void create(Servicio servicio) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta(); // Conexión a la base de datos
            String query = "INSERT INTO Servicio (nombreservicio, precio, descripcion) VALUES (?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, servicio.getNombreservicio());
            sentencia.setDouble(2, servicio.getPrecio());
            sentencia.setString(3, servicio.getDescripcion());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar servicio: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServicioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar un servicio existente
    @Override
    public void update(Servicio servicio) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE Servicio SET nombreservicio = ?, precio = ?, descripcion = ? WHERE idServicio = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, servicio.getNombreservicio());
            sentencia.setDouble(2, servicio.getPrecio());
            sentencia.setString(3, servicio.getDescripcion());
            sentencia.setInt(4, servicio.getIdServicio());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar servicio: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServicioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para eliminar un servicio por su ID
    public void delete(int idServicio) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM Servicio WHERE idServicio = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, idServicio);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar servicio: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServicioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para listar todos los servicios
    @Override
    public LinkedList<Servicio> list() {
        LinkedList<Servicio> servicios = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM Servicio";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Servicio servicio = new Servicio();
                servicio.setIdServicio(resultado.getInt("idServicio"));
                servicio.setNombreservicio(resultado.getString("nombreservicio"));
                servicio.setPrecio(resultado.getDouble("precio"));
                servicio.setDescripcion(resultado.getString("descripcion"));

                servicios.add(servicio);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar servicios: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServicioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return servicios;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}