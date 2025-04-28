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

public class UsuarioDAO implements DAO<Usuario>{

    // Método para insertar un nuevo usuario
    @Override
    public void create(Usuario usuario) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta(); // Conexión a la base de datos
            String query = "INSERT INTO Usuario (nombre, apellido, email, numero, contraseña, genero) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, usuario.getNombre());
            sentencia.setString(2, usuario.getApellido());
            sentencia.setString(3, usuario.getEmail());
            sentencia.setString(4, usuario.getNumero());
            sentencia.setString(5, usuario.getContraseña());
            sentencia.setString(6, usuario.getGenero());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al insertar usuario: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para actualizar un usuario existente
    @Override
    public void update(Usuario usuario) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "UPDATE Usuario SET nombre = ?, apellido = ?, email = ?, numero = ?, contraseña = ?, genero = ? WHERE id = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setString(1, usuario.getNombre());
            sentencia.setString(2, usuario.getApellido());
            sentencia.setString(3, usuario.getEmail());
            sentencia.setString(4, usuario.getNumero());
            sentencia.setString(5, usuario.getContraseña());
            sentencia.setString(6, usuario.getGenero());
            sentencia.setInt(7, usuario.getId());

            sentencia.executeUpdate();
            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al actualizar usuario: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario login(String email, String contraseña) {
    Usuario usuario = null;

    try {
        Conexion c = new Conexion();
        Connection conn = c.conecta(); // Conexión a la base de datos
        String query = "SELECT * FROM Usuario WHERE email = ? AND contraseña = ?";

        PreparedStatement sentencia = conn.prepareStatement(query);
        sentencia.setString(1, email);
        sentencia.setString(2, contraseña);  // Asegúrate de verificar la contraseña correctamente (con hash si es necesario)

        ResultSet resultado = sentencia.executeQuery();

        // Si encontramos un resultado, creamos un objeto Usuario
        if (resultado.next()) {
            usuario = new Usuario();
            usuario.setId(resultado.getInt("id"));
            usuario.setNombre(resultado.getString("nombre"));
            usuario.setApellido(resultado.getString("apellido"));
            usuario.setEmail(resultado.getString("email"));
            usuario.setNumero(resultado.getString("numero"));
            usuario.setContraseña(resultado.getString("contraseña"));
            usuario.setGenero(resultado.getString("genero"));
        }

        sentencia.close();
        conn.close();
    } catch (SQLException e) {
        System.out.println("Error al hacer login: " + e.getMessage());
    } catch (ClassNotFoundException ex) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
    }

    return usuario;  // Si no se encuentra el usuario, retornará null
}

    
    
    // Método para eliminar un usuario por su ID
    public void delete(int id) {
        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "DELETE FROM Usuario WHERE id = ?";
            PreparedStatement sentencia = conn.prepareStatement(query);

            sentencia.setInt(1, id);
            sentencia.executeUpdate();

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al eliminar usuario: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para mostrar todos los usuarios
    @Override
    public LinkedList<Usuario> list() {
        LinkedList<Usuario> usuarios = new LinkedList<>();

        try {
            Conexion c = new Conexion();
            Connection conn = c.conecta();
            String query = "SELECT * FROM Usuario";
            Statement sentencia = conn.createStatement();
            ResultSet resultado = sentencia.executeQuery(query);

            while (resultado.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(resultado.getInt("id"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setEmail(resultado.getString("email"));
                usuario.setNumero(resultado.getString("numero"));
                usuario.setContraseña(resultado.getString("contraseña"));
                usuario.setGenero(resultado.getString("genero"));

                usuarios.add(usuario);
            }

            sentencia.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Error al listar usuarios: " + e.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuarios;
    }

    @Override
    public void delete(String codigo) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
