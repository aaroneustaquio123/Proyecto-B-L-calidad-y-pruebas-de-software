package Users;

import java.sql.*;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.math.BigDecimal;

public class BoletasDAO implements DAO<Boletas> {

    @Override
    public void create(Boletas boleta) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "INSERT INTO boletas (cliente, fecha, total_bruto, igv, total_neto, metodo_pago, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, boleta.getCliente());
            sentencia.setDate(2, boleta.getFecha());
            sentencia.setBigDecimal(3, boleta.getTotalBruto());
            sentencia.setBigDecimal(4, boleta.getIgv());
            sentencia.setBigDecimal(5, boleta.getTotalNeto());
            sentencia.setString(6, boleta.getMetodoPago());
            sentencia.setString(7, boleta.getEstado());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar boleta: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BoletasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Boletas boleta) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE boletas SET cliente = ?, fecha = ?, total_bruto = ?, igv = ?, total_neto = ?, metodo_pago = ?, estado = ? WHERE id_boleta = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, boleta.getCliente());
            sentencia.setDate(2, boleta.getFecha());
            sentencia.setBigDecimal(3, boleta.getTotalBruto());
            sentencia.setBigDecimal(4, boleta.getIgv());
            sentencia.setBigDecimal(5, boleta.getTotalNeto());
            sentencia.setString(6, boleta.getMetodoPago());
            sentencia.setString(7, boleta.getEstado());
            sentencia.setInt(8, boleta.getIdBoleta());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar boleta: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BoletasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public void delete(int idBoleta) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM boletas WHERE id_boleta = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, idBoleta);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar boleta: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BoletasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public LinkedList<Boletas> list() {
        LinkedList<Boletas> boletas = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM boletas";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Boletas boleta = new Boletas(
                    resultado.getInt("id_boleta"),
                    resultado.getString("cliente"),
                    resultado.getDate("fecha"),
                    resultado.getBigDecimal("total_bruto"),
                    resultado.getBigDecimal("igv"),
                    resultado.getBigDecimal("total_neto"),
                    resultado.getString("metodo_pago"),
                    resultado.getString("estado")
                );

                boletas.add(boleta);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar boletas: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BoletasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return boletas;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}