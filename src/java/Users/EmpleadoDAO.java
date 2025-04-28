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

public class EmpleadoDAO implements DAO<Empleado> {

    // Método para insertar un nuevo empleado
    @Override
    public void create(Empleado empleado) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta(); // Conexión a la base de datos
            String query = "INSERT INTO Empleado (nombre, apellido, correo, especialidad, telefono) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, empleado.getNombre());
            sentencia.setString(2, empleado.getApellido());
            sentencia.setString(3, empleado.getCorreo());
            sentencia.setString(4, empleado.getEspecialidad());
            sentencia.setString(5, empleado.getTelefono());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar empleado: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar un empleado existente
    @Override
    public void update(Empleado empleado) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE Empleado SET nombre = ?, apellido = ?, correo = ?, especialidad = ?, telefono = ? WHERE id = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, empleado.getNombre());
            sentencia.setString(2, empleado.getApellido());
            sentencia.setString(3, empleado.getCorreo());
            sentencia.setString(4, empleado.getEspecialidad());
            sentencia.setString(5, empleado.getTelefono());
            sentencia.setInt(6, empleado.getId());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar empleado: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para eliminar un empleado por su ID
    public void delete(int id) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM Empleado WHERE id = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, id);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar empleado: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para listar todos los empleados
    @Override
    public LinkedList<Empleado> list() {
        LinkedList<Empleado> empleados = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM Empleado";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Empleado empleado = new Empleado();
                empleado.setId(resultado.getInt("id"));
                empleado.setNombre(resultado.getString("nombre"));
                empleado.setApellido(resultado.getString("apellido"));
                empleado.setCorreo(resultado.getString("correo"));
                empleado.setEspecialidad(resultado.getString("especialidad"));
                empleado.setTelefono(resultado.getString("telefono"));

                empleados.add(empleado);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar empleados: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EmpleadoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return empleados;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}