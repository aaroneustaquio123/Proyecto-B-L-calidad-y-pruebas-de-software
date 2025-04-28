package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CitaDAO implements DAO<Cita> {

    // Método para crear una nueva cita
    @Override
    public void create(Cita cita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "INSERT INTO citas (empleado, servicio, sede, fecha, hora_inicio, hora_fin, cliente_nombre, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, cita.getEmpleado());
            sentencia.setString(2, cita.getServicio());
            sentencia.setString(3, cita.getSede());
            sentencia.setDate(4, cita.getFecha());
            sentencia.setTime(5, cita.getHoraInicio());
            sentencia.setTime(6, cita.getHoraFin());
            sentencia.setString(7, cita.getClienteNombre());
            sentencia.setString(8, cita.getEstado());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar cita: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar una cita existente
    @Override
    public void update(Cita cita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE citas SET empleado = ?, servicio = ?, sede = ?, fecha = ?, hora_inicio = ?, hora_fin = ?, cliente_nombre = ?, estado = ? WHERE id_cita = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, cita.getEmpleado());
            sentencia.setString(2, cita.getServicio());
            sentencia.setString(3, cita.getSede());
            sentencia.setDate(4, cita.getFecha());
            sentencia.setTime(5, cita.getHoraInicio());
            sentencia.setTime(6, cita.getHoraFin());
            sentencia.setString(7, cita.getClienteNombre());
            sentencia.setString(8, cita.getEstado());
            sentencia.setInt(9, cita.getIdCita());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar cita: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para eliminar una cita por su ID

    public void delete(int idCita) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM citas WHERE id_cita = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, idCita);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar cita: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para listar todas las citas
    @Override
    public LinkedList<Cita> list() {
        LinkedList<Cita> citas = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM citas";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Cita cita = new Cita(
                    resultado.getInt("id_cita"),
                    resultado.getString("empleado"),
                    resultado.getString("servicio"),
                    resultado.getString("sede"),
                    resultado.getDate("fecha"),
                    resultado.getTime("hora_inicio"),
                    resultado.getTime("hora_fin"),
                    resultado.getString("cliente_nombre"),
                    resultado.getString("estado")
                );

                citas.add(cita);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar citas: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return citas;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}