/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    // Datos de conexión a la base de datos
    private final String dbURL = "jdbc:mysql://localhost:3306/bdBarberia";
    private final String dbUser = "root"; // Usuario de la base de datos
    private final String dbPassword = "123456789"; // Contraseña de la base de datos

    // Método para establecer la conexión
    public Connection conecta() throws ClassNotFoundException, SQLException {
        // Cargar el driver JDBC de MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Establecer la conexión
        return DriverManager.getConnection(dbURL, dbUser, dbPassword);
    }
}
